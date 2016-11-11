<%@ Page Title="Add/Edit Reviews" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditReviewHandCoded.aspx.cs" Inherits="Management_AddEditReviewHandCoded" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>Add/Edit Reviews</h1>
    <table>
        <tr>
            <td>Title: </td>
            <td> <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Summary: </td>
            <td> <asp:TextBox ID="txtSummary" TextMode="MultiLine"  runat="server" Width="300px"></asp:TextBox></td>
        </tr>   
          <tr>
            <td>Body: </td>
            <td> <asp:TextBox ID="txtBody"  TextMode="MultiLine"  runat="server" Width="300px"></asp:TextBox></td>
        </tr>   
          <tr>
            <td>Genre: </td>
            <td>
                <asp:DropDownList ID="ddlGenre" DataTextField="Name" DataValueField="Id" SelectMethod="ddlGenre_GetData"  runat ="server" ></asp:DropDownList></td>
        </tr>
        <tr><td>Authorized: </td>
            <td>
                <asp:CheckBox ID="ckbAuthorized" runat="server" /></td>

        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /></td>
        </tr>
         </table>
</asp:Content>

