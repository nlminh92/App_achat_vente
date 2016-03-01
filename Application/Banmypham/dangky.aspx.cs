using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Banmypham
{
    public partial class dangky : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btndangky_Click(object sender, EventArgs e)
        {
            string hoten = txthoten.Text;
            DataTable dt = connect.getDataTable("SELECT * FROM Nguoidung WHERE tendangnhap = '" + hoten + "'");
            if (dt.Rows.Count == 0)
            {
                string diachi = txtdiachi.Text;
                string dienthoai = txtsodienthoai.Text;
                string email = txtemail.Text;
                string gioitinh = rdoNam.Checked ? "Nam" : "Nữ";
                string ngaysinh = string.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(txtngaysinh.Text));
                string tendangnhap = txttendangnhap.Text;
                string matkhau = txtmatkhau.Text;

                connect.UpdateData("INSERT INTO Nguoidung (Hoten, Ngaysinh, Diachi, SoDT, Maquyenhan, Gioitinh, Email, Tendangnhap, Password)" + " VALUES(N'" + hoten + "', '" 
                    + ngaysinh + "', N'" + diachi + "', " + dienthoai + ", " + 2 + ", N'" + gioitinh + "', '" + email + "', '" + tendangnhap + "', '" + matkhau + "')");
                Response.Write("<script language='javascript'>alert('Chúc mừng bạn đăng ký thành công!');</script>");
                Session["nguoidung"] = tendangnhap;
                Session["password"] = matkhau;
                Response.AddHeader("Refresh", "1;url=Default.aspx");

            }
            else
                Response.Write("<p>Tên đăng nhập này đã tồn tại</p>");
        }
    }
}