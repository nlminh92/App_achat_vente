<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Timkiemhoadonban.aspx.cs" Inherits="Banmypham.Manager.Timkiemhoadonban" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<center>
    <h1>Tìm kiếm hóa đơn</h1>
</center>
<table width="100%">
    <tr>
        <td style="width: 419px">
            <asp:TextBox runat="server" ID="txtTimkiem" Width="270px">
            </asp:TextBox>
        </td>
        <td>
            <asp:Button runat="server" Width="70px" Text="Tìm" ID="btnTimkiem" 
                onclick="btnTimkiem_Click" />
        </td>
    </tr>
</table>
<asp:DataGrid ID="dgTimkiem" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:HyperLinkColumn DataTextField="SoHDB" NavigateUrl="~/Manager/Chitiethdb.aspx"  HeaderText="Số hóa đơn" HeaderStyle-Font-Bold="true"></asp:HyperLinkColumn>
        <%--<asp:BoundColumn DataField="SoHDB" HeaderText="Số hóa đơn" HeaderStyle-Font-Bold="true"></asp:BoundColumn>--%>
        <asp:BoundColumn DataField="Ngayban" HeaderText="Ngày bán" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
        <asp:BoundColumn DataField="TenKH" HeaderText="Tên khách hàng" HeaderStyle-Font-Bold="true">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="Diachi" HeaderText="Địa chỉ" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
        <asp:BoundColumn DataField="SoDT" HeaderText="Số điện thoại" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
        <asp:BoundColumn DataField="Tongtien" HeaderText="Tổng tiền" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
    </Columns>
</asp:DataGrid>
</asp:Content>
