using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BoardGame2._0
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BoardGameMgr/Index.aspx");
        }
    }
}