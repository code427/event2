using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Web.ModelBinding;

//created by Zhengdong
//get event details
public partial class event_AddEditEvent : System.Web.UI.Page
{
    int _id = -1;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request.QueryString.Get("eventid")))
        {
            _id = Convert.ToInt32(Request.QueryString.Get("eventid"));
        }
        if(!IsPostBack && _id>-1) {
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

    //fill drop down list
    public IEnumerable<eventType> ddlType_GetData()
    {
        using (event2Entities myEntities = new event2Entities())
        {
            return (from type in myEntities.eventTypes
                    select type).ToList();

        }
    }


    //save event detail
    protected void btnSave_Click(object sender, EventArgs e)
    {
      
        using (event2Entities myEntities = new event2Entities())
        {
            @event myEvent;
            if (_id == -1)
            {            
                myEvent = new @event();
                myEntities.events.Add(myEvent);
            }
            else
            {
                myEvent = (from ev in myEntities.events
                                where ev.id == _id
                                select ev).Single();          
            }

            myEvent.name = txtName.Text;
            myEvent.description = txtDescription.Text;
            myEvent.location = txtLocation.Text;
            myEvent.fee = Convert.ToInt32(txtFee.Text);
            myEvent.time = Convert.ToDateTime(txtTime.Text);
            myEvent.duration = Convert.ToInt32(txtDuration.Text);
            myEvent.deadline = Convert.ToDateTime(txtDeadline.Text);
            myEvent.organizer = txtOrganizer.Text;
            myEvent.type = Convert.ToInt32(ddlType.SelectedValue);
            myEvent.status = 0;
            myEntities.SaveChanges();
            Response.Redirect("~/event/CurrentEvents.aspx");
        
        }
    }
    //save rsvp
    protected void btnRSVP_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Register.aspx?userid=" + Session["userid"] + "&eventid=" + Request.QueryString.Get("eventid"));
        
    }
    //approve event
    protected void btnAppr_Click(object sender, EventArgs e)
    {
        using (event2Entities myEntities = new event2Entities())
        {
            @event myEvent;
    
            
                myEvent = (from ev in myEntities.events
                           where ev.id == _id
                           select ev).Single();
            

            myEvent.status = 1;
            myEntities.SaveChanges();
            Response.Redirect("~/event/CurrentEvents.aspx?manageApplication=1");

        }

    }



    //add img
    public IQueryable ListView1_GetData([QueryString("eventid")] int eventId)
    {
        if(!string.IsNullOrEmpty(Request.QueryString.Get("eventid"))){
        var myEntity = new event2Entities();
        return from p in myEntity.images
               where p.eventid == eventId
               select p;
        }
        return null;
    }

    

//delete image
    public void ListView1_DeleteItem(int id)
    {
        using (var myEntities = new event2Entities())
        {
            var img = (from p in myEntities.images
                       where p.id == id
                       select p).Single();
            myEntities.images.Remove(img);
            myEntities.SaveChanges();

        }
    }
}