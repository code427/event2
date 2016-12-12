<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
  
     <h2>Register</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
              
        </div>
      

           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCWID" CssClass="col-md-2 control-label">CWID</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCWID" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCWID"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
        </div>
                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
            </div>
                <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
        </div>

                        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPhone" CssClass="col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
        </div>
    
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPass" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="txtPass" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>

         <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
            </div>
        </div>

    </div>
</asp:Content>

