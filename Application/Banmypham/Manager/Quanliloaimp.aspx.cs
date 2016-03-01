using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banmypham.Manager
{
    public partial class Quanliloaimp : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDG();
            }
        }

        protected void LoadDG()
        {
            dgLoaimp.DataSource = connect.getDataTable("SELECT * FROM LoaiMP");
            dgLoaimp.DataBind();
        }

        protected void dgLoaimp_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgLoaimp.CurrentPageIndex = e.NewPageIndex;
            LoadDG();
        }
        protected void OnEdit(object sender, DataGridCommandEventArgs e)
        {
            dgLoaimp.EditItemIndex = e.Item.ItemIndex;
            LoadDG();
        }
        protected void OnUpdate(object sender, DataGridCommandEventArgs e)
        {
            int id = e.Item.ItemIndex;
            int ma = (int)dgLoaimp.DataKeys[id];

            int mamoi = int.Parse(((TextBox)e.Item.Cells[0].Controls[0]).Text);
            string tenloai = ((TextBox)e.Item.Cells[1].Controls[0]).Text.ToString();

            connect.UpdateData("UPDATE LoaiMP SET Tenloai=N'" + tenloai + "' WHERE Maloai=" + ma);
            dgLoaimp.EditItemIndex = -1;
            LoadDG();
        }
        protected void OnDelete(object sender, DataGridCommandEventArgs e)
        {
            int id = e.Item.ItemIndex;
            int ma = (int)dgLoaimp.DataKeys[id];

            connect.UpdateData("DELETE FROM LoaiMP WHERE Maloai=" + ma.ToString());
            LoadDG();
        }
        protected void OnCancel(object sender, DataGridCommandEventArgs e)
        {
            dgLoaimp.EditItemIndex = -1;
            LoadDG();
        }

        protected void btnThemmoi_Click(object sender, EventArgs e)
        {
            connect.UpdateData("INSERT INTO LoaiMP(Tenloai) VALUES(N'" + txtTenloai.Text + "')");
            LoadDG();
        }
    }
}