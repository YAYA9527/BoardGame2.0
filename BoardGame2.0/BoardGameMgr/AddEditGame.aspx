<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEditGame.aspx.cs" Inherits="testaspnetwebform.BoardGameMgr.AddEditGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divAdd" runat="server" visible="false">
            <table width="30%" border="0">
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:GameName %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:TextBox ID="tbGameName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:GamePrice %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:TextBox ID="tbGamePrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:PlayerMin %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPlayerMin" runat="server">
                            <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
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
                        <asp:Literal runat="server" Text="<%$ Resources:PlayerMax %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPlayerMax" runat="server">
                            <asp:ListItem Text="1" Value="1" Selected="True"></asp:ListItem>
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
                        <asp:Literal runat="server" Text="<%$ Resources:RentalDate %>"></asp:Literal>：
                    </td>
                    <td>
                        <input id="iptRentalDate" runat="server" type="date" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align:right;">
                        <asp:Literal runat="server" Text="<%$ Resources:TimeType %>"></asp:Literal>：
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblTimeType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" Text="<%$ Resources:Type1 %>" />
                            <asp:ListItem Value="2" Text="<%$ Resources:Type2 %>" />
                            <asp:ListItem Value="3" Text="<%$ Resources:Type3 %>" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>                    
                    <td colspan="2" align="right" valign="bottom">
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmitClick" Text="<%$ Resources:Submit %>" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancelClick" Text="<%$ Resources:Cancel %>" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
