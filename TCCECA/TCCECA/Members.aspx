<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="TCCECA.Members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
        <asp:DataGrid ID="Grid" runat="server" PageSize="5" AllowPaging="True" DataKeyField="UserId"
        AutoGenerateColumns="False" CellPadding="4" BackColor="White" ForeColor="#000" GridLines="None"
        OnEditCommand="Grid_EditCommand" OnUpdateCommand="Grid_UpdateCommand" >
            <Columns>
                <asp:BoundColumn HeaderText="Username" DataField="UserId" HeaderStyle-CssClass="displayNone"
                    ItemStyle-CssClass="displayNone" FooterStyle-CssClass="displayNone">
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Username" DataField="UserName">
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Prénom" DataField="Firstname">
                </asp:BoundColumn>
                <asp:BoundColumn HeaderText="Nom" DataField="LastName">
                </asp:BoundColumn>               
                <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit">
                </asp:EditCommandColumn>
                <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete">
                </asp:ButtonColumn>
            </Columns>
        <FooterStyle />
        <SelectedItemStyle/>
        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" />
        <AlternatingItemStyle />
        <ItemStyle/>
        <HeaderStyle BackColor="#000044" ForeColor="White" />
        </asp:DataGrid>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>


