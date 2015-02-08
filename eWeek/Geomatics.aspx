<%@ Page visible="false" Title="Geomatics" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Geomatics.aspx.cs" Inherits="ASPWenFormPractice1.Geomatics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <h2>Geomatics</h2>
    <table>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Team/Student ID"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox></td>
        </tr>
 
        <tr>
            <td><asp:Label ID="Label4" runat="server" Text="First Attempt:"></asp:Label></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Time (seconds)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxTime1" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Second Attempt:"></asp:Label></td>
        </tr>

        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Time (seconds)"></asp:Label></td>
            <td><asp:TextBox ID="TextBoxTime2" runat="server"></asp:TextBox></td>
        </tr>
    
         <tr>
            <td>
                <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset" />
                </td>
            <td>
               <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                
            </td>
        </tr>

    </table>
    <asp:Label ID="LabelOutput" runat="server" Text=" "></asp:Label>
    <asp:Label ID="LabelDebug" runat="server" Text=" "> </asp:Label>
</asp:Content>
