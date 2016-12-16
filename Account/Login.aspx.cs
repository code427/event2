using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using event2;
using System.Linq;

//cerated by Pranali, 
public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
    //detect wether an user with same name already exist in the database
        protected void LogIn(object sender, EventArgs e)
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
                    Session["userid"] = user.id;

                    Response.Redirect("~/event/CurrentEvents.aspx");
                }
                else
                {
                    lblError.Text = "Username and password doesn't match";

                }
            }
        }
}