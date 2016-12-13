<%@ Page Title="All Reservations" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="allReservations.aspx.cs" Inherits="event_allReservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <link href="../css/table.css" rel="stylesheet" />
 <h3>All Reservations</h3>
           <table border="1">
                        <thead>
                            <tr>
                                <th>Reservation ID</th>
                            <th>Event ID</th>                                
                            <th>Event Name</th>
                            <th>Event Type</th>
                            <th>User ID</th>
                            <th>First Name</th>
                            <th>Time Reserved</th>
                            </tr></thead>
    <asp:Repeater ID="rptCategory" runat="server">
         
            
                <ItemTemplate>
                    
                    <tr>
                        <td><%# Eval("id") %></td>
                        <td><%# Eval("eventid") %></td>
                  <td> 
                      <%if (Request.QueryString.Get("archivedEvent") == null) {%> 
                      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("event.name") %>' NavigateUrl='<%# "AddEditEvent.aspx?eventid=" +Eval("eventid")+"&rsvp=1"%>'></asp:HyperLink>

                        <%} else {%>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("event.name") %>' NavigateUrl='<%# "AddEditEvent.aspx?eventid=" +Eval("eventid")+"&archivedEvent=1"%>'></asp:HyperLink>
                        <%} %>
                      
                        </td>
                        <td>
                            <%# Eval("event.eventType.name") %>

                        </td>
                        <td>
                            <%# Eval("userid") %>
                        </td>
                        <td>
                            <%# Eval("firstName") %>
                        </td>
         
                        <td>      <%# Eval("registerTime") %>
                      </td>
                    </tr>
                  
                </ItemTemplate>
          
    </asp:Repeater>
                   </table>
</asp:Content>

