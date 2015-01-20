<%@ Page Title="Bridge Buster Report Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BridgeBuster.aspx.cs" Inherits="ASPWenFormPractice1.BridgeBuster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Bridge Buster</h2>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
        </tr>

     
        <tr>
            <td>
                <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset" />
                </td>
            <td>
                <asp:Button ID="ButtonCalculate" runat="server" Text="Calculate" OnClick="ButtonCalculate_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                
            </td>
        </tr>
    </table>
    <asp:Label ID="LabelEggDropOutput" runat="server" Text=" "></asp:Label>
    <asp:Label ID="LabelDebug" runat="server" Text=" "> </asp:Label>
</asp:Content>
