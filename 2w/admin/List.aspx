<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="admin_List" %>

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
        <asp:GridView ID="List" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="list" AllowPaging="True" OnPageIndexChanging="List_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="PayID" HeaderText="编号" />
                <asp:BoundField DataField="LoginName" HeaderText="用户名称" />
                <asp:BoundField DataField="VIPNo" HeaderText="会员号" />
                <asp:BoundField DataField="RefereeNo" HeaderText="推荐人" />
                <asp:BoundField DataField="Phone" HeaderText="手机号" />
                <asp:BoundField DataField="Bank" HeaderText="开户行" />
                <asp:BoundField DataField="CardHolder" HeaderText="持卡人姓名" />
                <asp:BoundField DataField="CardNo" HeaderText="银行卡号" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </form>
 </div>
</asp:Content>

