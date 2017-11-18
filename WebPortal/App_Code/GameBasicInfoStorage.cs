using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// GameBasicInfoStorage 的摘要描述
/// </summary>
public class GameBasicInfoStorage
{
    public string GameName { get; set; }
    public int Time { get; set; }
    public int MinPlayer { get; set; }
    public int MaxPlayer { get; set; }
    public string[] GameCategory { get; set; }
    public string RentalStartDate { get; set; }
    public int Difficulty { get; set; }
    public int Luck { get; set; }
    public int Strategy { get; set; }
    public int Interaction { get; set; }
    public int Rent { get; set; }
    public int Deposit { get; set; }
    public string TeachingUrl { get; set; }
    public string ImgName { get; set; }
    public string Description { get; set; }
    private int _RentalNumber = 0;
    public int RentalNumber
    {
        get { return _RentalNumber; }
        set { _RentalNumber = value; }
    }
    private uint _IsExtension = 0;
    public uint IsExtension
    {
        get { return _IsExtension; }
        set { _IsExtension = value; }
    }
    private uint _IsOpen = 1;
    public uint IsOpen
    {
        get { return _IsOpen; }
        set { _IsOpen = value; }
    }

    public GameBasicInfoStorage()
    {
    }

    public GameBasicInfoStorage(int PK)
    {
        DbLibrary DbLibraryControl = new DbLibrary();
        DataTable DtGameBasicInfoResult = new DataTable();
        DtGameBasicInfoResult = DbLibraryControl.QueryDataSet(string.Format(@"select * from GameBasicInfo where PK = {0}", PK), "GameBasicInfoResult").Tables["GameBasicInfoResult"];
        if (DtGameBasicInfoResult.Rows.Count != 0)
        {
            this.GameName = DtGameBasicInfoResult.Rows[0]["GameName"].ToString();
            this.MinPlayer = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["MinPlayer"]);
            this.MaxPlayer = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["MaxPlayer"]);
            this.Time = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Time"]);
            this.Difficulty = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Difficulty"]);
            this.Luck = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Luck"]);
            this.Strategy = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Strategy"]);
            this.Interaction = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Interaction"]);
            this.ImgName = DtGameBasicInfoResult.Rows[0]["ImgName"].ToString();
            this.RentalNumber = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["RentalNumber"]);
            this.IsExtension = Convert.ToUInt16(DtGameBasicInfoResult.Rows[0]["IsExtension"]);
            this.RentalStartDate = Convert.ToDateTime(DtGameBasicInfoResult.Rows[0]["RentalStartDate"]).ToString("yyyy-MM-dd");
            this.Rent = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Rent"]);
            this.Deposit = Convert.ToInt16(DtGameBasicInfoResult.Rows[0]["Deposit"]);
            this.TeachingUrl = DtGameBasicInfoResult.Rows[0]["TeachingUrl"].ToString();
            this.Description = DtGameBasicInfoResult.Rows[0]["Description"].ToString();
            this.IsOpen = Convert.ToUInt16(DtGameBasicInfoResult.Rows[0]["IsOpen"]);
        }
    }
  
    public string SaveAsNew(string Program)
    {
        DbLibrary DbLibraryControl = new DbLibrary();
        DataSet DsAddGameResult = new DataSet();
        DataSet DsLogResult = new DataSet();
        
        try
        {
            DsAddGameResult = DbLibraryControl.QueryDataSet(string.Format(@"insert into GameBasicInfo values (N'{0}',{1},{2},{3},{4},{5},{6},{7},
                        N'{8}',{9},{10},'{11}',{12},{13},'{14}','{15}',{16}); select SCOPE_IDENTITY() as GamePK;", this.GameName, this.MinPlayer, this.MaxPlayer, this.Time, 
                        this.Difficulty, this.Luck, this.Strategy, this.Interaction, this.ImgName, this.RentalNumber, this.IsExtension, this.RentalStartDate,
                        this.Rent, this.Deposit, this.TeachingUrl, this.Description, this.IsOpen
                    ), "AddGameResult");

            foreach (string TreeItemPK in this.GameCategory)
            {
                DbLibraryControl.Query(string.Format(@"insert into GameCategory values ({0},{1})", DsAddGameResult.Tables["AddGameResult"].Rows[0]["GamePK"].ToString(),
                    TreeItemPK));
            }
        }
        catch(Exception ex)
        {
            DsLogResult = DbLibraryControl.QueryDataSet(string.Format(@"insert into Log values ('{0}', '{1}', 'SaveAsNew', GetDate()); select SCOPE_IDENTITY() as LogPK;", 
                ex.ToString().Replace("'", ""), Program), "LogResult");
            return DsLogResult.Tables["LogResult"].Rows[0]["LogPK"].ToString();
        }

        return "0";
    }

    public string Save(string Program)
    {
        DbLibrary DbLibraryControl = new DbLibrary();
        try
        {

        }
        catch (Exception ex)
        {
            DbLibraryControl.Query(string.Format("insert into Log values ('{0}', '{1}', 'Save', GetDate())", ex.ToString(), Program));
            return "1";
        }

        return "0";
    }
}
