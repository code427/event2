<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="imgManagement.aspx.cs" Inherits="event_imgManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
            <asp:ListView ID="ListView1" DataKeyNames="Id"    runat="server" ItemType="image"
        SelectMethod="ListView1_GetData"  DeleteMethod="ListView1_DeleteItem" UpdateMethod="ListView1_UpdateItem" >
      
  
        <ItemTemplate>
            <li class="img">
                Tags: <asp:Label ID="lblDesc" runat="server"
                    Text='<%# Item.tag %>' > </asp:Label> <br />
                Name: <asp:Label ID="lblToolTip" runat="server"
                    Text='<%# Item.name %>' ></asp:Label> <br />
              <asp:Image ID="imgUrl" runat="server" ImageUrl='<%# Item.path %>' />
           <br />
                     <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CausesValidation="false" />
                                <asp:Button ID="Button1" runat="server" Text="Approve" CommandName="Update" CausesValidation="false" />

            </li>
        </ItemTemplate>

    </asp:ListView>
</asp:Content>

