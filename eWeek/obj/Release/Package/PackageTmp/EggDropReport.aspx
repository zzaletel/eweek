﻿<%@ Page visible="false" Title="Egg Drop Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EggDropReport.aspx.cs" Inherits="ASPWenFormPractice1.EggDropReport" EnableEventValidation="false"%>
<script runat="server">

 private void OnRecordDeleted(object source, SqlDataSourceStatusEventArgs e)
 {
     Label1.Text = e.AffectedRows + " row(s) were deleted";
 }
 
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Egg Drop Report</h2>


    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="record_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:eweekDb %>" 
        ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" 
        SelectCommand="SELECT * FROM egg_drop_report;"
        DeleteCommand="DELETE FROM egg_drop_report WHERE record_id=@record_id;"
        OnDeleted="OnRecordDeleted"
        ></asp:SqlDataSource>
    <br /><br /><br />
    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>
    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    
</asp:Content>
