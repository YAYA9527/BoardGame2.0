<%@ Application Language="C#" %>
<%@ Import Namespace="WebPortal" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 應用程式啟動時執行的程式碼
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        AuthConfig.RegisterOpenAuth();
        RouteConfig.RegisterRoutes(RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e)
    {
        //  應用程式關閉時執行的程式碼

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 發生未處理錯誤時執行的程式碼

    }

</script>
