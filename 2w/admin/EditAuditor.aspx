<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="EditAuditor.aspx.cs" Inherits="admin_EditAuditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
        <asp:Button ID="goback" runat="server" Text="返回" OnClick="goback_Click" />
         &nbsp;&nbsp;
        <asp:Button ID="add" runat="server" Text="添加审核人员" OnClick="add_Click" />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
        Width="893px" onrowdeleting="GridView1_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="AdminName" HeaderText="姓名" />
            <asp:BoundField DataField="LoginName" HeaderText="登录名" />
            <asp:BoundField DataField="PW" HeaderText="密码" />
            <asp:BoundField DataField="Phone" HeaderText="电话" />
            <asp:CommandField ButtonType="Button" EditText="修改" HeaderText="编辑" 
                ShowEditButton="True" />
            <asp:TemplateField HeaderText="删除">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandName="delete" Text="删除" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
 </form>
 </div>
</asp:Content>

