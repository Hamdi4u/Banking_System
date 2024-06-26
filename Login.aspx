﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Banking_System.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        input[type=text], input[type=password]
        {
            width: 200px;
        }
        table
        {
            border: 1px solid #ccc;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
    </style>

    <center>

        <section id="features" class="white-section">
     <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser">
         <LayoutTemplate>
             <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                 <tr>
                     <td>
                         <table cellpadding="0">
                             <tr>
                                 <td align="center" colspan="2">Log In</td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                 </td>
                                 <td>
                                     <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                 </td>
                                 <td>
                                     <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td colspan="2">
                                     <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center" colspan="2" style="color:Red;">
                                     <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                 </td>
                                 <td align="right">
                                     <asp:HyperLink ID="lnkSignup" runat="server" NavigateUrl="~/RegistraionForm.aspx">Sign Up</asp:HyperLink>
                                 </td>
                             </tr>
                         </table>
                     </td>
                 </tr>
             </table>
         </LayoutTemplate>
    </asp:Login>

            </section>
</center>


</asp:Content>
