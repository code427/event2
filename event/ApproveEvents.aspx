<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproveEvents.aspx.cs" Inherits="event_AddEditEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <div>
    <a name="sharebutton" type="button" href="http://www.facebook.com/sharer.php">Share to Facebook</a>  
 
              </div>
    <%if (String.IsNullOrEmpty(Request.QueryString.Get("eventid")))
      {%>  <h1>Add/Edit Event Information</h1>
    <%}else{ %>
    <h1>Event Information</h1>
    <%} %>
     <table>
         <tr><td></td><td></td></tr>
        <tr><td>Name: </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="css-input"></asp:TextBox>
            </td>

        </tr>
        <tr><td>Description: </td>
            <td>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
        <tr><td>Location: </td>
            <td>
                                <asp:TextBox ID="txtLocation" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>Type: </td>
            <td><asp:DropDownList ID="ddlType" runat="server"
                DataTextField="name" DataValueField="id" SelectMethod="ddlType_GetData" CssClass="css-input" ></asp:DropDownList></td>
        </tr>
        <tr><td>Fee: </td>
            <td>
                    <asp:TextBox ID="txtFee" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Time: </td>
            <td>
                    <asp:TextBox ID="txtTime" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Duration: </td>
            <td>
                                <asp:TextBox ID="txtDuration" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>

                       <tr><td>Deadline: </td>
            <td>
                    <asp:TextBox ID="txtDeadline" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
                       <tr><td>Organizer: </td>
            <td>
                    <asp:TextBox ID="txtOrganizer" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
        <tr>
           
 <%if (Session["username"] != null && Request.QueryString["createEvent"]!=null )
              { %>
           
            
             <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button"  OnClick="btnSave_Click" />
            </td>
<%} %>            
             <%if (Session["username"] != null && Session["username"].Equals("admin"))
              { %>
           
             <td>
                <asp:Button ID="btnAppr" runat="server" Text="Approve" CssClass="button"  OnClick="btnAppr_Click" />
            </td>
            <%} else  if (Session["username"] != null && Request.QueryString["rsvp"]!=null )
              { %>
            <td>
                <asp:Button ID="btnRSVP" runat="server" Text="RSVP"  CssClass="button" OnClick="btnRSVP_Click" />
            </td>
            <%} %>
        </tr>
        
    </table>
   

  
     <script src="../js/AddEditEvent.js"></script>

</asp:Content>

