using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ExploreGame_Index : BgwPage
{
    private DbLibrary DbLibraryControl = new DbLibrary();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //列表預設值
            hfSortColumn.Value = "GBI.GameName";
            hfSortValue.Value = "asc";
            hfPerPageDataCount.Value = "5";
            hfCurPage.Value = "1";
            hfTotalPage.Value = "1";
            hfTableMode.Value = "0";
            btnTableMode.Text = GetLocalResourceObject("PictureMode").ToString();
            divListTable.Visible = true;
            divPictureTable.Visible = false;
            btnSearchClick(null, null);
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
        if (e.Item.ItemType == ListItemType.Header)
        {
            Literal ltlGameNameSort = e.Item.FindControl("ltlGameNameSort") as Literal;
            Literal ltlGamePlayerSort = e.Item.FindControl("ltlGamePlayerSort") as Literal;
            Literal ltlGameTimeSort = e.Item.FindControl("ltlGameTimeSort") as Literal;
            Literal ltlGameDifficultySort = e.Item.FindControl("ltlGameDifficultySort") as Literal;
            Literal ltlGameLuckSort = e.Item.FindControl("ltlGameLuckSort") as Literal;
            Literal ltlGameStrategySort = e.Item.FindControl("ltlGameStrategySort") as Literal;
            Literal ltlGameInteractionSort = e.Item.FindControl("ltlGameInteractionSort") as Literal;

            if (hfSortColumn.Value == "GBI.GameName")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGameNameSort.Text = "↑";
                }
                else
                {
                    ltlGameNameSort.Text = "↓";
                }
            }
            else if (hfSortColumn.Value == "GBI.MaxPlayer")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGamePlayerSort.Text = "↑";
                }
                else
                {
                    ltlGamePlayerSort.Text = "↓";
                }
            }
            else if (hfSortColumn.Value == "GBI.Time")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGameTimeSort.Text = "↑";
                }
                else
                {
                    ltlGameTimeSort.Text = "↓";
                }
            }
            else if (hfSortColumn.Value == "GBI.Difficulty")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGameDifficultySort.Text = "↑";
                }
                else
                {
                    ltlGameDifficultySort.Text = "↓";
                }
            }
            else if (hfSortColumn.Value == "GBI.Luck")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGameLuckSort.Text = "↑";
                }
                else
                {
                    ltlGameLuckSort.Text = "↓";
                }
            }
            else if (hfSortColumn.Value == "GBI.Strategy")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGameStrategySort.Text = "↑";
                }
                else
                {
                    ltlGameStrategySort.Text = "↓";
                }
            }
            else if (hfSortColumn.Value == "GBI.Interaction")
            {
                if (hfSortValue.Value == "asc")
                {
                    ltlGameInteractionSort.Text = "↑";
                }
                else
                {
                    ltlGameInteractionSort.Text = "↓";
                }
            }            
        }

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView drv = e.Item.DataItem as DataRowView;
            Literal ltlGamePlayerValue = e.Item.FindControl("ltlGamePlayerValue") as Literal;
            CheckBox cbSelect = e.Item.FindControl("cbSelect") as CheckBox;

            ltlGamePlayerValue.Text = drv["MinPlayer"].ToString() + "-" + drv["MaxPlayer"].ToString();
            cbSelect.InputAttributes["value"] = drv["PK"].ToString();
        }

        if (e.Item.ItemType == ListItemType.Footer)
        {
            LinkButton lbLastPage = e.Item.FindControl("lbLastPage") as LinkButton;
            LinkButton lbNextPage = e.Item.FindControl("lbNextPage") as LinkButton;
            HtmlTableRow trEmptyData = e.Item.FindControl("trEmptyData") as HtmlTableRow;

            if (hfTotalPage.Value == "1")
            {
                lbLastPage.Enabled = false;
                lbNextPage.Enabled = false;
            }
            else if (hfTotalPage.Value == hfCurPage.Value)
            {
                lbLastPage.Enabled = true;
                lbNextPage.Enabled = false;
            }
            else if (hfCurPage.Value == "1")
            {
                lbLastPage.Enabled = false;
                lbNextPage.Enabled = true;
            }
            else
            {
                lbLastPage.Enabled = true;
                lbNextPage.Enabled = true;
            }

            if (hfTotalDataCount.Value == "0")
            {
                trEmptyData.Visible = true;
            }
            else
            {
                trEmptyData.Visible = false;
            }
        }
    }

    protected void rptBoardGamePMode_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {   
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //DataRowView drv = e.Item.DataItem as DataRowView;
            //Literal ltlGamePlayerValue = e.Item.FindControl("ltlGamePlayerValue") as Literal;
            //CheckBox cbSelect = e.Item.FindControl("cbSelect") as CheckBox;

            //ltlGamePlayerValue.Text = drv["MinPlayer"].ToString() + "-" + drv["MaxPlayer"].ToString();
            //cbSelect.InputAttributes["value"] = drv["PK"].ToString();
        }       
    }

    protected void btnSearchClick(object sender, EventArgs e)
    {
        //時間上下限
        int TimeDownLimit = 0;
        int TimeUpLimit = 0;
        if (Request.Form["rdoTime"] != null)
        {
            if (Request.Form["rdoTime"].ToString() == "1")
            {
                TimeUpLimit = 29;
            }
            else if (Request.Form["rdoTime"].ToString() == "2")
            {
                TimeDownLimit = 30;
                TimeUpLimit = 60;
            }
            else if (Request.Form["rdoTime"].ToString() == "3")
            {
                TimeDownLimit = 60;
                TimeUpLimit = 90;
            }
            else if (Request.Form["rdoTime"].ToString() == "4")
            {
                TimeDownLimit = 91;
            }
        }

        //顯示第一頁
        if (sender != null)
        {
            hfCurPage.Value = "1";
        }

        //搜尋的資料
        string SearchSql = string.Format(@"
            select distinct GBI.*, ROW_NUMBER() over(order by {6}) as RowNum 
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
             (string.IsNullOrEmpty(hfSelectedTypePKs.Value))? "NULL": hfSelectedTypePKs.Value,
             (string.IsNullOrEmpty(iptRentalDate.Value)) ? "NULL" : iptRentalDate.Value,
             hfSortColumn.Value + " " + hfSortValue.Value
        );
        
        //綁定列表資料
        DataSet mySearchData = DbLibraryControl.QueryDataSet(SearchSql, "SearchDataResult");
        hfTotalDataCount.Value = mySearchData.Tables["SearchDataResult"].Rows.Count.ToString();
        hfTotalPage.Value = ((hfTotalDataCount.Value == "0") ? "1" : (Math.Ceiling(Convert.ToDouble(hfTotalDataCount.Value) / Convert.ToDouble(hfPerPageDataCount.Value)).ToString()));
        if (mySearchData.Tables["SearchDataResult"].Rows.Count == 0)
        {
            rptBoardGame.DataSource = "";
            rptBoardGamePMode.DataSource = "";      
        }
        else
        {
            int RowStart = (Convert.ToInt32(hfCurPage.Value) - 1) * Convert.ToInt32(hfPerPageDataCount.Value) + 1;
            int RowEnd = Convert.ToInt32(hfCurPage.Value) * Convert.ToInt32(hfPerPageDataCount.Value);
            List<DataRow> SearchDataResultList = mySearchData.Tables["SearchDataResult"].Rows.Cast<DataRow>().ToList();
            rptBoardGame.DataSource = SearchDataResultList.Where(row => Convert.ToInt32(row["RowNum"]) >= RowStart &&
                Convert.ToInt32(row["RowNum"]) <= RowEnd).CopyToDataTable();
            rptBoardGamePMode.DataSource = SearchDataResultList.Where(row => Convert.ToInt32(row["RowNum"]) >= RowStart &&
                Convert.ToInt32(row["RowNum"]) <= RowEnd).CopyToDataTable();
        }
        rptBoardGame.DataBind();
        rptBoardGamePMode.DataBind();
        ltlDataTotal.Text = string.Format(GetLocalResourceObject("DataTotal").ToString(), hfTotalDataCount.Value);
        ltlPageInfo.Text = string.Format(GetLocalResourceObject("PageInfo").ToString(), hfCurPage.Value, hfTotalPage.Value);               
    }

    protected void btnAddGameClick(object sender, EventArgs e)
    {
        Response.Redirect("~/ExploreGame/AddEditGame.aspx?Action=Add");
    }

    protected void btnTableModeClick(object sender, EventArgs e)
    {      
        if (hfTableMode.Value == "0")
        {
            hfTableMode.Value = "1";
            btnTableMode.Text = GetLocalResourceObject("ListMode").ToString();
            divListTable.Visible = false;
            divPictureTable.Visible = true;
        }
        else
        {
            hfTableMode.Value = "0";
            btnTableMode.Text = GetLocalResourceObject("PictureMode").ToString();
            divListTable.Visible = true;
            divPictureTable.Visible = false;
        }
    }

    protected void btnDeleteClick(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(hfDelPKs.Value))
        {
            DbLibraryControl.Query(string.Format(@"
                delete from ScoreRecord where GamePK in ({0});
                delete from GameExtension where GamePK in ({0});
                delete from GameCategory where GamePK in ({0});
                delete from GameBasicInfo where PK in ({0});"
            , hfDelPKs.Value));
            hfDelPKs.Value = "";
            btnSearchClick(sender, e);
            Response.Write("<script>alert('" + GetLocalResourceObject("DeleteSuccess").ToString() + "')</script>");
        }
    }

    protected void btnExportExcelClick(object sender, EventArgs e)
    {

    }

    protected void lbClick(object sender, EventArgs e)
    {
        LinkButton lbBtn = (LinkButton)(sender);
        if (lbBtn.CommandName == "Sort")
        {
            if((hfSortColumn.Value == lbBtn.CommandArgument) &&
                (hfSortValue.Value == "asc"))
            {
                hfSortValue.Value = "desc";
            }
            else
            {
                hfSortValue.Value = "asc";
            }
            hfSortColumn.Value = lbBtn.CommandArgument;
        }
        else if (lbBtn.CommandName == "Page")
        {
            if (lbBtn.CommandArgument == "Next")
            {
                hfCurPage.Value = (Convert.ToInt16(hfCurPage.Value) + 1).ToString();
            }
            else if (lbBtn.CommandArgument == "Last")
            {
                hfCurPage.Value = (Convert.ToInt16(hfCurPage.Value) - 1).ToString();
            }
        }
        btnSearchClick(null, null);        
    }

    protected void btnPerPageClick(object sender, EventArgs e)
    {
        hfPerPageDataCount.Value = ddlPerPage.SelectedValue;
        btnSearchClick(sender, e);        
    }
}