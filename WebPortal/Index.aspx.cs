using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : BgwPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void btnLoginClick(object sender, EventArgs e)
    {
        //Response.Redirect("~/ExploreGame/Index.aspx");
    }
}