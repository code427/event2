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
                var allTypesApp = from eveType in myEntities.eventTypes
                                  join oneEvent in myEntities.events on eveType.Id equals oneEvent.type
                                  where oneEvent.status == 0
                                  select new { eveType.events };
                rptCategory.DataSource = allTypesApp.ToList();

            }
            else if (!string.IsNullOrEmpty(Request.QueryString.Get("archivedEvent")))
            {
                var allArchived = from eveType in myEntities.eventTypes
                               join oneEvent in myEntities.events on eveType.Id equals oneEvent.type
                               where (oneEvent.status == 1
                               && oneEvent.time <= DateTime.Now)
                               select new { eveType.events };

                rptCategory.DataSource = allArchived.ToList();
            }
            else{

            var allTypes = from eveType in myEntities.eventTypes
                          join oneEvent in myEntities.events on eveType.Id equals oneEvent.type
                               where (oneEvent.status == 1 
                               && oneEvent.time > DateTime.Now)
                           select new { eveType.events };

            rptCategory.DataSource = allTypes.ToList();

            } 
            rptCategory.DataBind();
        }
       //}
    }
}