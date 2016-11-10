<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="event_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       <h2>Register</h2>
      <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <table>
        <tr>
            <td>Username:  </td>
          <td>  <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
        </tr>
        <tr><td> Password: </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td> Re-type Password: </td>
            <td> <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr><td> Name: </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr><td> Email :</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
        </tr>
        <tr><td></td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Register" OnClick="btnSave_Click" /></td>
        </tr>
    </table>
</asp:Content>

