using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExploreGame_Index : BgwPage
{
    private DbLibrary DbLibraryControl = new DbLibrary();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet myBoardGameData = DbLibraryControl.QueryDataSet("select * from GameBasicInfo", "GameBasicInfoResult");
            rptBoardGame.DataSource = myBoardGameData;
            rptBoardGame.DataBind();
        }
    }

    protected void rptBoardGame_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView drv = e.Item.DataItem as DataRowView;
            Literal ltlRentalDateValue = e.Item.FindControl("ltlRentalDateValue") as Literal;
            Literal ltlPlayerValue = e.Item.FindControl("ltlPlayerValue") as Literal;

            ltlRentalDateValue.Text = Convert.ToDateTime(drv["RentalDate"].ToString()).ToString("yyyy-MM-dd");
            ltlPlayerValue.Text = drv["PlayerMin"].ToString() + "-" + drv["PlayerMax"].ToString();
        }
    }

    protected void btnSearchClick(object sender, EventArgs e)
    {
    }

    protected void btnAddGameClick(object sender, EventArgs e)
    {
        Response.Redirect("~/ExploreGame/AddEditGame.aspx?Action=Add");
    }

    protected void btnExportExcelClick(object sender, EventArgs e)
    {

    }
}