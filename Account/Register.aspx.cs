using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using event2;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {


        string _username = txtUsername.Text;
        using (event2Entities myEntity = new event2Entities())
        {
            var user = (from u in myEntity.users
                        where u.username == _username
                        select u).SingleOrDefault();

            if (user != null)
            {
                ErrorMessage.Text = "Username already exists";
            }
            else
            {
                user myUser = new user();
                myUser.username = txtUsername.Text;
                myUser.password = txtPass.Text;
                myUser.email = txtEmail.Text;
                myUser.name = txtName.Text;
                myUser.phone = Convert.ToInt32(txtPhone.Text);
                myUser.rol = 2;

                myEntity.users.Add(myUser);
                myEntity.SaveChanges();
                Response.Redirect("Login.aspx");
            }
        }

    }
}