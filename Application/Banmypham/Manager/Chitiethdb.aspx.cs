using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Banmypham.Manager
{
    public partial class Chitiethdb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dgchitiethdb.DataSource = Session["chitiethd"];
            dgchitiethdb.DataBind();
        }
    }
}