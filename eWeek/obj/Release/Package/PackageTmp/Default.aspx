<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPWenFormPractice1._Default" %>



<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
            </hgroup>
            <p>
               This is registration page for each individual student.<br />
               Each student will get their unique ID after registeration, 
                which will be used later for their participation in the events. <br />
                For team registration, go to team registration page.
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <asp:Label ID="Lable_intro" runat="server" Text="You need to Log in to be able to use this website."></asp:Label>
        <table ID="Table_student_reg" class="style1">
            <tr>
                <td>*Name:</td>
                <td>
                    <asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>*School:</td>
                <td>
                    <asp:TextBox ID="TextBox_school" runat="server"></asp:TextBox>
                </td>
            </tr>
         
            <tr>
                <td>*Grade:</td>
                <td>
                    <asp:DropDownList ID="DropDownList_Grade" runat="server">
                    <asp:ListItem Text="1 to 3" Value="1 to 3"></asp:ListItem>
                    <asp:ListItem Text="4 to 6" Value="4 to 6"></asp:ListItem>
                    <asp:ListItem Text="7 to 8" Value="7 to 8"></asp:ListItem>
                    <asp:ListItem Text="9 to 12" Value="9 to 12"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    
    <asp:Button Style="display: none;" ID="Button_student_reg" runat="server" Text="Register" 
                             onclick="Button_Student_reg" />
        <asp:Label ID="Label_output" runat="server" Text="Register as an individual"></asp:Label>

    
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
        <li class="eight">
            Geomatics - individual*
            <br /><br />
        </li>
        <li class="nine">
            Tower of Power - individual*
            <br /><br />
        </li>
    </ol>
</asp:Content>
