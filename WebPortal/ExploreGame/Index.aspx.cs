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
            DataSet myBoardGameData = DbLibraryControl.QueryDataSet("select * from GameBasicInfo where IsOpen = 1", "GameBasicInfoResult");
            rptBoardGame.DataSource = myBoardGameData;
            rptBoardGame.DataBind();
        }

        //類型
        DataSet DsGameTypes = DbLibraryControl.QueryDataSet("select TI.* from Tree as T inner join TreeItem as TI on TI.TreePK = T.PK where T.Name = 'GameType'", "GameTypesResult");
        foreach (DataRow row in DsGameTypes.Tables["GameTypesResult"].Rows)
        {
            Label lblType = new Label()
            {
                CssClass = "checkbox-inline"
            };
            CheckBox cblType = new CheckBox
            {
                Text = row["Name"].ToString() + "&nbsp;&nbsp;",
                Checked = false
            };
            cblType.InputAttributes["value"] = row["PK"].ToString();
            lblType.Controls.Add(cblType);
            divType.Controls.Add(lblType);
        }
    }

    protected void rptBoardGame_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView drv = e.Item.DataItem as DataRowView;
            Literal ltlGamePlayerValue = e.Item.FindControl("ltlGamePlayerValue") as Literal;

            ltlGamePlayerValue.Text = drv["MinPlayer"].ToString() + "-" + drv["MaxPlayer"].ToString();
        }
    }

    protected void btnSearchClick(object sender, EventArgs e)
    {
        //時間上下限
        int TimeDownLimit = 0;
        int TimeUpLimit = 0;
        if (Request.Form["rdoTime"].ToString() == "1")
        {
            TimeUpLimit = 29;
        }
        else if(Request.Form["rdoTime"].ToString() == "2")
        {
            TimeDownLimit = 30;
            TimeUpLimit = 60;
        }
        else if(Request.Form["rdoTime"].ToString() == "3")
        {
            TimeDownLimit = 60;
            TimeUpLimit = 90;
        }
        else if(Request.Form["rdoTime"].ToString() == "4")
        {
            TimeDownLimit = 91;
        }

        string SearchSql = string.Format(@"
            select distinct GBI.* 
            from GameBasicInfo as GBI 
                left join GameCategory as GC on GC.GamePK = GBI.PK
            where (GBI.IsOpen = 1) and ('{0}' = 'NULL' or GBI.GameName like N'%{0}%') and
                       ({1} = 0 or GBI.MinPlayer <= {1}) and ({1} = 0 or GBI.MaxPlayer >= {1}) and 
                       ({2} = 0 or GBI.Time >= {2}) and ({3} = 0 or GBI.Time <= {3}) and 
                       ('{4}' = 'NULL' or GC.TreeItemPK in ({4})) and ('{5}' = 'NULL' or GBI.RentalStartDate <= '{5}  00:00:00')",
             (string.IsNullOrEmpty(txtKeyWord.Value.Trim())) ? "NULL" : txtKeyWord.Value.Trim(),
             Convert.ToUInt16(ddlPlayer.SelectedValue),
             TimeDownLimit,
             TimeUpLimit,
             hfSelectedTypePKs.Value,
             (string.IsNullOrEmpty(iptRentalDate.Value)) ? "NULL" : iptRentalDate.Value
        );
        
        DataSet mySearchData = DbLibraryControl.QueryDataSet(SearchSql, "SearchDataResult");
        if (mySearchData.Tables["SearchDataResult"].Rows.Count == 0)
        {
            rptBoardGame.DataSource = "";
        }
        else
        {
            rptBoardGame.DataSource = mySearchData.Tables["SearchDataResult"];
        }
        rptBoardGame.DataBind();       
    }

    protected void btnAddGameClick(object sender, EventArgs e)
    {
        Response.Redirect("~/ExploreGame/AddEditGame.aspx?Action=Add");
    }

    protected void btnExportExcelClick(object sender, EventArgs e)
    {

    }
}