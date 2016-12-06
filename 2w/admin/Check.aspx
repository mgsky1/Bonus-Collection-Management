<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Check.aspx.cs" Inherits="Check" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .list {
            margin:0 auto;
            text-align:center;
        }
    .container
   {
       width:1000px;
       margin:0 auto;
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
     
    <form id="form1" runat="server">
      <asp:Button ID="goback" runat="server" Text="返回" OnClick="goback_Click" />
     &nbsp;&nbsp;
       <asp:Button ID="transfer" runat="server" Text="查看出队" OnClick="transfer_Click" />
     &nbsp;&nbsp;
     <asp:Button ID="list" runat="server" Text="查看队列" OnClick="list_Click" />
    <asp:GridView ID="activateList" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
       AllowPaging="True"  CssClass="list" OnRowUpdating="activateList_RowUpdating" OnSelectedIndexChanged="activateList_SelectedIndexChanged" Width="1000px" OnPageIndexChanging="activateList_PageIndexChanging1" OnRowDeleting="activateList_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="payID" HeaderText="编号" />
            <asp:BoundField HeaderText="用户名称" DataField="LoginName" />
            <asp:BoundField HeaderText="会员号" DataField="VIPNo" />
            <asp:BoundField DataField="RefereeNo" HeaderText="推荐人" />
            <asp:BoundField HeaderText="手机号" DataField="Phone" />
            <asp:BoundField HeaderText="开户行" DataField="Bank" />
            <asp:BoundField DataField="CardHolder" HeaderText="持卡人姓名" />
            <asp:BoundField DataField="CardNo" HeaderText="银行卡号" />
            <asp:BoundField DataField="PaySpecify" HeaderText="结算支付描述" />
            <asp:ImageField DataImageUrlField="PayJpg" ControlStyle-Width="70px" ControlStyle-Height="30px" HeaderText="截图">
<ControlStyle Height="30px" Width="70px"></ControlStyle>
            </asp:ImageField>
            <asp:HyperLinkField HeaderText="查看原图" NavigateUrl="~/admin/ShowImage.aspx" Target="blank" Text="查看原图" DataNavigateUrlFormatString="~/2w/admin/ShowImage.aspx?imgUrl={0}" DataNavigateUrlFields="PayJpg" />
            <asp:TemplateField HeaderText="激活">
                <ItemTemplate>
                    <asp:Button ID="activate" runat="server" Text="激活" CommandName="Update"  />
                    &nbsp;
                    <asp:Button ID="faild" runat="server" Text="作废" CommandName="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
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

