﻿<%@ Page visible="false" Title="Tower of Power" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TowerOfPower.aspx.cs" Inherits="ASPWenFormPractice1.TowerOfPower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Tower of Power</h2>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Passes Inspection(Y/N)?"></asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListPasses" runat="server">
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList>
        </td>
        </tr>
        
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Mass (grams)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxMass" runat="server"></asp:TextBox></td>
        </tr>
     
        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Peak Load"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxLoad" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset" />
                </td>
            <td>
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="LabelEggDropOutput" runat="server" Text=" "></asp:Label>
    <asp:Label ID="LabelDebug" runat="server" Text=" "> </asp:Label>
</asp:Content>
