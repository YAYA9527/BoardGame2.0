<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="ExploreGame_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="../CSS/bootstrap.min.css" />
    <link rel="stylesheet" href="../CSS/style.css" />
    <script src="../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
        function cbSelectAllChanged() {
            debugger
            var isSelect = $("#cbSelectAll").prop("checked");
        }

        function btnSearchClick() {
            var SelectedTypeItemPKArray = new Array();
            $.each($("#divType input[type='checkbox']:checked"), function (index, item) {
                SelectedTypeItemPKArray.push(item.value);
            });
            if (SelectedTypeItemPKArray.length == 0) {
                window.document.getElementById('<%=hfSelectedTypePKs.ClientID%>').value = "";
            }
            else {
                window.document.getElementById('<%=hfSelectedTypePKs.ClientID%>').value = SelectedTypeItemPKArray.join(',');
            }
        }
    </script>
    <style>
        /*取代Bootstrap的CSS，同分但內部>外部*/
        .checkbox-inline + .checkbox-inline, .radio-inline + .radio-inline {
            margin-left: 0px;
        }

        #imgManage {
            width: 40px;
            height: 40px;
            cursor: pointer;
        }

        .table > tbody > tr > td {
            vertical-align: middle;
        }

        .dropdown .dropdown-menu > li > a:hover,
        .dropdown-menu > li > a:focus {
            background-image: none;
            background-color: #FDD6DD;
        }

        .linkBtn, .linkBtn:hover {
            color: white;
            text-decoration: none;
        }

        .tdLinkBtn:hover {
            background-color: purple;
        }

        #divLastPage, #divNextPage, #divAllPage {
            display:inline-block;
        }

        #divLastPage:hover, #divNextPage:hover{
            background-color: purple;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset class="fieldset-style">
            <legend class="legend-style"><%=GetResStr("ExploreGame")%></legend>
            <div class="row row-offset">
                <div class="col-xs-offset-2 col-sm-offset-2">
                    <asp:Button ID="btnAddGame" runat="server" OnClick="btnAddGameClick" Text="<%$ Resources:AddGame %>" CssClass="btn btn-success" />
                    <asp:Button ID="btnExportExcel" runat="server" OnClick="btnExportExcelClick" Text="<%$ Resources:ExportExcel %>" CssClass="btn btn-success" />
                    <asp:Button ID="btnSearch" runat="server" OnClientClick="btnSearchClick()" OnClick="btnSearchClick" Text="<%$ Resources:Search %>" CssClass="btn btn-success" />
                </div>
            </div>
            <div class="row row-offset">
                <label for="txtKeyWord" class="col-xs-3 col-sm-3 label-text-right">
                    <%=GetResStr("KeyWord")%>：           
                </label>
                <div class="col-xs-6 col-sm-6">
                    <input type="text" class="form-control" id="txtKeyWord" runat="server" placeholder="請輸入桌遊名稱..." />
                </div>
            </div>
            <div class="row row-offset">
                <label for="ddlPlayer" class="col-xs-3 col-sm-3 label-text-right">
                    <%=GetResStr("GamePlayer")%>：
                </label>
                <div class="col-xs-6 col-sm-6">
                    <asp:DropDownList ID="ddlPlayer" runat="server" CssClass="form-control">
                        <asp:ListItem Text="" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player1 %>" Value="1"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player2 %>" Value="2"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player3 %>" Value="3"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player4 %>" Value="4"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player5 %>" Value="5"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player6 %>" Value="6"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player7 %>" Value="7"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player8 %>" Value="8"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player9 %>" Value="9"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Player10 %>" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row row-offset">
                <label for="rdoTime" class="col-xs-3 col-sm-3 label-text-right">
                    <%=GetResStr("GameTime")%>：               
                </label>
                <div class="col-xs-6 col-sm-6">
                    <label class="radio-inline">
                        <input type="radio" name="rdoTime" runat="server" value="0" checked><%=GetResStr("Any")%>
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="rdoTime" runat="server" value="1"><%=GetResStr("Short")%>
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="rdoTime" runat="server" value="2"><%=GetResStr("Middle")%>
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="rdoTime" runat="server" value="3"><%=GetResStr("LittleLong")%>
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="rdoTime" runat="server" value="4"><%=GetResStr("Long")%>
                    </label>
                </div>
            </div>
            <div class="row row-offset">
                <label for="cblType" class="col-xs-3 col-sm-3 label-text-right">
                    <%=GetResStr("Type")%>：            
                </label>
                <div id="divType" runat="server" class="col-xs-6 col-sm-6"></div>
            </div>
            <div class="row row-offset">
                <label for="iptRentalDate" class="col-xs-3 col-sm-3 label-text-right">
                    <%=GetResStr("RentalDate")%>：             
                </label>
                <div class="col-xs-6 col-sm-6">
                    <input id="iptRentalDate" runat="server" type="date" />&nbsp;&nbsp;<%=GetResStr("Before")%>
                </div>
            </div>
        </fieldset>
        <div class="table-responsive">
            <asp:Repeater ID="rptBoardGame" runat="server" OnItemDataBound="rptBoardGame_ItemDataBound">
                <HeaderTemplate>
                    <table style="text-align: center;" class="table">
                        <tr style="background-color: #449d44; color: white;">
                            <td id="HeaderTdSelectAll" runat="server">
                                <input type="checkbox" id="cbSelectAll" onchange="cbSelectAllChanged()" />
                                <asp:Literal ID="ltlSelectAllOrNot" runat="server" Text="V / X"></asp:Literal>
                            </td>
                            <td>
                                <asp:Literal ID="ltlNo" runat="server" Text="<%$ Resources:No %>"></asp:Literal>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGameName" runat="server" Text="<%$ Resources:GameName %>" CommandName="Sort"
                                    CommandArgument="GBI.GameName" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGamePlayer" runat="server" Text="<%$ Resources:GamePlayer %>" CommandName="Sort"
                                    CommandArgument="GBI.MaxPlayer" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGameTime" runat="server" Text="<%$ Resources:GameTime %>" CommandName="Sort"
                                    CommandArgument="GBI.Time" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGameDifficulty" runat="server" Text="<%$ Resources:Difficulty %>" CommandName="Sort"
                                    CommandArgument="GBI.Difficulty" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGameLuck" runat="server" Text="<%$ Resources:Luck %>" CommandName="Sort"
                                    CommandArgument="GBI.Luck" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGameStrategy" runat="server" Text="<%$ Resources:Strategy %>" CommandName="Sort"
                                    CommandArgument="GBI.Strategy" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td class="tdLinkBtn">
                                <asp:LinkButton ID="lbGameInteraction" runat="server" Text="<%$ Resources:Interaction %>" CommandName="Sort"
                                    CommandArgument="GBI.Interaction" OnClick="lbClick" OnClientClick="btnSearchClick()" CssClass="linkBtn">
                                </asp:LinkButton>
                            </td>
                            <td>
                                <asp:Literal ID="ltlFunction" runat="server" Text="<%$ Resources:Function %>"></asp:Literal>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:CheckBox runat="server" ID="cbSelect" />
                        </td>
                        <td>
                            <%# Container.ItemIndex+1 %>
                        </td>
                        <td>
                            <%# Eval("GameName") %>
                        </td>
                        <td>
                            <asp:Literal ID="ltlGamePlayerValue" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <%# Eval("Time") %>
                        </td>
                        <td>
                            <%# Eval("Difficulty") %>
                        </td>
                        <td>
                            <%# Eval("Luck") %>
                        </td>
                        <td>
                            <%# Eval("Strategy") %>
                        </td>
                        <td>
                            <%# Eval("Interaction") %>
                        </td>
                        <td>
                            <div class="dropdown">
                                <div class="dropdown-toggle" data-toggle="dropdown">
                                    <image src="../Images/Manage.png" id="imgManage" title="<%=GetResStr("Manage")%>"></image>
                                </div>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="0"><%=GetResStr("Score")%></a>
                                    </li>
                                    <li role="presentation" class="divider"></li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="1"><%=GetResStr("EditGame")%></a>
                                    </li>
                                    <li role="presentation" class="divider"></li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="2"><%=GetResStr("ManageExtension")%></a>
                                    </li>
                                    <li role="presentation" class="divider"></li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="3"><%=GetResStr("RentalNum")%></a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
                <%--<SeparatorTemplate>
                    <tr>
                        <td colspan="5">
                            <hr />
                        </td>
                    </tr>
                </SeparatorTemplate>--%>
                <%--<AlternatingItemTemplate>
                    <tr style="background-color: #e8e8e8;">
                        <td>
                            <asp:CheckBox runat="server" ID="cbSelect" />
                        </td>
                        <td>
                            <%# Container.ItemIndex+1 %>
                        </td>
                        <td>
                            <%# Eval("Name") %>
                        </td>
                        <td>
                            <%# Eval("Price") %>
                        </td>
                        <td>
                            <asp:Literal ID="ltlPlayerValue" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:Literal ID="ltlRentalDateValue" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </AlternatingItemTemplate>--%>
                <FooterTemplate>
                        <tr style="background-color: #449d44;">
                            <td colspan="10">
                                <div id="divLastPage">
                                    <asp:LinkButton ID="lbLastPage" runat="server" Text="<%$ Resources:LastPage %>" CommandName="Page"
                                        OnClick="lbClick" CssClass="linkBtn">
                                    </asp:LinkButton>
                                </div>
                                <div id="divAllPage">

                                </div>
                                <div id="divNextPage">
                                    <asp:LinkButton ID="lbNextPage" runat="server" Text="<%$ Resources:NextPage %>" CommandName="Page"
                                        OnClick="lbClick" CssClass="linkBtn">
                                    </asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </table>    
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <asp:HiddenField ID="hfSelectedTypePKs" runat="server" />
        <asp:HiddenField ID="hfSortValue" runat="server" />
        <asp:HiddenField ID="hfSortColumn" runat="server" />
        <asp:HiddenField ID="hfTotalDataCount" runat="server" />
        <asp:HiddenField ID="hfPerPageDataCount" runat="server" />
        <asp:HiddenField ID="hfCurPage" runat="server" />
    </form>
</body>
</html>
