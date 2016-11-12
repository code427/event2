<%@ Page Title="Product by Category" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CurrentEvents.aspx.cs" Inherits="Manager_AllByCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <asp:Repeater ID="rptCategory" runat="server">
        <ItemTemplate>
            <h3>Current Events</h3>
              <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Eval("events") %>'>
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("name") %>' NavigateUrl='<%# String.Concat("AddEditEvent.aspx?eventid=",Eval("id"))%>'></asp:HyperLink></li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>


        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

