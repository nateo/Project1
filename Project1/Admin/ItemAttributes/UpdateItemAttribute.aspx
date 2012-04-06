<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UpdateItemAttribute.aspx.cs" Inherits="Project1.Admin.ItemAttributes.AddItemAttribute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                Item:
            </td>
            <td>
                <asp:DropDownList ID="ddlItems" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Description:
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                MarkupPercentage:
            </td>
            <td>
                <asp:TextBox ID="txtMarkupPercentage" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                MarkupFlatRate
            </td>
            <td>
                <asp:TextBox ID="txtMarkupFlatRate" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
