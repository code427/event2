<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RSVP.aspx.cs" Inherits="event_RSVP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
         <h2>Enroll</h2>

       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
              
        </div>
      
          <asp:Button runat="server"  Text="Enroll" CssClass="btn btn-default" />


</asp:Content>

