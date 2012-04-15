<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ViewOrders.aspx.cs" Inherits="Project1.Admin.ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CheckBox ID="chkFilterDelivered" runat="server" Text="Filter Delivered" Checked="true" />
    <asp:ListView ID="lvOrders" runat="server">
        <LayoutTemplate>
            <table>
                <tr>
                    <td>
                        Last Name
                    </td>
                    <td>
                        Address1
                    </td>
                    <td>
                        Address2
                    </td>
                    <td>
                        Phone Number
                    </td>
                    <td>
                        Description
                    </td>
                </tr>
                <tr id="itemPlaceHolder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("LastName")%></td>
                <td><%# Eval("Address1")%></td>
                <td><%# Eval("Address2")%></td>
                <td><%# Eval("PhoneNumber")%></td>
                <td><%# Eval("Description")%></td>
                <td><%# Eval("Total")%></td>
                <td><%# Eval("Quantity")%></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
