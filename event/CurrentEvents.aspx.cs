using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AllByCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // string userType = "2";
            //Session["usertype"].ToString();
       // if (userType != "2")
       // {
        //    Response.Redirect("~/PermissionError.aspx");
       // }
       // else { 
        using (event2Entities myEntities = new event2Entities()) {

            var allTypes = from eveType in myEntities.eventTypes
                          join oneEvent in myEntities.events on eveType.Id equals oneEvent.type
                               where oneEvent.status==1
                           select new { eveType.events };

            rptCategory.DataSource = allTypes.ToList();
            rptCategory.DataBind();
        }
       //}
    }
}