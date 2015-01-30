<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperAirplanesReport.aspx.cs" Inherits="ASPWenFormPractice1.PaperAirplanesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Paper Airplanes Reporst</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="record_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="record_id" HeaderText="record_id" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
            <asp:BoundField DataField="participant_id" HeaderText="participant_id" SortExpression="participant_id" />
            <asp:BoundField DataField="student_names" HeaderText="student_names" SortExpression="student_names" />
            <asp:BoundField DataField="school" HeaderText="school" SortExpression="school" />
            <asp:BoundField DataField="grade_group" HeaderText="grade_group" SortExpression="grade_group" />
            <asp:BoundField DataField="Plane_num" HeaderText="Plane_num" SortExpression="Plane_num" />
            <asp:BoundField DataField="dist1_ft" HeaderText="dist1_ft" SortExpression="dist1_ft" />
            <asp:BoundField DataField="dist1_in" HeaderText="dist1_in" SortExpression="dist1_in" />
            <asp:BoundField DataField="offset1_ft" HeaderText="offset1_ft" SortExpression="offset1_ft" />
            <asp:BoundField DataField="offset1_in" HeaderText="offset1_in" SortExpression="offset1_in" />
            <asp:BoundField DataField="score1" HeaderText="score1" SortExpression="score1" />
            <asp:BoundField DataField="dist2_ft" HeaderText="dist2_ft" SortExpression="dist2_ft" />
            <asp:BoundField DataField="dist2_in" HeaderText="dist2_in" SortExpression="dist2_in" />
            <asp:BoundField DataField="offset2_ft" HeaderText="offset2_ft" SortExpression="offset2_ft" />
            <asp:BoundField DataField="offset2_in" HeaderText="offset2_in" SortExpression="offset2_in" />
            <asp:BoundField DataField="score2" HeaderText="score2" SortExpression="score2" />
            <asp:BoundField DataField="max_dist" HeaderText="max_dist" SortExpression="max_dist" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eweekDb %>" ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" SelectCommand="SELECT * FROM paper_airplanes_report;"></asp:SqlDataSource>
</asp:Content>
