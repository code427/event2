﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;


public partial class @event
{

    public @event()
    {

        this.images = new HashSet<image>();

        this.reservations = new HashSet<reservation>();

    }


    public int id { get; set; }

    public string name { get; set; }

    public System.DateTime time { get; set; }

    public int duration { get; set; }

    public string location { get; set; }

    public System.DateTime deadline { get; set; }

    public string description { get; set; }

    public Nullable<int> attendance { get; set; }

    public Nullable<int> fee { get; set; }

    public string organizer { get; set; }

    public int type { get; set; }

    public int status { get; set; }



    public virtual ICollection<image> images { get; set; }

    public virtual ICollection<reservation> reservations { get; set; }

    public virtual eventType eventType { get; set; }

}


public partial class eventType
{

    public eventType()
    {

        this.events = new HashSet<@event>();

    }


    public int Id { get; set; }

    public string Name { get; set; }



    public virtual ICollection<@event> events { get; set; }

}


public partial class image
{

    public int id { get; set; }

    public string path { get; set; }

    public int eventid { get; set; }

    public int userid { get; set; }

    public int status { get; set; }

    public System.DateTime postDate { get; set; }

    public string tag { get; set; }

    public string name { get; set; }



    public virtual @event @event { get; set; }

    public virtual user user { get; set; }

}


public partial class reservation
{

    public int id { get; set; }

    public int eventid { get; set; }

    public int userid { get; set; }

    public System.DateTime registerTime { get; set; }

    public string firstName { get; set; }

    public string lastName { get; set; }

    public string CWID { get; set; }

    public string email { get; set; }



    public virtual @event @event { get; set; }

    public virtual user user { get; set; }

}


public partial class user
{

    public user()
    {

        this.images = new HashSet<image>();

        this.reservations = new HashSet<reservation>();

    }


    public int id { get; set; }

    public string username { get; set; }

    public string password { get; set; }

    public string name { get; set; }

    public string phone { get; set; }

    public string email { get; set; }

    public int rol { get; set; }

    public string CWID { get; set; }



    public virtual ICollection<image> images { get; set; }

    public virtual ICollection<reservation> reservations { get; set; }

}

