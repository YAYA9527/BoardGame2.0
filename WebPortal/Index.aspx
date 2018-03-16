<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>桌享奇遊│桌遊出租</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="桌享奇遊是一個桌遊出租網站，目前總共提供幾十款正版桌遊，還在持續更新中，適合所有年齡層來動腦，不管在朋友或親子聚會和聯誼活動，皆可進行的桌上遊戲，可以增進彼此之間的感情、方便假日消磨時間、認識新朋友和活絡我們的大腦等等好處，歡迎加入我們的FB社團，留言租借去。" />
    <meta name="keywords" content="桌遊,BoardGame,出租,Rental,聚會,Party,遊戲,Game,活動,Activity" />
    <meta name="author" content="James,Louis" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CSS/bootstrap.min.css" />
    <style>
        #container {
            width: 100%;
        }

        #containerHeader {
            background-color: #5cb85c;
            height: 60px;
            position:relative;
        }  

        #divLogin {
            position:absolute;
            top:0;
            right:0;
        }

        .btn-success:hover {
            background-color: #ffffff;
        }

        #btnLogin {
            color:black;
            margin-top:12px;
        }

        .nav > li > a:focus, .nav > li > a:hover {
            background-color: #5cb85c;
        }

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 30%;
            margin: auto;
        }

        #containerFooter {
            height: 100px;
            display:flex;
            justify-content:center;
            align-items:center;
            background-color: #5cb85c;
        }
    </style>
    <script src="Scripts/jquery-3.2.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        function linkMenuClick(target) {
            if (target == "News") {
                document.getElementById("iframeContent").src = "ExploreGame/Index.aspx";
            }
            else if ("ExploreGame") {
                document.getElementById("iframeContent").src = "ExploreGame/Index.aspx";
            }
            else if ("Price") {
                document.getElementById("iframeContent").src = "ExploreGame/Index.aspx";
            }
            else if ("Rent") {
                document.getElementById("iframeContent").src = "ExploreGame/Index.aspx";
            }
            else if ("QA") {
                document.getElementById("iframeContent").src = "ExploreGame/Index.aspx";
            }
            else {
                document.getElementById("iframeContent").src = "Index.aspx";
            }
            document.getElementById("iframeContent").style.display = "";
            document.getElementById("myCarousel").style.display = "none";
            $("html,body").animate({
                scrollTop: $("#iframeContent").offset().top
            }, "show");
        }
        
        function setIframeHeight() {
            var iframeContent = document.getElementById("iframeContent");
            if (iframeContent && !window.opera) {
                if (iframeContent.contentDocument && iframeContent.contentDocument.body.offsetHeight) {
                    iframeContent.height = iframeContent.contentDocument.body.offsetHeight;
                }
                else if (iframeContent.Document && iframeContent.Document.body.scrollHeight) {
                    iframeContent.height = iframeContent.Document.body.scrollHeight;
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <div id="containerHeader">
                <div>
                    <a href="Index.aspx"><img src="Images/logo.png" height="60px" /></a>
                </div>
                <div id="divLogin">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLoginClick" Text="<%$ Resources:Login %>" CssClass="btn btn-success" />
                </div>
            </div>
            <div id="containerMenu">
                <ul class="nav nav-tabs nav-justified">
                    <li><a href="#" onclick="linkMenuClick('News')"><img src="Images/news.png" /><%=GetResStr("News")%></a></li>
                    <li><a href="#" onclick="linkMenuClick('ExploreGame')"><img src="Images/explore.png" /><%=GetResStr("ExploreGame")%></a></li>
                    <li><a href="#" onclick="linkMenuClick('Price')"><img src="Images/price.png" /><%=GetResStr("Price")%></a></li>
                    <li><a href="#" onclick="linkMenuClick('Rent')"><img src="Images/rent.png" /><%=GetResStr("Rent")%></a></li>
                    <li><a href="#" onclick="linkMenuClick('QA')"><img src="Images/qa.png" /><%=GetResStr("QA")%></a></li>
                </ul>
            </div>
            <div id="containerContent">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                        <li data-target="#myCarousel" data-slide-to="5"></li>
                        <li data-target="#myCarousel" data-slide-to="6"></li>
                        <li data-target="#myCarousel" data-slide-to="7"></li>
                        <li data-target="#myCarousel" data-slide-to="8"></li>
                        <li data-target="#myCarousel" data-slide-to="9"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="Images/office.png" alt="Office 21" />
                        </div>
                        <div class="item">
                            <img src="Images/aquarius.png" alt="水瓶座" />                            
                        </div>
                        <div class="item">
                            <img src="Images/avalon.png" alt="阿瓦隆" />                            
                        </div>
                        <div class="item">
                            <img src="Images/blockers.png" alt="Blockers" />                            
                        </div>
                        <div class="item">
                            <img src="Images/inception.png" alt="盜夢都市" />                            
                        </div>
                        <div class="item">
                            <img src="Images/business.png" alt="無良商人" />                            
                        </div>
                        <div class="item">
                            <img src="Images/camel.png" alt="駱駝大賽" />                            
                        </div>
                        <div class="item">
                            <img src="Images/gun.png" alt="明槍你錢" />                            
                        </div>
                        <div class="item">
                            <img src="Images/evolution.png" alt="演化論" />                            
                        </div>
                        <div class="item">
                            <img src="Images/king.png" alt="鬪三國" />                            
                        </div>
                    </div>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <iframe id="iframeContent" width="100%" height="100%" frameborder="0" scrolling="auto" style="display:none;" onload="setIframeHeight()"></iframe>
            </div>
            <div id="containerFooter"><%=GetResStr("Footer")%></div>
        </div>
    </form>
</body>
</html>
