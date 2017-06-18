using System;
using System.Collections.Generic;
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
    private bool _IsExtension = false;
    public bool IsExtension
    {
        get { return _IsExtension; }
        set { _IsExtension = value; }
    }
    private bool _IsOpen = true;
    public bool IsOpen
    {
        get { return _IsOpen; }
        set { _IsOpen = value; }
    }
}