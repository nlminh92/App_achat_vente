<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Chitietmypham.aspx.cs" Inherits="Banmypham.Chitietmypham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<style type="text/css">
    .style1
    {
        width: 97px;
    }
    .style2
    {
        height: 24px;
    }
</style>
<asp:Label ID="lblChitietmypham" runat="server" Font-Bold="true" Font-Size="18px">Chi tiết mỹ phẩm</asp:Label>
<asp:DataList ID="dlChitietmp" runat="server" BackColor="#CCFFFF" Width="100%" Height="307px">
    <ItemTemplate>
        <table style="width: 100%;">
            <tr>
                <td align="center" class="style1">
                    <asp:Image ID="image1" runat="server" Height="120px" ImageUrl='<%# Eval("Anh") %>' Width="120px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" NavigateUrl='<%# "../Chitietmypham.aspx?MaMP="+Eval("MaMP") %>' Text='<%# Eval("TenMP") %>'>
                    </asp:Label>
                    <%--<asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl='<%# "../Chitietmypham.aspx?MaMP="+Eval("MaMP") %>' Text='<%# Eval("TenMP") %>'>
                    </asp:HyperLink>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "../Myphamcungloai.aspx?Maloai="+Eval("Maloai") %>' Text='<%# Eval("Tenloai") %>'>
                    </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    Đơn giá: &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red" Text='<%# Eval("Dongiaban")+"(VND)" %>'>
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="imgmua" runat="server" ImageUrl="~/Images/dathang.png" 
                        width="70px" CommandName='<%# Eval("MaMP") %>' Height="30px" 
                        OnCommand="imgmua_Command" />
                </td>
            </tr> 
            <tr>
                <td style=" width: 46px; height: 23px;">
                    <asp:Label ID="lblThongtinchung" runat="server" Text='<%# "Hãng sản xuất: " + Eval("TenHSX") + "<br /> Nhà cung cấp: " + Eval("TenNCC") + 
                    "<br /> Số lượng: " + Eval("Soluong") + "<br /> Đơn giá bán: " + Eval("Dongiaban") + "<br /> Giới thiệu: " + Eval("Mota") %>' >
                    </asp:Label>
                </td>
            </tr>                 
        </table>
    </ItemTemplate>    
</asp:DataList>
</asp:Content>
