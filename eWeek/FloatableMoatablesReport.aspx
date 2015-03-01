<%@ Page visible="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FloatableMoatablesReport.aspx.cs" Inherits="ASPWenFormPractice1.FloatableMoatablesReport" EnableEventValidation="false"%>
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
    <h2>Floatable Moatables Report</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="record_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="record_id" HeaderText="record_id" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
            <asp:BoundField DataField="participant_id" HeaderText="participant_id" SortExpression="participant_id" />
            <asp:BoundField DataField="student_names" HeaderText="student_names" SortExpression="student_names" />
            <asp:BoundField DataField="school" HeaderText="school" SortExpression="school" />
            <asp:BoundField DataField="grade_group" HeaderText="grade_group" SortExpression="grade_group" />
            <asp:BoundField DataField="marbles_num" HeaderText="marbles_num" SortExpression="marbles_num" />
            <asp:BoundField DataField="people_num" HeaderText="people_num" SortExpression="people_num" />
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
        SelectCommand="select * from floatable_moatable_report;"
        DeleteCommand="DELETE FROM floatable_moatable_report WHERE record_id=@record_id;"
        OnDeleted="OnRecordDeleted"
        ></asp:SqlDataSource>
    <br /><br /><br />
    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>
    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
