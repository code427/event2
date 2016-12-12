<%@ Page Title="My Reservations" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="myRSVP.aspx.cs" Inherits="event_myRSVP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <link href="../css/table.css" rel="stylesheet" />
     <h3>My Reservations</h3>
               <table border="1">
                        <thead><tr><th>Reservation ID</th>
                            <th>Name</th>
                            <th>Reservation Time</th>
                            <th>Action</th>
                        
                            </tr></thead>
    <asp:Repeater ID="rptCategory" runat="server" >
               
                <HeaderTemplate>
                  
                </HeaderTemplate>
                <ItemTemplate>
                    
                    <tr>
                        <td>
                               <%# Eval("id") %>

                        </td>
                  <td>      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("event.name") %>' NavigateUrl='<%# "AddEditEvent.aspx?eventid=" +Eval("id")+"&rsvp=1"%>'></asp:HyperLink>
                        </td>
                    
                        <td>
                            <%# Eval("registerTime") %>
                        </td>
                        <td>
                            <asp:Button ID="cancelBtn" runat="server" Text="Cancel"  OnClick="cancelBtn_Click" />
                        </td>
                    </tr>
                  
                </ItemTemplate>
                <FooterTemplate>
                
                </FooterTemplate>
      


    </asp:Repeater>
                   </table>
</asp:Content>

