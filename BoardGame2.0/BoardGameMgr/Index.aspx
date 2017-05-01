<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="testaspnetwebform.BoardGameMgr.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="../CSS/bootstrap.min.css" />
    <link rel="stylesheet" href="../CSS/style.css" />
    <script src="../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
        function cbSelectAllChanged() {
            var isSelect = $("#cbSelectAll").prop("checked");
            debugger
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset class="fieldset-style">
            <legend class="legend-style"><%=GetResStr("ExploreGame")%></legend>
            <div class="row row-offset">
                <div class="col-xs-offset-2 col-sm-offset-2">
                    <asp:Button ID="btnAddGame" runat="server" OnClick="btnAddGameClick" Text="<%$ Resources:AddGame %>" CssClass="btn btn-success" />
                    <asp:Button ID="btnExportExcel" runat="server" OnClick="btnExportExcelClick" Text="<%$ Resources:ExportExcel %>" CssClass="btn btn-success" />
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearchClick" Text="<%$ Resources:Search %>" CssClass="btn btn-success" />
                </div>
            </div>
            <div class="row row-offset">
                <label for="txtKeyWord" class="col-xs-3 col-sm-3 lbl-text-position">
                    <%=GetResStr("KeyWord")%>：
                </label>
                <div class="col-xs-6 col-sm-6">
                    <input type="text" class="form-control" id="txtKeyWord" placeholder="請輸入桌遊名稱...">
                </div>
            </div>
            <div class="row row-offset">
                <label for="rblTime" class="col-xs-3 col-sm-3 lbl-text-position">
                    <%=GetResStr("Time")%>：
                </label>
                <div class="col-xs-6 col-sm-6">
                    <asp:RadioButtonList ID="rblTime" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Text="<%$ Resources:Short %>" Selected="True" />
                        <asp:ListItem Value="2" Text="<%$ Resources:Middle %>" />
                        <asp:ListItem Value="3" Text="<%$ Resources:Long %>" />
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row row-offset">
                <label for="cblType" class="col-xs-3 col-sm-3 lbl-text-position">
                    <%=GetResStr("Type")%>：
                </label>
                <div class="col-xs-6 col-sm-6">
                    <asp:CheckBoxList ID="cblType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Text="<%$ Resources:Type1 %>" />
                        <asp:ListItem Value="2" Text="<%$ Resources:Type2 %>" />
                        <asp:ListItem Value="3" Text="<%$ Resources:Type3 %>" />
                        <asp:ListItem Value="4" Text="<%$ Resources:Type4 %>" />
                        <asp:ListItem Value="5" Text="<%$ Resources:Type5 %>" />
                    </asp:CheckBoxList>
                </div>
            </div>
            <div class="row row-offset">
                <label for="iptRentalDate" class="col-xs-3 col-sm-3 lbl-text-position">
                    <%=GetResStr("RentalDate")%>：
                </label>
                <div class="col-xs-6 col-sm-6">
                    <input id="iptRentalDate" runat="server" type="date" />
                </div>
            </div>
            <div class="row row-offset">
                <label for="ddlPlayer" class="col-xs-3 col-sm-3 lbl-text-position">
                    <%=GetResStr("GamePlayer")%>：
                </label>
                <div class="col-xs-6 col-sm-6">
                    <asp:DropDownList ID="ddlPlayer" runat="server">
                        <asp:ListItem Text="" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </fieldset>
        <div class="table-responsive">
            <asp:Repeater ID="rptBoardGame" runat="server" OnItemDataBound="rptBoardGame_ItemDataBound">
                <HeaderTemplate>
                    <table style="text-align: center;" class="table">
                        <tr style="background-color: #449d44; color: white;">
                            <td width="5%" id="HeaderTdSelectAll" runat="server">
                                <input type="checkbox" id="cbSelectAll" onchange="cbSelectAllChanged()" />
                                <asp:Literal ID="ltlSelectAllOrNot" runat="server" Text="<%$ Resources:SelectAllOrNot %>"></asp:Literal>
                            </td>
                            <td width="5%">
                                <asp:Literal ID="ltlNo" runat="server" Text="<%$ Resources:No %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGameName" runat="server" Text="<%$ Resources:GameName %>"></asp:Literal>
                            </td>                            
                            <td width="10%">
                                <asp:Literal ID="ltlGamePlayer" runat="server" Text="<%$ Resources:GamePlayer %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGameTime" runat="server" Text="<%$ Resources:GameTime %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGameDifficulty" runat="server" Text="<%$ Resources:Difficulty %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGameLuck" runat="server" Text="<%$ Resources:Luck %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGameStrategy" runat="server" Text="<%$ Resources:Strategy %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGameInteraction" runat="server" Text="<%$ Resources:Interaction %>"></asp:Literal>
                            </td>
                            <td width="10%">
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
                </ItemTemplate>
                <%--<SeparatorTemplate>
                    <tr>
                        <td colspan="5">
                            <hr />
                        </td>
                    </tr>
                </SeparatorTemplate>--%>
                <AlternatingItemTemplate>
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
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
