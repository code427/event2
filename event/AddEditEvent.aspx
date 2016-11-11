<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditEvent.aspx.cs" Inherits="event_AddEditEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <h1>Add/Edit Event Information</h1>
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
        <tr><td>Location: </td>
            <td>
                                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>Type: </td>
            <td><asp:DropDownList ID="ddlType" runat="server"
                DataTextField="name" DataValueField="id" SelectMethod="ddlType_GetData" ></asp:DropDownList></td>
        </tr>
        <tr><td>Fee: </td>
            <td>
                    <asp:TextBox ID="txtFee" runat="server"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Time: </td>
            <td>
                    <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Duration: </td>
            <td>
                                <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>

            </td>
        </tr>

                       <tr><td>Deadline: </td>
            <td>
                    <asp:TextBox ID="txtDeadline" runat="server"></asp:TextBox>

            </td>
        </tr>
                       <tr><td>Organizer: </td>
            <td>
                    <asp:TextBox ID="txtOrganizer" runat="server"></asp:TextBox>

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

