using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banmypham.Manager
{
    public partial class Manager : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tendangnhap"] != null)
                lblhoten.Text = "Hello " + Session["tendangnhap"] + " - admin";
        }

        protected void lbtLogout_Click(object sender, EventArgs e)
        {
            Session["tendangnhap"] = "";
            Response.Redirect("~/Default.aspx");
        }
    }
}