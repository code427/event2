using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_allReservations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        using (event2Entities myEntities = new event2Entities())
        {

                var allReservations = from e2 in myEntities.reservations.Include("event")
                                  select e2;
                rptCategory.DataSource = allReservations.ToList();

            
            rptCategory.DataBind();
        }
    }
}