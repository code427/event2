using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;


public partial class event_imgManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //add img
    public IQueryable ListView1_GetData()
    {
            var myEntity = new event2Entities();
            return from p in myEntity.images
                   where 
                    p.status == 0
                   select p;
    }

    // The id parameter name should match the DataKeyNames value set on the control
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

    // The id parameter name should match the DataKeyNames value set on the control
    public void ListView1_UpdateItem(int id)
    {
        image item = null;
        // Load the item here, e.g. item = MyDataLayer.Find(id);

        using (var myEntities = new event2Entities())
        {
            var img = (from p in myEntities.images
                       where p.id == id
                       select p).Single();
            img.status = 1;
            myEntities.SaveChanges();

        }

        if (item == null)
        {
            // The item wasn't found
            ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
            return;
        }

    }
}