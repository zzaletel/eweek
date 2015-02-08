<%@ Page visible="false" Title="Query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="ASPWenFormPractice1.Query" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Event Report Tables (click each event to export report in Excel sheet)</h2>
    <ul>
        <li><a id="A1" runat="server" href="~/EggDropReport">Egg drop - team or individual</a></li>
        <li><a id="A2" runat="server" href="~/FloatableMoatablesReport">Floatable moatables- team (up to 4 people)</a></li>
        <li><a id="A3" runat="server" href="~/PaperAirplanesReport">Paper airplanes - individual</a></li>
        <li><a id="A4" runat="server" href="~/EggTossReport">Egg toss - team or individual</a></li>
        <li><a id="A5" runat="server" href="~/LegoLongoReport">Lego longo - team or individual</a></li>
        <li><a id="A6" runat="server" href="~/ShakeBreakReport">Shake & Break - team or individual</a></li>
        <li><a id="A7" runat="server" href="~/BridgeBusterReport">Bridge buster - individual</a></li>
        <li><a id="A21" runat="server" href="~/GeomaticsReport">Geomatics - individual</a></li>
        <li><a id="A22" runat="server" href="~/TowerOfPowerReport">Tower of Power - individual</a></li>
    </ul>

    <h2>Other Tables</h2>
    <ul>
        <li><a id="A8" runat="server" href="~/StudentTable">Student</a></li>
        <li><a id="A9" runat="server" href="~/TeamTable">Team</a></li>
        <li><a id="A10" runat="server" href="~/TeamMembersTable">Team Member Details</a></li>
    </ul>


</asp:Content>
