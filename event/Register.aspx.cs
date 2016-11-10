using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string _username = txtUserName.Text;
        using (event2Entities myEntity = new event2Entities()) {
            var user = (from u in myEntity.users
                        where u.username == _username
                        select u).SingleOrDefault();

            if (user != null)
            {
                lblError.Text = "Username already exists";
            }
            else {
                user myUser = new user();
                myUser.username = txtUserName.Text;
                myUser.password = txtPassword.Text;
                myUser.email = txtEmail.Text;
                myUser.name = txtName.Text;
                myUser.rol = 2;

                myEntity.users.Add(myUser);
                myEntity.SaveChanges();
                Response.Redirect("Login.aspx");
            }
        }
    }
}
