<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RSVP.aspx.cs" Inherits="event_RSVP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
         <h2>Enroll <asp:Label ID="eventNamelbl" runat="server" Text=""></asp:Label></h2> 

       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="firstName" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="firstName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
              
        </div>
             <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lastName" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lastName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName"
                    CssClass="text-danger" ErrorMessage="The last name field is required." />
            </div>
              
        </div>
                 <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CWID" CssClass="col-md-2 control-label">CWID</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CWID" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CWID"
                    CssClass="text-danger" ErrorMessage="The CWID field is required." />
            </div>
              
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
              
        </div>

          <asp:Button runat="server"  Text="Enroll" OnClick="Unnamed_Click" CssClass="btn btn-default" />
    <asp:Label ID="ErrorMessage" runat="server" Text=""></asp:Label>

</asp:Content>

