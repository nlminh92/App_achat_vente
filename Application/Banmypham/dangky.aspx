<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dangky.aspx.cs" Inherits="Banmypham.dangky" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <h3 style="color: #5e9d44">Thông tin đăng ký</h3>
    <div>
        <table border='0' cellpadding='5' cellspacing='0' width='100%' style="border: thin dotted #008080">
            <tr>
                <td style="width: 23%">
                    <b>Họ và tên: </b>
                </td>
                <td>
                    <asp:TextBox ID="txthoten" runat="server" Width="270px" 
                        ControlToValidate="txthoten"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*) Chưa nhập họ tên." ForeColor="Red" ControlToValidate="txthoten">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 23%">
                    <b>Email: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" Width="270px" 
                        ControlToValidate="txtemail"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*) Chưa nhập email." ForeColor="Red" ControlToValidate="txtemail">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Số điện thoại: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtsodienthoai" runat="server" Width="270px" 
                        ControlToValidate="txthoten"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*) Chưa nhập số điện thoại." ForeColor="Red" ControlToValidate="txtsodienthoai">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Ngày sinh: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtngaysinh" runat="server" Width="270px" 
                        ControlToValidate="txthoten"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*) Chưa nhập ngày sinh." ForeColor="Red" ControlToValidate="txtngaysinh">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Giới tính: </b>
                </td>
                <td>
                    <asp:RadioButton ID="rdoNam" runat="server" Text="Nam" Font-Bold="true" Checked="true" GroupName="gioitinh" />
                    <asp:RadioButton ID="rdoNu" runat="server" Text="Nữ"  Font-Bold="true" GroupName="gioitinh" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*) Chưa nhập họ tên." ForeColor="Red" ControlToValidate="txthoten">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Địa chỉ: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtdiachi" runat="server" Width="270px" TextMode="MultiLine"
                        ControlToValidate="txtdiachi"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(*) Chưa nhập địa chỉ." ForeColor="Red" ControlToValidate="txtdiachi">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Tên đăng nhập: </b>
                </td>
                <td>
                    <asp:TextBox ID="txttendangnhap" runat="server" Width="270px" 
                        ControlToValidate="txttendangnhap"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="(*) Chưa nhập tên đăng nhập." ForeColor="Red" ControlToValidate="txttendangnhap">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Mật khẩu: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtmatkhau" runat="server" Width="270px" 
                        ControlToValidate="txtmatkhau" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="(*) Chưa nhập mật khẩu. (*)Mật khẩu không hợp lệ" ForeColor="Red" ControlToValidate="txtmatkhau">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <b>Xác nhận mật khẩu: </b>
                </td>
                <td>
                    <asp:TextBox ID="txtxacnhan" runat="server" Width="270px" 
                        ControlToValidate="txtxacnhan" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="(*) Mật khẩu không khớp." ControlToCompare="txtmatkhau" ControlToValidate="txtxacnhan">
                    </asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="(*) Chưa nhập xác nhận mật khẩu." ForeColor="Red" ControlToValidate="txtxacnhan">
                    </asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td colspan='3'>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btndangky" runat="server" Text="Đăng ký" ForeColor="White" 
                        BackColor="#FF0080" Font-Bold="true" OnClick="btndangky_Click"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

