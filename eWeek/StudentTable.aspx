<%@ Page visible="false" Title="Student Table" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentTable.aspx.cs" Inherits="ASPWenFormPractice1.StudentTable" %>
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
    <h2>Student Table</h2>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eweekDb %>" ProviderName="<%$ ConnectionStrings:eweekDb.ProviderName %>" 
        SelectCommand="SELECT * FROM student;"
        UpdateCommand="Update student SET name=?,school=?,grade=? WHERE student_id=?"
        OnUpdated="OnDSUpdatedHandler"
        DeleteCommand="DELETE FROM student WHERE student_id=?;"
        OnDeleting="OnRecordDeleting"
        OnDeleted="OnRecordDeleted"
        >
    </asp:SqlDataSource>
    <br /><br /><br />
    <asp:Button ID="ButtonExport" runat="server" Text="Export To Excel" onclick="ExportToExcel"/>
    <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
