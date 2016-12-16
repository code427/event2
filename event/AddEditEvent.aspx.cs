using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Web.ModelBinding;


//created by Zhengdong
public partial class event_AddEditEvent : System.Web.UI.Page
{
    int _id = -1;
    //load event details
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
                    txtAttendance.Text = Convert.ToString(oneEvent.attendance);
                }
            }

        }
    }

    //get dropdown list items from db
    public IEnumerable<eventType> ddlType_GetData()
    {
        using (event2Entities myEntities = new event2Entities())
        {
            return (from type in myEntities.eventTypes
                    select type).ToList();

        }
    }


    //save event to db
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
            myEvent.attendance = Convert.ToInt32(txtAttendance.Text);
            if (Session["username"].Equals("admin"))
            {
                myEvent.status = 1;
            }
           
            myEntities.SaveChanges();
            Response.Redirect("~/event/CurrentEvents.aspx");
        
        }
    }

    //save rsvp info to db
    protected void btnRSVP_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["userid"]);
        int eventid = Convert.ToInt32(Request.QueryString.Get("eventid"));
        if (Session["userid"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");

        }
        else
        {
            Response.Redirect("~/event/RSVP.aspx?eventName=" + txtName.Text + "&eventid=" + Convert.ToInt32(Request.QueryString.Get("eventid")));

           
        }
        
    }

    //approve event, set event status to 1
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


    //delete event
    protected void btnDel_Click(object sender, EventArgs e)
    {
        using (var myEntities = new event2Entities())
        {
            int _eid = Convert.ToInt32(Request.QueryString.Get("eventid"));
            var Delevent = (from evt in myEntities.events
                       where evt.id == _eid
                       select evt).Single();
            myEntities.events.Remove(Delevent);
            myEntities.SaveChanges();

        }
        Response.Redirect("~/event/CurrentEvents.aspx");

    }

    //add img
    public IQueryable ListView1_GetData([QueryString("eventid")] int eventId)
    {
        if(!string.IsNullOrEmpty(Request.QueryString.Get("eventid"))){
        var myEntity = new event2Entities();
        return from p in myEntity.images
               where p.eventid == eventId 
               && p.status == 1
               select p;
        }
        return null;
    }

    //insert image
    public void ListView1_InsertItem([QueryString("eventid")] int eventId)
    {
        image img = new image();
        TryUpdateModel(img);
        FileUpload fileUpload = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
        if (fileUpload.HasAttributes || !fileUpload.FileName.ToLower().EndsWith(".jpg"))
        {
            CustomValidator cusImage = (CustomValidator)ListView1.InsertItem.FindControl("cusImage");
            cusImage.IsValid = false;
            ModelState.AddModelError("Invalid", cusImage.ErrorMessage);
        }
        if (ModelState.IsValid && Page.IsValid)
        {
            //save file to server
            string virtualFolder = "~/eventImages/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(fileUpload.FileName);

            // savd file
            fileUpload.SaveAs(System.IO.Path.Combine(physicalFolder, fileUpload.FileName));
            img.path = virtualFolder + fileUpload.FileName;

            using (var myEntities = new event2Entities())
            {
                img.eventid = eventId;
                img.postDate = DateTime.Now;
                img.userid = Convert.ToInt32(Session["userid"]);
                myEntities.images.Add(img);
                myEntities.SaveChanges();
            }
        }
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