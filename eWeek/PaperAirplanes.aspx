<%@ Page Title="Paper Airplanes Report Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaperAirplanes.aspx.cs" Inherits="ASPWenFormPractice1.PaperAirplanes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Paper Airplanes</h2>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Plane Number"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxPlaneNum" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="First Attempt:"></asp:Label></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Distance (ft)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxDist_ft" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Distance (in)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxDist_in" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label6" runat="server" Text="Offset (ft)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxOffset_ft" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label7" runat="server" Text="Offset (in)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxOffset_in" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label8" runat="server" Text="Score"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxScore" Text="To be calculated" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label9" runat="server" Text="Second Attempt:"></asp:Label></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label10" runat="server" Text="Distance (ft)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxDist2_ft" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label11" runat="server" Text="Distance (in)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxDist2_in" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label12" runat="server" Text="Offset (ft)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxOffset2_ft" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label13" runat="server" Text="Offset (in)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxOffset2_in" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label14" runat="server" Text="Score"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxScore2" Text="To be calculated" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td><asp:Label ID="Label15" runat="server" Text="Max Distance"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxMaxDist" Text="To be calculated" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset" />
                </td>
            <td>
                <asp:Button ID="ButtonCalculate" runat="server" Text="Calculate" OnClick="ButtonCalculate_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                
            </td>
        </tr>
    </table>
    <asp:Label ID="LabelOutput" runat="server" Text=" "></asp:Label>
    <asp:Label ID="LabelDebug" runat="server" Text=" "> </asp:Label>
</asp:Content>
