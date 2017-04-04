<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="testaspnetwebform.BoardGameMgr.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
    <script src="../Scripts/jquery-3.2.0.min.js"></script>
    <script>
        function cbSelectAllChanged() {
            var isSelect = $("#cbSelectAll").prop("checked");
            debugger
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnAddGame" runat="server" OnClick="btnAddGameClick" Text="<%$ Resources:AddGame %>" />
        </div>
        <div>
            <table width="40%" border="0">
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:KeyWord %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:TextBox ID="tbKeyWord" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:GamePlayer %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPlayer" runat="server">
                            <asp:ListItem Text="" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:GamePrice %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblPrice" runat="server">
                            <asp:ListItem Value="0" Text="<%$ Resources:Price0 %>" Selected="True" />
                            <asp:ListItem Value="500" Text="<%$ Resources:Price500 %>" />
                            <asp:ListItem Value="1000" Text="<%$ Resources:Price1000 %>" />
                            <asp:ListItem Value="1500" Text="<%$ Resources:Price1500 %>" />
                            <asp:ListItem Value="2000" Text="<%$ Resources:Price2000 %>" />
                            <asp:ListItem Value="2001" Text="<%$ Resources:PriceOther %>" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:TimeType %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblTimeType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" Text="<%$ Resources:Type1 %>" />
                            <asp:ListItem Value="2" Text="<%$ Resources:Type2 %>" />
                            <asp:ListItem Value="3" Text="<%$ Resources:Type3 %>" />
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <div style="font-size: 12px; color: #FF0000">
                            <asp:Literal runat="server" Text="<%$ Resources:KeyWordTip %>" />
                        </div>
                    </td>
                    <td align="right" valign="bottom">
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearchClick" Text="<%$ Resources:Search %>" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Repeater ID="rptBoardGame" runat="server" OnItemDataBound="rptBoardGame_ItemDataBound">
                <HeaderTemplate>
                    <table width="50%" style="text-align:center;">
                        <tr style="background-color: blue; color: white;">
                            <td width="15%">
<%--                                <asp:CheckBox runat="server" ID="cbSelectAll" Text="<%$ Resources:SelectAllOrNot %>" />--%>
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
                                <asp:Literal ID="ltlGamePrice" runat="server" Text="<%$ Resources:GamePrice %>"></asp:Literal>
                            </td>
                            <td width="10%">
                                <asp:Literal ID="ltlGamePlayer" runat="server" Text="<%$ Resources:GamePlayer %>"></asp:Literal>
                            </td>
                            <td width="15%">
                                <asp:Literal ID="ltlRentalDate" runat="server" Text="<%$ Resources:RentalDate %>"></asp:Literal>
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
