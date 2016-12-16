using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using event2;

//created by Pranali
public partial class Account_Register : Page
{
    int userid = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if is navigated thorugh another page, fill out the existing info
        if (!string.IsNullOrEmpty(Request.QueryString.Get("userid")))
        {
            userid = Convert.ToInt32(Request.QueryString.Get("userid"));
        }
        if (!IsPostBack && userid > -1)
        {
            using (event2Entities myEntity = new event2Entities())
            {
                var oneUser = (from u in myEntity.users
                                where u.id == userid
                                select u).Single();

                if (oneUser != null)
                {
                    txtName.Text = oneUser.name;
                    txtEmail.Text = oneUser.email;
                    txtPhone.Text = Convert.ToString(oneUser.phone);
                }
            }

        }
    }

    //after register button clicked, get the value from the form and save in db
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
                myUser.username = _username;
                myUser.password = txtPass.Text;
                myUser.email = txtEmail.Text;
                myUser.name = txtName.Text;
                myUser.phone = txtPhone.Text;
                myUser.rol = 2;
                myUser.CWID = txtCWID.Text;

                myEntity.users.Add(myUser);
                myEntity.SaveChanges();
                Response.Redirect("Login.aspx");
            }
        }

    }

}