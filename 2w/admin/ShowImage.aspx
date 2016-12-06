<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ShowImage.aspx.cs" Inherits="admin_ShowImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center">
        <h2 style="text-align:center">截图详情</h2>
        <asp:Image ID="showImage" Width="960px" runat="server" />
    </div>
</asp:Content>

