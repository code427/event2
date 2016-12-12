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
   
        using (event2Entities myEntities = new event2Entities()) {

            if (!string.IsNullOrEmpty(Request.QueryString.Get("manageApplication")))
            {
                var allTypesApp = from e2 in myEntities.events.Include("eventType")
                                  where e2.status == 0 
                                  select e2;
                rptCategory.DataSource = allTypesApp.ToList();

            }
            else if (!string.IsNullOrEmpty(Request.QueryString.Get("archivedEvent")))
            {
                var allArchived = from e2 in myEntities.events.Include("eventType")
                                  where e2.time <DateTime.Now
                                  select e2;

                rptCategory.DataSource = allArchived.ToList();
            }
            else{

            var allTypes2 = from e2 in myEntities.events.Include("eventType")
                            where e2.status==1 && e2.time > DateTime.Now
                            select e2;

            rptCategory.DataSource = allTypes2.ToList();
               
                
            } 
            rptCategory.DataBind();
        }
      
    }
}