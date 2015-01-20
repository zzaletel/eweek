<%@ Page Title="Egg Drop Report Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EggDrop.aspx.cs" Inherits="ASPWenFormPractice1.EggDrop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Egg Drop</h2>
    <table>
           <tr>
        <td><asp:Label ID="Label1" runat="server" Text="Team/Student ID"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
            </tr>
         <tr>
       
        <td><asp:Label ID="Label10" runat="server" Text="Egg Survival(Y/N)?"></asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListSurvival" runat="server">
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList></td>
            </tr>
        <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Distance(in)"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxMDist" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Allowed Time(min)"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxAllowedTime" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label4" runat="server" Text="Start Time"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxSTime" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label5" runat="server" Text="End Time"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxETime" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label6" runat="server" Text="Total Time"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxTotalTime" Text="To be calculated" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label7" runat="server" Text="Penalty Distance"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxPDist" runat="server" Text="0"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label8" runat="server" Text="Total Distance"></asp:Label></td>
        <td><asp:TextBox ID="TextBoxTotalDist" Text="To be calculated" runat="server"></asp:TextBox></td>
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
