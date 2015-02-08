<%@ Page visible="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LegoLongoReport.aspx.cs" Inherits="ASPWenFormPractice1.LegoLongoReport" %>
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
    <h2>Lego Longo Report</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="record_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="record_id" HeaderText="record_id" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
            <asp:BoundField DataField="participant_id" HeaderText="participant_id" SortExpression="participant_id" />
            <asp:BoundField DataField="student_names" HeaderText="student_names" SortExpression="student_names" />
            <asp:BoundField DataField="school" HeaderText="school" SortExpression="school" />
            <asp:BoundField DataField="grade_group" HeaderText="grade_group" SortExpression="grade_group" />
            <asp:BoundField DataField="length1" HeaderText="length1" SortExpression="length1" />
            <asp:BoundField DataField="weight1" HeaderText="weight1" SortExpression="weight1" />
            <asp:BoundField DataField="survive1" HeaderText="survive1" SortExpression="survive1" />
            <asp:BoundField DataField="length2" HeaderText="length2" SortExpression="length2" />
            <asp:BoundField DataField="weight2" HeaderText="weight2" SortExpression="weight2" />
            <asp:BoundField DataField="survive2" HeaderText="survive2" SortExpression="survive2" />
            <asp:BoundField DataField="max_distance" HeaderText="max_distance" SortExpression="max_distance" />
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
        SelectCommand="SELECT * FROM lego_longo_report;"
        DeleteCommand="DELETE FROM lego_longo_report WHERE record_id=?;"
        OnDeleted="OnRecordDeleted"
        ></asp:SqlDataSource>
    <br /><br /><br />
    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>
    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
