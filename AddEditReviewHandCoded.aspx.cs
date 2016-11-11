using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_AddEditReviewHandCoded : System.Web.UI.Page
{
    int _id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("ReviewId"))) {
            _id = Convert.ToInt32(Request.QueryString.Get("ReviewId"));
        }

        if (!IsPostBack && _id > -1) {
            using (PlanetWroxEntities myEntities = new PlanetWroxEntities())
            {
                var review = (from r in myEntities.Reviews
                              where r.Id == _id
                              select r).SingleOrDefault();

                if (review != null) {
                    txtTitle.Text = review.Title;
                    txtSummary.Text = review.Summary;
                    txtBody.Text = review.Body;
                    ddlGenre.DataBind();
                    ListItem myItem = ddlGenre.Items.FindByValue(review.GenreId.ToString());
                    myItem.Selected = true;
                    ckbAuthorized.Checked = review.Authorized;
                }
            }
        }
        
    }

    public IEnumerable<Genre> ddlGenre_GetData(){
        using (PlanetWroxEntities myEntities = new PlanetWroxEntities()) {
            return (from genere in myEntities.Genres
                    orderby genere.SortOrder
                    select genere).ToList();

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (PlanetWroxEntities myEntities = new PlanetWroxEntities()) {
            Review myReview;
            if (_id == -1)
            {
                myReview = new Review();
                myReview.CreateDateTime = DateTime.Now;
                myReview.UpdateDateTime = myReview.CreateDateTime;
                myEntities.Reviews.Add(myReview);
            }
            else {
                myReview = (from r in myEntities.Reviews
                            where r.Id == _id
                            select r).Single();

                myReview.UpdateDateTime = DateTime.Now;

            }

            myReview.Title = txtTitle.Text;
            myReview.Summary = txtSummary.Text;
            myReview.Body = txtBody.Text;
            myReview.GenreId = Convert.ToInt32(ddlGenre.SelectedValue);
            myReview.Authorized = ckbAuthorized.Checked;

            myEntities.SaveChanges();
            Response.Redirect("Reviews.aspx");
        }
    }
}