using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AddEditProductNew : System.Web.UI.Page
{
    int _id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public IEnumerable<Category> ddlCategory_GetData() {
        using (TestEntities myEntities = new TestEntities()) {
            return (from category in myEntities.Categories
                    select category).ToList();
        
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (TestEntities myEntities = new TestEntities()) {
            Product myProduct;
            if (_id == -1) { 
            myProduct=new Product();
           myProduct.CreateDateTime = DateTime.Now;
           myProduct.UpdateDateTime = DateTime.Now;
            myProduct.Name = txtName.Text;
            myProduct.Description = txtDescription.Text;
            myProduct.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
            myProduct.UnitPrice = Convert.ToDecimal(txtPrice.Text);
            myProduct.OnHand = Convert.ToInt32(txtQuantity.Text);
            myProduct.ImageUrl = txtURL.Text;
            myEntities.Products.Add(myProduct);
            myEntities.SaveChanges();

            Response.Redirect("AllProducts.aspx");
            }
        }
    }
}