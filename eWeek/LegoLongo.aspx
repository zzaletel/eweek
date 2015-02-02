<%@ Page Title="LegoLongo Report Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LegoLongo.aspx.cs" Inherits="ASPWenFormPractice1.LegoLongo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Lego Longo</h2>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Team/Student ID"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="First Attempt:"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Length (in)"></asp:Label></td>
            <td><asp:TextBox ID="TextBox1Length" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label6" runat="server" Text="Weight (g)"></asp:Label></td>
            <td><asp:TextBox ID="TextBox1Weight" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label10" runat="server" Text="Survive?(Y/N)?"></asp:Label>&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1Survival" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Second Attempt:"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Length (in)"></asp:Label></td>
            <td><asp:TextBox ID="TextBox2Length" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label7" runat="server" Text="Weight (g)"></asp:Label></td>
            <td><asp:TextBox ID="TextBox2Weight" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="Label8" runat="server" Text="Survive?(Y/N)?"></asp:Label>&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2Survival" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

    </table>
    <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset" />
    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
    <asp:Label ID="LabelOutput" runat="server" Text=" "></asp:Label>
    <asp:Label ID="LabelDebug" runat="server" Text=" "> </asp:Label>
</asp:Content>
