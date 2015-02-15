<%@ Page visible="false" Title="Shake and Break Report Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShakeBreak.aspx.cs" Inherits="ASPWenFormPractice1.ShakeBreak" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Shake and Break</h2>
    <table>
        <tr>       
            <td><asp:Label ID="Label1" runat="server" Text="Team/Student ID"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
        </tr>
        <tr>       
            <td><asp:Label ID="Label2" runat="server" Text="Structures survival time"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxSurvivalTime" runat="server"></asp:TextBox></td>
        </tr>
        <tr>       
            <td><asp:Label ID="Label3" runat="server" Text="Number of stories survived"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxStoriesNum" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset" />
    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
     <asp:Label ID="LabelOutput" runat="server" Text=" "></asp:Label>
    <asp:Label ID="LabelDebug" runat="server" Text=" "> </asp:Label>
</asp:Content>
