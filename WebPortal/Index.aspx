<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>桌享奇遊│桌遊出租</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="桌享奇遊是一個桌遊出租網站，目前總共提供幾十款正版桌遊，還在持續更新中，適合所有年齡層來動腦，不管在朋友或親子聚會和聯誼活動，皆可進行的桌上遊戲，可以增進彼此之間的感情、方便假日消磨時間、認識新朋友和活絡我們的大腦等等好處，歡迎加入我們的FB社團，留言租借去。" />
    <meta name="keywords" content="桌遊,BoardGame,出租,Rental,聚會,Party,遊戲,Game,活動,Activity" />
    <meta name="author" content="James,Louis" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="CSS/bootstrap.min.css" />
    <script src="Scripts/jquery-3.2.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>        
    <script>
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:150px;background-color:green;"></div>
        <div style="height:600px;">
            <iframe id="MainContent" src="ExploreGame/Index.aspx" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
        </div>
    </form>
</body>
</html>
