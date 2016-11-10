<%@ Page Title="Product by Category" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CurrentEvents.aspx.cs" Inherits="Manager_AllByCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <asp:Repeater ID="rptCategory" runat="server">
        <ItemTemplate>
            <h3>
                <asp:Literal ID="ltrType" Text='<%# Eval("Name") %>'  runat="server"></asp:Literal></h3>
           
             <asp:BulletedList ID="bllEvents" DataSource='<%# Eval("events") %>' DataTextField="name" DisplayMode="Text" 
                runat="server"  ></asp:BulletedList>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

