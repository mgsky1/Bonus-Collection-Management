<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="_2w_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background-color:#FCEFE8;
        }
  .list {
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
    <form id="form1" runat="server">
    <div class="container">
        <br/>
        <asp:Button ID="apply" runat="server" Text="返回" OnClick="apply_Click" />
         <br/>
        <br />
        <asp:GridView ID="List" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" CssClass="list" AutoGenerateColumns="False" 
            onrowdatabound="List_RowDataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="PayID" HeaderText="支付编号" />
                <asp:BoundField DataField="VIPNo" HeaderText="会员号" />
                <asp:BoundField DataField="RefereeNo" HeaderText="推荐人编号" />
                <asp:BoundField DataField="ActiveState" HeaderText="申请状态" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

    </div>
    </form>
</asp:Content>

