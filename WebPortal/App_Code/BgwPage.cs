using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// BgwPage 的摘要描述
/// </summary>
public class BgwPage : System.Web.UI.Page 
{	
    public string GetResStr(string name)
    {
        return CommonLibrary.GetResourceString(name);
    }
}