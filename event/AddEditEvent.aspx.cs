using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_AddEditEvent : System.Web.UI.Page
{
    int _id = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("id")))
        {
            int _id = Convert.ToInt32(Request.QueryString.Get("Id"));
            using (event2Entities myEntity = new event2Entities())
            {
                var oneEvent = (from ev in myEntity.events
                           where ev.id == _id
                           select ev).SingleOrDefault();

                if (oneEvent != null)
                {
                    txtName.Text = oneEvent.name;
                    txtDescription.Text = oneEvent.description;
                    txtLocation.Text = oneEvent.location;
                    txtFee.Text = Convert.ToString(oneEvent.fee);
                    txtTime.Text = Convert.ToString(oneEvent.time);
                    txtDuration.Text = Convert.ToString(oneEvent.duration);
                    txtDeadline.Text = Convert.ToString(oneEvent.deadline);
                    txtOrganizer.Text = Convert.ToString(oneEvent.organizer);
                    ddlType.SelectedValue = oneEvent.type.ToString();
                }
            }

        }
    }


    public IEnumerable<eventType> ddlType_GetData()
    {
        using (event2Entities myEntities = new event2Entities())
        {
            return (from type in myEntities.eventTypes
                    select type).ToList();

        }
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (event2Entities myEntities = new event2Entities())
        {
            @event myEvent;
            if (_id == -1)
            {
                myEvent = new @event();
                myEvent.name = txtName.Text;
                myEvent.description = txtDescription.Text;
                myEvent.location = txtLocation.Text;
                myEvent.fee = Convert.ToInt32(txtFee.Text);
                myEvent.time = Convert.ToDateTime(txtTime.Text);
                    
                myEvent.duration = Convert.ToInt32(txtDuration.Text);
                myEvent.deadline = Convert.ToDateTime(txtDeadline.Text);
                myEvent.organizer = txtOrganizer.Text;
                myEvent.type= Convert.ToInt32(ddlType.SelectedValue);
                myEntities.events.Add(myEvent);


                Response.Redirect("~/event/CurrentEvents.aspx");
            }
            else
            {
                myEvent = (from ev in myEntities.events
                                where ev.id == _id
                                select ev).SingleOrDefault();
              

          
            }
        
}
    }
}