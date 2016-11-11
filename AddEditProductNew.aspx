<%@ Page Title="Add/Edit Product New" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditProductNew.aspx.cs" Inherits="Manager_AddEditProductNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Add/Edit Product Information</h1>
    <table>
        <tr><td>Name: </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr><td>Description: </td>
            <td>
                                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>Category: </td>
            <td><asp:DropDownList ID="ddlCategory" runat="server"
                DataTextField="Name" DataValueField="CategoryID" SelectMethod="ddlCategory_GetData"></asp:DropDownList></td>
        </tr>
        <tr><td>Unit Price: </td>
            <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Quantity in Storage: </td>
            <td>
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Image Url: </td>
            <td>
                                <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </td>
        </tr>
        
    </table>

</asp:Content>

