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
    public partial class Timkiem : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tenmypham = Request.QueryString["TenMP"];
                DataTable dt = connect.getDataTable("SELECT DMMypham.MaMP, DMMypham.TenMP, LoaiMP.Tenloai, DMMypham.Maloai, DMMypham.Dongiaban, DMMypham.Anh FROM DMMypham, LoaiMP WHERE LoaiMP.Maloai = DMMypham.Maloai AND DMMypham.TenMP like N'%" + tenmypham + "%'");
                lblMessage.Text ="Có " + dt.Rows.Count + " mỹ phẩm có tên: " + tenmypham ;
                if (dt.Rows.Count > 0)
                {
                    dlTimkiem.DataSource = dt;
                    dlTimkiem.DataBind();
                }
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