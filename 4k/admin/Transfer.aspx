<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Transfer.aspx.cs" Inherits="transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .list {
            width:800px;
            margin:0 auto;
            text-align:center;
        }
    .container
   {
       width:900px;
       margin:0 auto;
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <form id="form1" runat="server">
        <asp:Button ID="back" runat="server" Text="返回" OnClick="back_Click" />
<asp:GridView ID="list" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None"  CssClass="list" OnPageIndexChanging="list_PageIndexChanging">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="PayID" HeaderText="编号" />
        <asp:BoundField HeaderText="会员号" DataField="VIPNo" />
        <asp:BoundField DataField="RefereeNo" HeaderText="推荐人会员号" />
        <asp:BoundField HeaderText="手机" DataField="Phone" />
        <asp:BoundField HeaderText="用户名" DataField="LoginName" />
        <asp:BoundField HeaderText="真实姓名" DataField="VIPName" />
        <asp:BoundField HeaderText="银行卡号" DataField="CardNo" />
        <asp:BoundField HeaderText="开户行" DataField="Bank" />
        <asp:BoundField HeaderText="持卡人姓名" DataField="CardHolder" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

    </form>
</div>
</asp:Content>

