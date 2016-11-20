using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class ManagePhotoAlbum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable ListView1_GetData([QueryString("eventid")] int eventId)
    {
        var myEntity = new event2Entities();
        return from p in myEntity.images
               where p.eventid == eventId
               select p;
    }

    public void ListView1_InsertItem([QueryString("eventid")] int eventId)
    {
        image img = new image();
        TryUpdateModel(img);
        FileUpload fileUpload = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
        if (fileUpload.HasAttributes || !fileUpload.FileName.ToLower().EndsWith(".jpg")) {
            CustomValidator cusImage = (CustomValidator)ListView1.InsertItem.FindControl("cusImage");
            cusImage.IsValid=false;
            ModelState.AddModelError("Invalid",cusImage.ErrorMessage);
        }
        if (ModelState.IsValid && Page.IsValid) {
            //save file to server
            string virtualFolder = "~/eventImages/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName=Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(fileUpload.FileName);

            // savd file
            fileUpload.SaveAs(System.IO.Path.Combine(physicalFolder,fileUpload.FileName));
            img.path=virtualFolder+fileUpload.FileName;

            using (var myEntities = new event2Entities())
            {
                img.eventid= eventId;
                img.postDate = DateTime.Now;
                img.userid = Convert.ToInt32(Session["userid"]);
                myEntities.images.Add(img);
                myEntities.SaveChanges();
            }
        }
    }

    // The id parameter name should match the DataKeyNames value set on the control
    public void ListView1_DeleteItem(int id)
    {
        using (var myEntities = new event2Entities()) { 
        var img = (from p in myEntities.images
                           where p.id==id select p).Single();
        myEntities.images.Remove(img);
        myEntities.SaveChanges();

        }
    }
}