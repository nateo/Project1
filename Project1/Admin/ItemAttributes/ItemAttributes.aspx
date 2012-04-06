<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ItemAttributes.aspx.cs" Inherits="Project1.Admin.ItemAttributes.EditItemAttributes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="lvItemAttributes" runat="server">
        <LayoutTemplate>
            <table border="1">
                <tr>
                    <td>
                        Item
                    </td>
                    <td>
                        Item Attibute
                    </td>
                    <td>
                        MarkupPercentage
                    </td>
                    <td>
                        MarkupFlatRate
                    </td>
                    <td>
                        Modify
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
                    <%# Eval("MarkupPercentage")%>
                </td>
                <td>
                    <%# Eval("MarkupFlatRate")%>
                </td>
                <td>
                    <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# "UpdateItemAttribute.aspx?action=Edit&ItemAttributeID=" + Eval("ItemAttributeID") %>'
                        Text="Edit"></asp:HyperLink>
                    |
                    <asp:HyperLink ID="hlDelete" runat="server" NavigateUrl='<%# "DeleteItemAttribute.aspx?action=Delete&ItemAttributeID=" + Eval("ItemAttributeID") %>'
                        Text="Delete"></asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
