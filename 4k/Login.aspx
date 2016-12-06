<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            background-color:#FCEFE8;
        }
   .item
   {
       padding:5px;
   }
    .item div
   {
      padding-bottom:10px;
   }
   .container
   {
       width:900px;
       margin:0 auto;
   }
   .login
   {
       background-color:white;
       width:300px;
       margin:100px auto;
       padding:20px;
       border-radius:5px;
       box-shadow:0px 0px 10px #999;
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
  
    <h1 class="h1">会员登录</h1>
  <form method="post" runat="server">
  <div class="item"> 
     <div>匀加速会员号：</div>
     <asp:TextBox ID="user" runat="server"></asp:TextBox>
  </div>
  <div class="item"> 
     <div>密码：</div>
     <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
  </div>
  <div class="item">
      <asp:Button ID="submit" runat="server" Text="登录" onclick="submit_Click" />
      &nbsp;&nbsp;
      <asp:Button ID="register" runat="server" Text="注册" onclick="register_Click" />
      &nbsp;&nbsp;
      <asp:Button ID="forget" runat="server" Text="忘记密码" onclick="forget_Click" />
  </div>
  </form>
  </div>
</div>
</asp:Content>

