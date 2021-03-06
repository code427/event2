﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditEvent.aspx.cs" Inherits="event_AddEditEvent" %>

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
            <td><asp:DropDownList ID="ddlType" runat="server" CssClass="css-input"
                DataTextField="name" DataValueField="id" SelectMethod="ddlType_GetData" ></asp:DropDownList></td>
        </tr>
        <tr><td>Fee: </td>
            <td>
                    <asp:TextBox ID="txtFee" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
                <tr><td>Date/Time: </td>
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
           <tr><td>Attendance: </td>
            <td>
                    <asp:TextBox ID="txtAttendance" runat="server" CssClass="css-input"></asp:TextBox>

            </td>
        </tr>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter attendance" ControlToValidate="txtAttendance"></asp:RequiredFieldValidator>

        <tr>
           
 <%if (Session["username"] != null && Session["username"].Equals("admin") )
              { %>
           
            
             <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="button"/>
            </td>
             <td>
                <asp:Button ID="Button1" runat="server" Text="Delete" OnClick="btnDel_Click" CssClass="button"/>
            </td>
<%} %>            
             <%if (Session["username"] != null && Session["username"].Equals("admin")&& Request.QueryString["manageApplication"]!=null)
              { %>
           
             <td>
                <asp:Button ID="btnAppr" runat="server" Text="Approve" OnClick="btnDel_Click" CssClass="button"/>
            </td>
            
            <%} else  if (Request.QueryString["rsvp"]!=null )
              { %>
            <td>
                <asp:Button ID="btnRSVP" runat="server" Text="RSVP" OnClick="btnRSVP_Click" CssClass="button"/>
            </td>
            <%} %>
        </tr>
        
    </table>
    <asp:Label ID="Label1" runat="server" Text="Label">Date/Time Format: M/DD/YYYY HH:MM:SS AM </asp:Label>
    <asp:Label ID="ErrorMessage"  style="color:red;" runat="server" Text=""></asp:Label>
   
        <asp:ListView ID="ListView1" DataKeyNames="Id"   InsertItemPosition="LastItem"  runat="server" ItemType="image"
        SelectMethod="ListView1_GetData" InsertMethod="ListView1_InsertItem" DeleteMethod="ListView1_DeleteItem">
      
        <InsertItemTemplate>
             <%if (!String.IsNullOrEmpty(Request.QueryString.Get("archivedEvent"))&&Session["userid"]!=null)
       {%>
            <li>
                Tags: 
                <asp:RequiredFieldValidator ID="reqDesc" runat="server" 
                    ControlToValidate="txtDesc" ErrorMessage="Enter a description"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="css-input"
                        Text='<%# BindItem.tag %>'></asp:TextBox> <br />
                Name: 
    <asp:RequiredFieldValidator ID="reqToolTip" runat="server" 
                    ControlToValidate="txtToolTip" ErrorMessage="Enter a tooltip"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="txtToolTip" runat="server"  CssClass="css-input"
                    Text ='<%# BindItem.name %>'></asp:TextBox> <br />
                ImageUrl: <asp:FileUpload ID="FileUpload1" runat="server" CssClass="css-input" /> <br />
                <asp:CustomValidator ID="cusImage" runat="server" ErrorMessage="select a valid .jpg file"></asp:CustomValidator>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" CommandName="Insert" CssClass="button"/>
      
            </li>
            <%} %>
        </InsertItemTemplate>
        <ItemTemplate>
            <li class="img">
                Tags: <asp:Label ID="lblDesc" runat="server"
                    Text='<%# Item.tag %>' > </asp:Label> <br />
                Name: <asp:Label ID="lblToolTip" runat="server"
                    Text='<%# Item.name %>' ></asp:Label> <br />
              <asp:Image ID="imgUrl" runat="server" ImageUrl='<%# Item.path %>' />
              <%if (Session["username"] != null&&Session["username"].Equals("admin"))
                { %>
                
                   <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CausesValidation="false" CssClass="button"/>
            <%} %>
            </li>

        </ItemTemplate>

    </asp:ListView>
  
     <script src="../js/AddEditEvent.js"></script>

</asp:Content>

