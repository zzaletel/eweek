<%@ Page Title="Geomatics Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GeomaticsReport.aspx.cs" Inherits="ASPWenFormPractice1.GeomaticsReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <h2>Geomatics Report</h2>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
