<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Chitiethdb.aspx.cs" Inherits="Banmypham.Manager.Chitiethdb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:DataGrid runat="server" ID="dgchitiethdb" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundColumn DataField="MaMP" HeaderText="Mã mỹ phẩm"></asp:BoundColumn>
        <asp:BoundColumn DataField="Soluong" HeaderText="Số lượng"></asp:BoundColumn>
        <asp:BoundColumn DataField="Dongiaban" HeaderText="Đơn giá bán">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="Giamgia" HeaderText="Giảm giá"></asp:BoundColumn>
        <asp:BoundColumn DataField="Thanhtien" HeaderText="Thành tiền">
        </asp:BoundColumn>
    </Columns>

</asp:DataGrid>
</asp:Content>
