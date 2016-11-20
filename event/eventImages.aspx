<%@ Page Title="Manage Photo Album" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="eventImages.aspx.cs" Inherits="ManagePhotoAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h></h>
    <asp:ListView ID="ListView1" DataKeyNames="Id"   InsertItemPosition="LastItem"  runat="server" ItemType="image"
        SelectMethod="ListView1_GetData" InsertMethod="ListView1_InsertItem" DeleteMethod="ListView1_DeleteItem">
      
        <InsertItemTemplate>
             <%if (Session["username"]!=null) {%>
            <li>
                Tags: 
                <asp:RequiredFieldValidator ID="reqDesc" runat="server" 
                    ControlToValidate="txtDesc" ErrorMessage="Enter a description"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"
                        Text='<%# BindItem.tag %>'></asp:TextBox> <br />
                Name: 
    <asp:RequiredFieldValidator ID="reqToolTip" runat="server" 
                    ControlToValidate="txtToolTip" ErrorMessage="Enter a tooltip"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="txtToolTip" runat="server" 
                    Text ='<%# BindItem.name %>'></asp:TextBox> <br />
                ImageUrl: <asp:FileUpload ID="FileUpload1" runat="server" /> <br />
                <asp:CustomValidator ID="cusImage" runat="server" ErrorMessage="select a valid .jpg file"></asp:CustomValidator>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" CommandName="Insert"/>
            </li>
            <%} %>
        </InsertItemTemplate>
        <ItemTemplate>
            <li>
                Tags: <asp:Label ID="lblDesc" runat="server"
                    Text='<%# Item.tag %>' > </asp:Label> <br />
                Name: <asp:Label ID="lblToolTip" runat="server"
                    Text='<%# Item.name %>' ></asp:Label> <br />
              <asp:Image ID="imgUrl" runat="server" ImageUrl='<%# Item.path %>' />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CausesValidation="false" />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul class="ItemContainer">
                <li runat="server" id="itemPlaceholder" />
            </ul>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>

