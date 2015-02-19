<%@ Page visible="false" Title="Team Registration" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="TeamRegistration.aspx.cs" Inherits="ASPWenFormPractice1.Team_Registration" %>

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

    <h3>Events:</h3>
    <ol class="round">
        <li class="one">
            <a id="A1" runat="server" href="~/EggDrop">Egg drop - team or individual</a>
            <br /><br />
        </li>
        <li class="two">
            <a id="A2" runat="server" href="~/FloatableMoatables">Floatable moatables- team (up to 4 people)</a>
            <br /><br />
        </li>
        <li class="three">
            <a id="A3" runat="server" href="~/PaperAirplanes">Paper airplanes - individual</a>
            <br /><br />
        </li>
        <li class="four">
            <a id="A4" runat="server" href="~/EggToss">Egg toss - team or individual</a>
            <br /><br />
        </li>
        <li class="five">
            <a id="A5" runat="server" href="~/LegoLongo">Lego longo - team or individual</a>
            <br /><br />
        </li>
        <li class="six">
            <a id="A6" runat="server" href="~/ShakeBreak">Shake & Break - team or individual</a>
            <br /><br />
        </li>
        <li class="seven">
            <a id="A7" runat="server" href="~/BridgeBuster">Bridge buster - individual</a>
            <br /><br />
        </li>
        <li class="eight">
            <a id="A8" runat="server" href="~/Geomatics">Geomatics - individual</a>
            <br /><br />
        </li>
        <li class="nine">
            <a id="A9" runat="server" href="~/TowerOfPower">Tower of Power - individual</a>
            <br /><br />
        </li>
    </ol>
</asp:Content>
