using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Banmypham.Control;

namespace Banmypham
{
    public partial class Chitietmypham : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int mamp = int.Parse((Request.QueryString["MaMP"]));
                DataTable dt = connect.getDataTable("SELECT a.MaMP, a.TenMP, b.Maloai, b.Tenloai, c.TenHSX, d.TenNCC, a.Soluong, a.Dongiaban, a.Giamgia, a.Mota, a.Anh FROM DMMypham AS a, " + 
                    "LoaiMP AS b, Hangsanxuat AS c, Nhacungcap AS d WHERE b.Maloai = a.Maloai AND c.MaHSX=a.MaHSX AND d.MaNCC=a.MaNCC AND a.MaMP=" + mamp);
                dlChitietmp.DataSource = dt;
                dlChitietmp.DataBind();
            }
        }

        protected void imgmua_Command(object sender, CommandEventArgs e)
        {
            if (Session["giohang"] == null)
            {
                Session["giohang"] = new Giohang();
            }
            Giohang cart = (Giohang)Session["giohang"];
            DataTable tbl = connect.getDataTable("SELECT TenMP, Dongiaban, Giamgia FROM DMMypham WHERE MaMP = " + e.CommandName);
            if (!cart.themGiohang(e.CommandName, tbl.Rows[0]["TenMP"].ToString(), float.Parse(tbl.Rows[0]["Dongiaban"].ToString()), int.Parse(tbl.Rows[0]["Giamgia"].ToString())))
            {
                Response.Write("<Script language='javascript'>alert('Không đủ số lượng để đáp ứng, vui lòng thử lại sau !');</script>");
                return;
            }
            Response.Redirect("~/GioHang.aspx");
        }
    }
}