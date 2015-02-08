<%@ Page visible="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamTable.aspx.cs" Inherits="ASPWenFormPractice1.TeamTable" %>
<script runat="server">
 private void OnDSUpdatedHandler(Object source, SqlDataSourceStatusEventArgs e) {
    if (e.AffectedRows > 0) {
        // Perform any additional processing, 
        // such as setting a status label after the operation.
        Label1.Text = Request.LogonUserIdentity.Name +
            " changed user information successfully!";    
    }
    else {
        Label1.Text = "No data updated!";
    }
 }

 private void OnRecordDeleting(Object source, SqlDataSourceCommandEventArgs e)
 {
     // Cancel the delete operation if the checkbox is not checked.
     //if (!CheckBox1.Checked)
     //{
     //    e.Cancel = true;
     //    Label1.Text = "The command was cancelled because the CheckBox was not checked.";
     //}
 }

 
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
    <h2>Team Table</h2>
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
         ConnectionString="<%$ ConnectionStrings:eweekDb %>" 
        ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>"
         SelectCommand="SELECT * from team;"
        UpdateCommand="Update team SET name=?,member_names=?,team_size=?, representative_id=?, WHERE team_id=?"
        OnUpdated="OnDSUpdatedHandler"
        DeleteCommand="DELETE FROM team WHERE team_id=?;"
        OnDeleting="OnRecordDeleting"
        OnDeleted="OnRecordDeleted"
        ></asp:SqlDataSource>

    <br /><br /><br />
    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>
    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
