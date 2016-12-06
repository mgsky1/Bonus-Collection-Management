<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Application.aspx.cs" Inherits="Application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    body {
    background-color:#FCEFE8;
    }
   .item
   {
       padding:5px;
   }
   .container
   {
       width:900px;
       margin:0 auto;
   }
   .application
   {
       width:472px;
       margin:0 auto;
   }
   .h1
   {
       padding-left:100px;
   }
    .shuoming
    {
        font-size:11.5px;
    }
    .picUpload
    {
        text-align:right;
    }
    .tijiao,.shuoming
    {
        text-align:center;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
  <div class="application">
     <h1 class="h1">积分兑现管理系统</h1>
      <div class="shuoming">
          (请在会员号3166账户结算支付4千积分，真实姓名:兑换系统。
步骤：登陆匀加速APP--首页--结算支付--编号填写:3166--真实姓名：兑换系统--金额：4000--输入支付密码支付完成--打开操作记录截图--提交申请表)

          <br/> <br/>
      </div>
    <form method="post" runat="server">
      <div class="item">
           <div>结算支付匀加速会员号：</div>
            <asp:TextBox ID="id" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
        </div>

        <!--<div class="item" style="visibility:hidden">
           <div>密码：</div>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
          </div>-->

          <div class="item">
           <div>手机号：</div>
              <asp:TextBox ID="phone" runat="server"  CssClass="textbox"></asp:TextBox>
          </div>

          <div class="item">
           <div>匀加速真实姓名：</div>
            <asp:TextBox ID="trueName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

        <div class="item">
           <div>推荐人会员号(可不填)：</div>
            <asp:TextBox ID="recommended" runat="server" CssClass="textbox" AutoPostBack="False"></asp:TextBox>
        </div>
        
         <div class="item">
           <div>银行名称(开户行)：</div>
            <asp:TextBox ID="bankName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

         <div class="item">
           <div>卡号：</div>
            <asp:TextBox ID="bankNum" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

        <div class="item">
           <div>持卡人姓名：</div>
            <asp:TextBox ID="bankcardName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

        <div class="item">
           <div>积分结算支付描述(填写交易的具体时间和会员号，若有截图可不填)：</div>
            <asp:TextBox ID="paySpecify" runat="server" CssClass="textbox"></asp:TextBox>
        </div>

         <div class="item">
           <div>积分结算支付截图(支持jpg、png格式图片)：</div>
          <span class="picUpload"><asp:FileUpload ID="picUpload" runat="server" Width="131px" /></span>
        </div>


        <div class="tijiao">
            <br/>
         <asp:Button ID="submit" runat="server" Text="提交" OnClick="submit_Click" />   
          &nbsp;&nbsp;
         <asp:Button ID="goback" runat="server" Text="最近提交申请" onclick="goback_Click" />        
        </div>
    </form>
  </div>
</div>
</asp:Content>

