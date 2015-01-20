<%@ Page Title="Query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="ASPWenFormPractice1.Query" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Event Report Tables (click each event to export report in Excel sheet)</h2>
    <ul>
        <li><a id="A1" runat="server" href="~/EggDropReport">Egg drop - team or individual</a></li>
        <li><a id="A2" runat="server" href="~/FloatableMoatables">Floatable moatables- team (up to 4 people)</a></li>
        <li><a id="A3" runat="server" href="~/PaperAirplanes">Paper airplanes - individual</a></li>
        <li><a id="A4" runat="server" href="~/EggToss">Egg toss - team or individual</a></li>
        <li><a id="A5" runat="server" href="~/LegoLongo">Lego longo - team or individual</a></li>
        <li><a id="A6" runat="server" href="~/ShakeBreak">Shake & Break - team or individual</a></li>
        <li><a id="A7" runat="server" href="~/BridgeBuster">Bridge buster - individual</a></li>
    </ul>

    <h2>Other Tables</h2>
    <ul>
        <li><a id="A8" runat="server" href="~/EggDrop">Student</a></li>
        <li><a id="A9" runat="server" href="~/FloatableMoatables">Team</a></li>
        <li><a id="A10" runat="server" href="~/PaperAirplanes">Team-Student</a></li>
    </ul>

    <h3>Edit Table</h3>
    <ul>
        <li><a id="A11" runat="server" href="~/EggDrop">Egg drop - team or individual</a></li>
        <li><a id="A12" runat="server" href="~/FloatableMoatables">Floatable moatables- team (up to 4 people)</a></li>
        <li><a id="A13" runat="server" href="~/PaperAirplanes">Paper airplanes - individual</a></li>
        <li><a id="A14" runat="server" href="~/EggToss">Egg toss - team or individual</a></li>
        <li><a id="A15" runat="server" href="~/LegoLongo">Lego longo - team or individual</a></li>
        <li><a id="A16" runat="server" href="~/ShakeBreak">Shake & Break - team or individual</a></li>
        <li><a id="A17" runat="server" href="~/BridgeBuster">Bridge buster - individual</a></li>
        <li><a id="A18" runat="server" href="~/EggDrop">Student</a></li>
        <li><a id="A19" runat="server" href="~/FloatableMoatables">Team</a></li>
        <li><a id="A20" runat="server" href="~/PaperAirplanes">Team-Student</a></li>
    </ul>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="student_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="student_id" HeaderText="Student ID" InsertVisible="False" ReadOnly="True" SortExpression="student_id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="school" HeaderText="School" SortExpression="school" />
            <asp:BoundField DataField="grade" HeaderText="Grade" SortExpression="grade" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eweekDb %>" ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" SelectCommand="SELECT * FROM student;"></asp:SqlDataSource>
    <br /><br /><br />

    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="team_id" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="team_id" HeaderText="team_id" InsertVisible="False" ReadOnly="True" SortExpression="team_id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="member_names" HeaderText="member_names" SortExpression="member_names" />
            <asp:BoundField DataField="team_size" HeaderText="team_size" SortExpression="team_size" />
            <asp:BoundField DataField="representative_id" HeaderText="representative_id" SortExpression="representative_id" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eweekDb %>" ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" SelectCommand="SELECT * from team;"></asp:SqlDataSource>

    <br /><br /><br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="team_id,student_id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="team_id" HeaderText="Team ID" InsertVisible="False" ReadOnly="True" SortExpression="team_id" />
            <asp:BoundField DataField="name" HeaderText="Team Name" SortExpression="name" />
            <asp:BoundField DataField="student_id" HeaderText="Student ID" ReadOnly="True" SortExpression="student_id" />
            <asp:BoundField DataField="name1" HeaderText="Student Name" SortExpression="name1" />
            <asp:BoundField DataField="school" HeaderText="School" SortExpression="school" />
            <asp:BoundField DataField="grade" HeaderText="Grade" SortExpression="grade" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eweekDb %>" ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" SelectCommand="SELECT t.team_id, t.name, sta.student_id, s.name, s.school, s.grade
FROM team as t,
student as s,
student_team_affiliation as sta
WHERE t.team_id = sta.team_id
AND sta.student_id = s.student_id;"></asp:SqlDataSource>

    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>


    <br />
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="record_id" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="record_id" HeaderText="record_id" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
            <asp:BoundField DataField="participant_id" HeaderText="participant_id" SortExpression="participant_id" />
            <asp:BoundField DataField="student_names" HeaderText="student_names" SortExpression="student_names" />
            <asp:BoundField DataField="school" HeaderText="school" SortExpression="school" />
            <asp:BoundField DataField="number_of_team_members" HeaderText="number_of_team_members" SortExpression="number_of_team_members" />
            <asp:BoundField DataField="grade_group" HeaderText="grade_group" SortExpression="grade_group" />
            <asp:BoundField DataField="survive" HeaderText="survive" SortExpression="survive" />
            <asp:BoundField DataField="measured_dist" HeaderText="measured_dist" SortExpression="measured_dist" />
            <asp:BoundField DataField="allowed_time" HeaderText="allowed_time" SortExpression="allowed_time" />
            <asp:BoundField DataField="start_time" HeaderText="start_time" SortExpression="start_time" />
            <asp:BoundField DataField="end_time" HeaderText="end_time" SortExpression="end_time" />
            <asp:BoundField DataField="total_time" HeaderText="total_time" SortExpression="total_time" />
            <asp:BoundField DataField="penalty_dist" HeaderText="penalty_dist" SortExpression="penalty_dist" />
            <asp:BoundField DataField="total_dist" HeaderText="total_dist" SortExpression="total_dist" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:eweekDb %>" ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" SelectCommand="SELECT * FROM egg_drop_report;"></asp:SqlDataSource>
    <br />


</asp:Content>
