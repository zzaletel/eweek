<%@ Page Title="Team Registration" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="TeamRegistration.aspx.cs" Inherits="ASPWenFormPractice1.Team_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <table class="style1">
            <tr>
                <td>*Team Name:</td>
                <td>
                    <asp:TextBox ID="TextTeamName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>*Team Members:</td>
                <td>
                    <asp:TextBox ID="TextTeamMembers" runat="server"></asp:TextBox>
                    <a> Type Members' ID that was obtained from individual registration, e.g(12,14,29)</a>
                </td>
            </tr>
         
        </table>
 
    <asp:Button ID="Button_team_reg" runat="server" Text="Register" 
                             onclick="Button_Team_reg" />
        <asp:Label ID="Label_team_reg" runat="server" Text="Register as a team"></asp:Label>

</asp:Content>
