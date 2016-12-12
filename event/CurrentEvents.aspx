<%@ Page Title="Product by Category" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CurrentEvents.aspx.cs" Inherits="Manager_AllByCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="../css/table.css" rel="stylesheet" />
 <h3>Events</h3>
           <table border="1">
                        <thead><tr><th>Name</th>
                            <th>Description</th>
                            <th>Time</th>
                            <th>Deadline</th>
                        
                            </tr></thead>
    <asp:Repeater ID="rptCategory" runat="server">
         
            
                <ItemTemplate>
                    
                    <tr>
                  <td> 
                      <%if (Request.QueryString.Get("archivedEvent") == null) {%> 
                      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# "AddEditEvent.aspx?eventid=" +Eval("id")+"&rsvp=1"%>'></asp:HyperLink>

                        <%} else {%>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# "AddEditEvent.aspx?eventid=" +Eval("id")+"&archivedEvent=1"%>'></asp:HyperLink>
                        <%} %>
                      
                        </td>
                        <td>
                            <%# Eval("description") %>

                        </td>
                        <td>
                            <%# Eval("time") %>
                        </td>
                        <td>
                            <%# Eval("deadline") %>
                        </td>
                    </tr>
                  
                </ItemTemplate>
          
    </asp:Repeater>
                   </table>
</asp:Content>

