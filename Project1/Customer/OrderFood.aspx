<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OrderFood.aspx.cs" Inherits="Project1.Customer.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Items:
    <asp:DropDownList ID="ddlItems" runat="server">
    </asp:DropDownList>
    Item Options:
    <asp:DropDownList ID="ddlItemOptions" runat="server">
    </asp:DropDownList>
    Quantity:
    <asp:TextBox ID="txtQuantity" runat="server" Width="30px"></asp:TextBox>
    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
    <hr />
    <asp:ListView ID="lvOrderItems" runat="server">
        <LayoutTemplate>
            <table border="1">
                <tr>
                    <td>
                        Item
                    </td>
                    <td>
                        Item Option
                    </td>
                    <td>
                        Quantity
                    </td>
                </tr>
                <tr id="itemPlaceHolder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Eval("ItemDescription") %>
                </td>
                <td>
                    <%# Eval("ItemAttributeDescription") %>
                </td>
                <td>
                    <%# Eval("Quantity")%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
