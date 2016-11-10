using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class event_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string _username = txtUsername.Text;
        string _pass = txtPass.Text;
        using (event2Entities myEntity = new event2Entities())
        {
            var user = (from u in myEntity.users
                        where u.username == _username && u.password == _pass
                        select u).SingleOrDefault();
            if (user != null)
            {
                Session["username"] = _username;
                Session["usertype"] = user.rol;
                //      Response.Redirect("~/Manager/AllProducts.aspx");
                Response.Redirect("~/Default.aspx");

            }
            else
            {
                lblError.Text = "Username or password doesn't match" + _username + " " + _pass;

            }
        }
    }
}