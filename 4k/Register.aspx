<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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
   .register
   {
       width:300px;
       margin:0 auto;
   }
   .tijiao,.h1
    {
        text-align:center;
    }
    
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
   <div class="register">
      <h1 class="h1">会员注册</h1>
      <form method="post" runat="server">
        <div class="item">
           <div>会员号：</div>
            <asp:TextBox ID="id" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

        <div class="item">
           <div>真实姓名：</div>
            <asp:TextBox ID="trueName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

         <div class="item">
           <div>登录用户名：</div>
            <asp:TextBox ID="loginName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

          <div class="item">
           <div>密码：</div>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
          </div>

           <div class="item">
           <div>确认密码：</div>
            <asp:TextBox ID="confirm" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
          </div>

           <div class="item">
           <div>手机号码：</div>
            <asp:TextBox ID="phone" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

           <div class="item">
           <div>电子邮箱：</div>
            <asp:TextBox ID="email" runat="server" CssClass="textbox"></asp:TextBox>
               <br />
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="电子邮箱不合法" ForeColor="Red" ValidationExpression="^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"></asp:RegularExpressionValidator>
        </div>
          <br />
        <div class="tijiao">
         <asp:Button ID="submit" runat="server" Text="注册" OnClick="submit_Click" />
          &nbsp;&nbsp;
         <asp:Button ID="goback" runat="server" Text="返回" onclick="goback_Click" /> 
        </div>       
      </form>
      
   </div>
</div>
</asp:Content>

