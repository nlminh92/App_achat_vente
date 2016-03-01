<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="Banmypham.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<asp:Panel ID="Panel1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" Text="GIỎ HÀNG" runat="server" Font-Bold="true">
    </asp:Label><br />
    <asp:Label ID="lblThongbao" runat="server">
    </asp:Label>
    <asp:DataGrid runat="server" ID="dgGiohang" 
        AutoGenerateColumns="False" DataKeyField="MaMP" Width="591px" OnDeleteCommand="OnDelete">
        <Columns>
            <asp:BoundColumn DataField="MaMP" HeaderText="Mã mỹ phẩm" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
            <asp:BoundColumn DataField="TenMP" HeaderText="Tên mỹ phẩm" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
            <asp:BoundColumn DataField="Dongiaban" HeaderText="Đơn giá bán" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
            <asp:BoundColumn DataField="Soluong" HeaderText="Số lượng" HeaderStyle-Font-Bold="true">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Giamgia" HeaderText="Giảm giá" HeaderStyle-Font-Bold="true">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Thanhtien" HeaderText="Thành tiền" HeaderStyle-Font-Bold="true">
            </asp:BoundColumn>
            <%--<asp:EditCommandColumn CancelText="Cancel" EditText="Edit" UpdateText="Update">
            </asp:EditCommandColumn>--%>
            <asp:ButtonColumn CommandName="Delete" Text="Delete"></asp:ButtonColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblTongtien" Text="Tổng tiền: " runat="server" Font-Bold="true">
    </asp:Label>
    <table width="100%">
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnXoagiohang" Text="Xóa giỏ hàng" runat="server" 
                    Font-Bold="true" onclick="btnXoagiohang_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnMuatiep" Text="Mua tiếp" runat="server" Font-Bold="true" 
                    onclick="btnMuatiep_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnDatmua" Text="Đặt mua" runat="server" Font-Bold="true" 
                    onclick="btnDatmua_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMesage" runat="server"  Font-Bold="true" Font-Size="18px"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="Panel2" runat="server" Visible="false">
    <div align="center">
        <asp:Label runat="server" ID="lblSuccess" Font-Bold="true" Font-Size="18px"></asp:Label><br />
        <asp:HyperLink ID="hptrangchu" runat="server" Text="Trở về trang chủ" Font-Bold="true" Font-Size="18px" NavigateUrl="~/Default.aspx"></asp:HyperLink>
    </div>
</asp:Panel>
</asp:Content>
