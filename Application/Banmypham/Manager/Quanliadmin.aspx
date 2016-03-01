<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Quanliadmin.aspx.cs" Inherits="Banmypham.Manager.Quanliadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td colspan="2" style=" font-size: 18px; color:#FF0080; font-weight: bold;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                QUẢN LÝ NGƯỜI DÙNG
            </td>
        </tr>
        <tr>
            <td style="width:20%;">
                <asp:Label ID="Label1" runat="server" Text="Họ tên:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtHoten" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Ngày sinh:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNgaysinh" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Địa chỉ:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDiachi" runat="server" Width="270px" TextMode="MultiLine">
                </asp:TextBox>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Số điện thoại:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoDT" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Mã quyền hạn:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drMaquyenhan" runat="server" Width="270px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Giới tính:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="rdoNam" runat="server" Text="Nam" Font-Bold="true" Checked="true" GroupName="gioitinh" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdoNu" runat="server" Text="Nữ"  Font-Bold="true" GroupName="gioitinh" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Email:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Tên đăng nhập:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTendangnhap" runat="server" Width="270px">
                </asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblThongbao" runat="server" ForeColor ="Red">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Password:" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThem" Text="Thêm" Width="70px" runat="server"  
                    Font-Bold="true" onclick="btnThem_Click"/>
            </td>
        </tr>
    </table>

    <asp:DataGrid runat="server" ID="dgNguoidung" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyField="ID" Width="990px" 
        onpageindexchanged="dgNguoidung_PageIndexChanged" OnEditCommand="OnEdit" OnCancelCommand="OnCancel" OnDeleteCommand="OnDelete" OnUpdateCommand="OnUpdate">
        <Columns>
            <asp:BoundColumn DataField="ID" HeaderText="IDUser">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Hoten" HeaderText="Tên người dùng">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Ngaysinh" HeaderText="Ngày sinh"></asp:BoundColumn>
            <asp:BoundColumn DataField="Diachi" HeaderText="Địa chỉ"></asp:BoundColumn>
            <asp:BoundColumn DataField="SoDT" HeaderText="Số điện thoại"></asp:BoundColumn>
            <asp:BoundColumn DataField="Maquyenhan" HeaderText="Mã quyền hạn"></asp:BoundColumn>
            <asp:BoundColumn DataField="Gioitinh" HeaderText="Giới tính"></asp:BoundColumn>
            <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
            <asp:BoundColumn DataField="Tendangnhap" HeaderText="Tên đăng nhập"></asp:BoundColumn>
            <asp:BoundColumn DataField="Password" HeaderText="Password"></asp:BoundColumn>
            <asp:EditCommandColumn CancelText="Cancel" EditText="Edit" UpdateText="Update">
            </asp:EditCommandColumn>
            <asp:ButtonColumn CommandName="Delete" Text="Delete"></asp:ButtonColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
</asp:Content>
