<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DeleteItemAttribute.aspx.cs" Inherits="Project1.Admin.ItemAttributes.EditItemAttribute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <strong>
        <asp:Label ID="lblQuestion" runat="server">Are you sure you want to delete?</asp:Label></strong><br />
    <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="btnYes_Click1" />
    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
</asp:Content>
