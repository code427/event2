﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//created by Pranali
//crear session 
public partial class event_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["usertype"] = null;
        Session["userid"] = null;

        Response.Redirect("~/event/CurrentEvents.aspx");
    }
}