<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style type="text/css">
   .item
   {
       padding:5px;
   }
   .container
   {
       width:900px;
       margin:0 auto;
   }
   .login
   {
       width:300px;
       margin:0 auto;
   }
   .h1
   {
       padding-left:40px;
   }

  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
  <div class="login">
  
    <h1 class="h1">职员登录</h1>
  <form id="Form1" method="post" runat="server">
  <div class="item"> 
     <span>账号：</span>
     <asp:TextBox ID="user" runat="server"></asp:TextBox>
  </div>
  <div class="item"> 
     <span>密码：</span>
     <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
  </div>
   <div class="item">
       <asp:RadioButtonList ID="identity" runat="server" RepeatDirection="Horizontal">
           <asp:ListItem Value="0" Selected>审核人员</asp:ListItem>
           <asp:ListItem Value="1">管理人员</asp:ListItem>
       </asp:RadioButtonList>
  </div>
  <div class="item">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="submit" runat="server" Text="登录" OnClick="submit_Click" />
  </div>
  </form>
  </div>
</div>
</asp:Content>

