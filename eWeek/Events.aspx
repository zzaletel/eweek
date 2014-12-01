<%@ Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ASPWenFormPractice1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Egg Drop</h2>
    <table>
           <tr>
        <td><asp:Label ID="Label1" runat="server" Text="ID"></asp:Label></td>
        <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
         <tr>
        <td><asp:Label ID="Label9" runat="server" Text="Grade Category"></asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="1 to 3" Value="0"></asp:ListItem>
                <asp:ListItem Text="4 to 6" Value="1"></asp:ListItem>
                <asp:ListItem Text="7 to 8" Value="2"></asp:ListItem>
                <asp:ListItem Text="9 to 12" Value="3"></asp:ListItem>
            </asp:DropDownList></td>
        <td><asp:Label ID="Label10" runat="server" Text="Egg Survival(Y/N)?"></asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:DropDownList></td>
            </tr>
        <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Distance(in)"></asp:Label></td>
        <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Allowed Time(min)"></asp:Label></td>
        <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label4" runat="server" Text="Start Time"></asp:Label></td>
        <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label5" runat="server" Text="End Time"></asp:Label></td>
        <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label6" runat="server" Text="Total Time"></asp:Label></td>
        <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label7" runat="server" Text="Penalty Distance"></asp:Label></td>
        <td><asp:TextBox ID="TextBox7" runat="server" Text="0"></asp:TextBox></td>
             </tr>
        <tr>
        <td><asp:Label ID="Label8" runat="server" Text="Total Distance"></asp:Label></td>
        <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
             </tr>
        <tr>
            <td>
                </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Calculate" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Submit" />
            </td>
        </tr>
    </table>

</asp:Content>
