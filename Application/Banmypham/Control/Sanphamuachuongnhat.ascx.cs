using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Banmypham.Control
{
    public partial class Sanphamuachuongnhat : System.Web.UI.UserControl
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = connect.getDataTable("SELECT DMMypham.MaMP, DMMypham.TenMP, LoaiMP.Tenloai, DMMypham.Maloai, DMMypham.Dongiaban, DMMypham.Anh FROM DMMypham, LoaiMP WHERE LoaiMP.Maloai = DMMypham.Maloai AND DMMypham.Soluong>9");
                pager.PageSize = 2;
                pager.DataSource = dt.DefaultView;
                pager.BindToControl = dlSanpham;
                dlSanpham.DataSource = pager.DataSourcePaged;
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