using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_myRSVP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int _id = 0;
        using (event2Entities myEntities = new event2Entities())
        {
            if (Session["userid"]!=null)
            {
                _id = Convert.ToInt32(Session["userid"]);

          var  allTypes = from eveType in myEntities.eventTypes
                          join oneEvent in myEntities.events on eveType.Id equals oneEvent.type
                          
                               where (oneEvent.status == 1 
                               && oneEvent.time > DateTime.Now)
                           select new { eveType.events };
             

            var RSVP = from oneRSVP in myEntities.reservations.Include("event")
                       where oneRSVP.userid ==_id
                  select oneRSVP;
                     rptCategory.DataSource =RSVP.ToList();
                    
            }
            rptCategory.DataBind();
        }
    }


    protected void cancelBtn_Click(object sender, EventArgs e)
    {

    }
}