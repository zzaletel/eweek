<%@ Page visible="false" Title="Bridge Buster Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BridgeBusterReport.aspx.cs" Inherits="ASPWenFormPractice1.BridgeBusterReport" %>
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
    <h2>Bridge Buster Report</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="record_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="record_id" HeaderText="record_id" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
            <asp:BoundField DataField="participant_id" HeaderText="participant_id" SortExpression="participant_id" />
            <asp:BoundField DataField="student_name" HeaderText="student_name" SortExpression="student_name" />
            <asp:BoundField DataField="school" HeaderText="school" SortExpression="school" />
            <asp:BoundField DataField="grade_group" HeaderText="grade_group" SortExpression="grade_group" />
            <asp:BoundField DataField="passes_inspection" HeaderText="passes_inspection" SortExpression="passes_inspection" />
            <asp:BoundField DataField="mass" HeaderText="mass" SortExpression="mass" />
            <asp:BoundField DataField="contest_mass" HeaderText="contest_mass" SortExpression="contest_mass" />
            <asp:BoundField DataField="load" HeaderText="load" SortExpression="load" />
            <asp:BoundField DataField="ratio" HeaderText="ratio" SortExpression="ratio" />
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
        SelectCommand="SELECT * FROM bridge_buster_report;"
        DeleteCommand="DELETE FROM bridge_buster_report WHERE record_id=?;"
        OnDeleted="OnRecordDeleted"
        ></asp:SqlDataSource>
    <br /><br /><br />
    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>
    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
