<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Themmypham.aspx.cs" Inherits="Banmypham.Manager.Themmypham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td colspan="2" style=" font-weight: bold; color: #FF0080; width: 31%;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                THÊM, XÓA, SỬA MỸ PHẨM
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label1" Text="Tên mỹ phẩm: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTenMP" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label2" Text="Mã loại: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drMaloai" runat="server" Width="270px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label3" Text="Mã hãng sản xuất: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drMaHSX" runat="server" Width="270px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label4" Text="Mã nhà cung cấp: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drMaNCC" runat="server" Width="270px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label5" Text="Số lượng: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoluong" runat="server" Width="270px">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width:30%"align="left">
                <asp:Label ID="Label6" Text="Đơn giá bán: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDongiaban" runat="server" Width="270px">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width:30%"align="left">
                <asp:Label ID="Label9" Text="Giảm giá: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGiamgia" runat="server" Width="270px">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label7" Text="Mô tả: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMota" runat="server" Width="270px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width:31%"align="left">
                <asp:Label ID="Label8" Text="Ảnh: " Font-Bold="true" runat="server">
                </asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fuAnh" runat="server" Width="270px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThemmoi" runat="server" Width="100px" Text="Thêm mới" Font-Bold="true" BackColor="#FF0080" ForeColor="White"
                    onclick="btnThemmoi_Click" />
            </td>
        </tr>
    </table>
    <asp:DataGrid runat="server" ID="dgMypham" Width="995px"
        AutoGenerateColumns="False" AllowPaging="True" DataKeyField="MaMP" 
        PagerStyle-Mode="NumericPages" 
        onpageindexchanged="dgMypham_PageIndexChanged" OnEditCommand="OnEdit" OnDeleteCommand="OnDelete" OnCancelCommand="OnCancle" OnUpdateCommand="OnUpdate">
        <Columns>
            <asp:BoundColumn DataField="MaMP" HeaderText="Mã mỹ phẩm" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="TenMP" HeaderText="Tên mỹ phẩm"  HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Maloai" HeaderText="Mã loại"  HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MaHSX" HeaderText="Mã hãng sản xuất"  HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MaNCC" HeaderText="Mã nhà cung cấp" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Soluong" HeaderText="Số lượng" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Dongiaban" HeaderText="Đơn giá bán" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Giamgia" HeaderText="Giảm giá" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Mota" HeaderText="Mô tả" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Anh" HeaderText="Ảnh" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#FF66FF">
<HeaderStyle Font-Bold="True"></HeaderStyle>
            </asp:BoundColumn>
            <asp:EditCommandColumn CancelText="Cancel" EditText="Edit" UpdateText="Update" HeaderStyle-BackColor="#FF66FF">
            </asp:EditCommandColumn>
            <asp:ButtonColumn CommandName="Delete" Text="Delete" HeaderStyle-BackColor="#FF66FF"></asp:ButtonColumn>
        </Columns>

<PagerStyle Mode="NumericPages"></PagerStyle>
    </asp:DataGrid>
</asp:Content>
