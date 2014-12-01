<%@ Page Title="Event Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPWenFormPractice1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
            </hgroup>
            <p>
               This is registration page for each individual student and for each team.<br />
               Each student and team will get their unique ID after registeration, 
                which will be used later for their participation in the events. <br />
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
        <table class="style1">
            <tr>
                <td>*Name:</td>
                <td>
                    <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>*School:</td>
                <td>
                    <asp:TextBox ID="TxtSchool" runat="server"></asp:TextBox>
                </td>
            </tr>
         
            <tr>
                <td>*Grade:</td>
                <td>
                    <asp:TextBox ID="TxtGrade" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    
    <asp:Button ID="Button_student_reg" runat="server" Text="Register" 
                             onclick="Button_Student_reg" />
        <asp:Label ID="Label_student_reg" runat="server" Text="Register as an individual"></asp:Label>

    <br />
    <br />
    <br />

        <table class="style1">
            <tr>
                <td>*Team Name:</td>
                <td>
                    <asp:TextBox ID="TextTeamName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>*Team Members:</td>
                <td>
                    <asp:TextBox ID="TextTeamMembers" runat="server"></asp:TextBox>
                    <a> Type Members' ID that was obtained from individual registration, e.g(12,14,29)</a>
                </td>
            </tr>
         
        </table>
 
    <asp:Button ID="Button_team_reg" runat="server" Text="Register" 
                             onclick="Button_Team_reg" />
        <asp:Label ID="Label_team_reg" runat="server" Text="Register as a team"></asp:Label>

    
    <br />
    <br />
    <br />

    <h3>Events:</h3>
    <ol class="round">
        <li class="one">
            Egg drop - team or individual
            <br /><br />
        </li>
        <li class="two">
            Floatable moatables- team (up to 4 people)
            <br /><br />
        </li>
        <li class="three">
            Paper airplanes - individual*
            <br /><br />
        </li>
        <li class="four">
            Egg toss - team or individual
            <br /><br />
        </li>
        <li class="five">
            Lego longo - team or individual
            <br /><br />
        </li>
        <li class="six">
            Shake & Break - team or individual
            <br /><br />
        </li>
        <li class="seven">
            Bridge buster - individual*
            <br /><br />
        </li>
    </ol>
</asp:Content>
