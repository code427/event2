using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//created by Pranali

public partial class event_RSVP : System.Web.UI.Page
{
    //populate user info
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!string.IsNullOrEmpty(Request.QueryString.Get("eventName"))){
                eventNamelbl.Text=Request.QueryString.Get("eventName");
        }

        int userid = Convert.ToInt32(Session["userid"]);
        int eventid = Convert.ToInt32(Request.QueryString.Get("eventid"));



        using (event2Entities myEntity = new event2Entities()) 
        {
            var oneUser = (from u in myEntity.users
                           where u.id == userid
                            select u).SingleOrDefault();

            if (oneUser != null)
            {
                firstName.Text = oneUser.name;
                lastName.Text = oneUser.name;
                CWID.Text = oneUser.CWID;
                email.Text = oneUser.email;
            }
        }

    }

    //detect duplicate rsvp, and reserve a event
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"]);
        int eventid = Convert.ToInt32(Request.QueryString.Get("eventid"));

        using (event2Entities myEntity = new event2Entities())
        {
            var res1 = (from u in myEntity.reservations
                        where u.userid == userid
                        && u.eventid == eventid
                        select u).SingleOrDefault();

            if (res1 != null)
            {
                ErrorMessage.Text = "Already reserved";
            }
            else
            {
                reservation res = new reservation();
                res.userid = Convert.ToInt32(Session["userid"]);
                res.eventid = Convert.ToInt32(Request.QueryString.Get("eventid"));
                res.registerTime = DateTime.Now;
                res.firstName = firstName.Text;
                res.lastName = lastName.Text;

                myEntity.reservations.Add(res);
                myEntity.SaveChanges();
                Response.Redirect("~/event/currentEvents.aspx");

            }
        }

    }
}