<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="AddAuditor.aspx.cs" Inherits="admin_AddAuditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
     .container
   {
       width:900px;
       margin:0 auto;
       text-align:center;
   }
   .table
   {
       text-align:center;
       width:300px;
       margin:0 auto;    
   }
   
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
    <form id="form1" runat="server">
        <table class="table">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="真实姓名"></asp:Label></td>
                <td><asp:TextBox ID="adminname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="登录名"></asp:Label></td>
                <td><asp:TextBox ID="loginname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="密码"></asp:Label></td>
                <td><asp:TextBox ID="pwd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="电话号码"></asp:Label></td>
                <td><asp:TextBox ID="phone" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />&nbsp;
        <input type="reset" value="清空" />
    </form>
</div>
</asp:Content>

