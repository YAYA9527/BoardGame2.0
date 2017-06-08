<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEditGame.aspx.cs" Inherits="testaspnetwebform.BoardGameMgr.AddEditGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="../CSS/bootstrap.min.css" />
    <link rel="stylesheet" href="../CSS/style.css" />
    <script src="../Scripts/jquery-3.2.0.min.js"></script>
    <script src="../Scripts/jquery-blockUI.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>        
        function btnSelectPhotoClick() {
            window.document.getElementById('<%=GamePhotoFile.ClientID%>').click();
        }

        function PhotoFileChanged() {
            window.document.getElementById('<%=lblPhotoName.ClientID%>').innerText = window.document.getElementById('<%=GamePhotoFile.ClientID%>').files[0].name;
        }

        function btnDelTypeClientClick() {
            var DelItemPKArray = new Array();
            $.each($("input[type='checkbox']:checked"), function (index, item) {
                DelItemPKArray.push(item.value);
            });
            window.document.getElementById('<%=hfDelTypePKs.ClientID%>').value = DelItemPKArray.join(',');
        }
    </script>
    <style>
        /*取代Bootstrap的CSS，同分但內部>外部*/
        .checkbox-inline + .checkbox-inline, .radio-inline + .radio-inline {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divAdd" runat="server" visible="false">
            <fieldset class="fieldset-style">
                <legend class="legend-style"><%=GetResStr("AddGame")%></legend>
                <div class="row row-offset">
                    <label for="txtGameName" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("GameName")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <input type="text" class="form-control" id="txtGameName" runat="server">
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="ddlGameTime" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("GameTime")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <asp:DropDownList ID="ddlGameTime" runat="server" CssClass="form-control">
                            <asp:ListItem Text="<%$ Resources:Time1 %>" Value="15" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time2 %>" Value="30"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time3 %>" Value="45"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time4 %>" Value="60"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time5 %>" Value="75"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time6 %>" Value="90"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time7 %>" Value="105"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Time8 %>" Value="120"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="ddlMinPlayer" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("GameMinPlayer")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <asp:DropDownList ID="ddlMinPlayer" runat="server" CssClass="form-control">
                            <asp:ListItem Text="<%$ Resources:Player1 %>" Value="1" Selected="True"></asp:ListItem>
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
                    <label for="ddlMaxPlayer" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("GameMaxPlayer")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <asp:DropDownList ID="ddlMaxPlayer" runat="server" CssClass="form-control">
                            <asp:ListItem Text="<%$ Resources:Player1 %>" Value="1" Selected="True"></asp:ListItem>
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
                    <label for="txtType" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Type")%>：
                    </label>
                    <div class="col-xs-3 col-sm-3">
                        <input type="text" class="form-control" id="txtType" runat="server" placeholder="請輸入類型名稱...">
                    </div>
                    <div class="col-xs-3 col-sm-3">
                        <asp:Button ID="btnAddType" runat="server" OnClick="btnAddTypeClick" Text="<%$ Resources:AddType %>" CssClass="btn btn-success" />
                        <asp:Button ID="btnDelType" runat="server" OnClientClick="btnDelTypeClientClick()" OnClick="btnDelTypeClick" Text="<%$ Resources:DelType %>" CssClass="btn btn-success" />
                    </div>
                </div>
                <div class="row row-offset">
                    <label class="col-xs-3 col-sm-3"></label>
                    <div id="divType" runat="server" class="col-xs-6 col-sm-6"></div>
                </div>
                <div class="row row-offset">
                    <label for="iptRentalStartDate" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("RentalStartDate")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <input id="iptRentalStartDate" runat="server" type="date" />
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="rdoDifficulty" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Difficulty")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <label class="radio-inline">
                            <input id="Radio1" type="radio" name="rdoDifficulty" runat="server" value="1" checked>1
                        </label>
                        <label class="radio-inline">
                            <input id="Radio2" type="radio" name="rdoDifficulty" runat="server" value="2">2
                        </label>
                        <label class="radio-inline">
                            <input id="Radio3" type="radio" name="rdoDifficulty" runat="server" value="3">3
                        </label>
                        <label class="radio-inline">
                            <input id="Radio4" type="radio" name="rdoDifficulty" runat="server" value="4">4
                        </label>
                        <label class="radio-inline">
                            <input id="Radio5" type="radio" name="rdoDifficulty" runat="server" value="5">5
                        </label>
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="rdoLuck" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Luck")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <label class="radio-inline">
                            <input id="Radio6" type="radio" name="rdoLuck" runat="server" value="1" checked>1
                        </label>
                        <label class="radio-inline">
                            <input id="Radio7" type="radio" name="rdoLuck" runat="server" value="2">2
                        </label>
                        <label class="radio-inline">
                            <input id="Radio8" type="radio" name="rdoLuck" runat="server" value="3">3
                        </label>
                        <label class="radio-inline">
                            <input id="Radio9" type="radio" name="rdoLuck" runat="server" value="4">4
                        </label>
                        <label class="radio-inline">
                            <input id="Radio10" type="radio" name="rdoLuck" runat="server" value="5">5
                        </label>
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="rdoStrategy" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Strategy")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <label class="radio-inline">
                            <input id="Radio11" type="radio" name="rdoStrategy" runat="server" value="1" checked>1
                        </label>
                        <label class="radio-inline">
                            <input id="Radio12" type="radio" name="rdoStrategy" runat="server" value="2">2
                        </label>
                        <label class="radio-inline">
                            <input id="Radio13" type="radio" name="rdoStrategy" runat="server" value="3">3
                        </label>
                        <label class="radio-inline">
                            <input id="Radio14" type="radio" name="rdoStrategy" runat="server" value="4">4
                        </label>
                        <label class="radio-inline">
                            <input id="Radio15" type="radio" name="rdoStrategy" runat="server" value="5">5
                        </label>
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="rdoInteraction" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Interaction")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <label class="radio-inline">
                            <input id="Radio16" type="radio" name="rdoInteraction" runat="server" value="1" checked>1
                        </label>
                        <label class="radio-inline">
                            <input id="Radio17" type="radio" name="rdoInteraction" runat="server" value="2">2
                        </label>
                        <label class="radio-inline">
                            <input id="Radio18" type="radio" name="rdoInteraction" runat="server" value="3">3
                        </label>
                        <label class="radio-inline">
                            <input id="Radio19" type="radio" name="rdoInteraction" runat="server" value="4">4
                        </label>
                        <label class="radio-inline">
                            <input id="Radio20" type="radio" name="rdoInteraction" runat="server" value="5">5
                        </label>
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="txtRent" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Rent")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <input type="text" runat="server" class="form-control" id="txtRent">
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="txtDeposit" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Deposit")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <input type="text" runat="server" class="form-control" id="txtDeposit">
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="txtTeachingUrl" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("TeachingUrl")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <input type="text" runat="server" class="form-control" id="txtTeachingUrl">
                    </div>
                </div>
                <div class="row row-offset">
                    <label class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("GamePhoto")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <asp:FileUpload ID="GamePhotoFile" runat="server" AllowMultiple="false" style="display:none;" onchange="PhotoFileChanged()"></asp:FileUpload>
                        <asp:Button ID="btnSelectPhoto" runat="server" OnClientClick="btnSelectPhotoClick(); return false;" Text="<%$ Resources:SelectPhoto %>" CssClass="btn btn-success"></asp:Button>
                        <asp:Label ID="lblPhotoName" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row row-offset">
                    <label for="taDescription" class="col-xs-3 col-sm-3 label-text-right">
                        <%=GetResStr("Description")%>：
                    </label>
                    <div class="col-xs-6 col-sm-6">
                        <textarea id="taDescription" runat="server" class="form-control" rows="3"></textarea>
                    </div>
                </div>
            </fieldset>
            <div class="row row-offset">
                <div style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmitClick" Text="<%$ Resources:Submit %>" CssClass="btn btn-success" />
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancelClick" Text="<%$ Resources:Cancel %>" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hfDelTypePKs" runat="server" />
    </form>
</body>
</html>
