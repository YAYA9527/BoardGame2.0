using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CommonLibrary 的摘要描述
/// </summary>
public class CommonLibrary
{
    public static string GetResourceString(string resourceKey)
    {
        return GetResourceString(
            HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath,
            resourceKey);
    }

    public static string GetResourceString(string virtualPath, string resourceKey)
    {
        return HttpContext.GetLocalResourceObject(
            VirtualPathUtility.Combine(HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath, virtualPath),
            resourceKey) as string;
    }
}