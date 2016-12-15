using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (event2Entities myEntities = new event2Entities())
        {

            var report = from ev in myEntities.events
                         group ev by ev.eventType.Name into grouping
                         select new { Key = grouping.Key, Count = grouping.Count()};
                       
 
               
              
            rptCategory.DataSource = report.ToList();

            rptCategory.DataBind();
        }
    }
}