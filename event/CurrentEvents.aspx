<%@ Page Title="Product by Category" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CurrentEvents.aspx.cs" Inherits="Manager_AllByCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 <h3>Events</h3>
           <table border="1">
                        <thead><tr><th>Name</th>
                            <th>Description</th>
                            <th>Time</th>
                            <th>Deadline</th>
                        
                            </tr></thead>
    <asp:Repeater ID="rptCategory" runat="server">
            <ItemTemplate> 
                 
              <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Eval("events") %>'>
                <HeaderTemplate>
                  
                </HeaderTemplate>
                <ItemTemplate>
                    
                    <tr>
                  <td>      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# "AddEditEvent.aspx?eventid=" +Eval("id")+"&rsvp=1"%>'></asp:HyperLink>
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
                <FooterTemplate>
                
                </FooterTemplate>
            </asp:Repeater>


        </ItemTemplate>
    </asp:Repeater>
                   </table>
</asp:Content>

