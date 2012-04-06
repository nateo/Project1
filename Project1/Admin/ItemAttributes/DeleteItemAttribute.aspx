<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteItemAttribute.aspx.cs" Inherits="Project1.Admin.ItemAttributes.EditItemAttribute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <strong><asp:Label ID="lblQuestion" runat="server"></asp:Label></strong>
        <asp:Button ID="btnYes" runat="server" Text="Yes" onclick="btnYes_Click" />
        <asp:Button ID="btnNo" runat="server" Text="No" onclick="btnNo_Click" />
</asp:Content>
