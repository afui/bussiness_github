<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sqltest.aspx.cs" ValidateRequest="false" Inherits="sqltest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>宁波合益网络sql语句生成器</title>
    <link href="/hyhtml/images/Hycss.css" rel="stylesheet">
    <link href="/hyhtml/images/mainWin.css" rel="stylesheet">
    <script src="hyhtml/js/ZeroClipboard.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="left" class="style_8"></td>
            </tr>
            <tr>
                <td align="center" class="style_8">
                    <b>
                        <span id="lbltablename">sql语句生成器</span></b>
                </td>
            </tr>
        </table>
        <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td></td>
            </tr>
        </table>
        <table id="tb_main" class="tb1-main" align="center" cellspacing="1" cellpadding="0" border="0" style="width: 95%;">
            <tr>
                <td class="Tdcellleft" align="center" style="height: 30px; width: 15%;">数据库</td>
                <td class="Tdcellright" align="left" colspan="3" style="height: 30px; width: 35%;">
                    <asp:DropDownList ID="ddl_database" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_database_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="Tdcellleft" align="center" style="height: 30px; width: 15%;">表单名</td>
                <td class="Tdcellright" align="left" colspan="3" style="height: 30px; width: 35%;">
                    <asp:DropDownList ID="ddl_tableid" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="Tdcellright">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="20%" height="5" align="center" class="Tdcellright">&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="35%" height="30" align="center" class="Tdcellright">&nbsp;
                            </td>
                            <td id="td_return" align="center" class="Tdcellright">
                                <asp:Button ID="btn_insert" runat="server" CssClass="btn71" Text="  Insert" OnClick="btn_insert_Click" Style="height: 21px" />
                            </td>

                            <td id="td_submit" align="center" class="Tdcellright">
                                <asp:Button ID="btn_sqlparam" CssClass="btn71" runat="server" Text="  sqlparam" OnClick="btn_sqlparam_Click" />
                            </td>
                            <td id="td1" align="center" class="Tdcellright">
                                <script type="text/javascript">
                                    function copy_code(copyText) {
                                        if (window.clipboardData) {
                                            window.clipboardData.setData("Text", copyText)
                                        }
                                        else {
                                            var flashcopier = 'flashcopier';
                                            if (!document.getElementById(flashcopier)) {
                                                var divholder = document.createElement('div');
                                                divholder.id = flashcopier;
                                                document.body.appendChild(divholder);
                                            }
                                            document.getElementById(flashcopier).innerHTML = '';
                                            var divinfo = '<embed src="_clipboard.swf" FlashVars="clipboard=' + encodeURIComponent(copyText) + '" width="0" height="0" type="application/x-shockwave-flash"></embed>';
                                            document.getElementById(flashcopier).innerHTML = divinfo;
                                        }
                                        alert('复制成功！');
                                    }
                                </script>
                                <input id="Button4" type="button" class="btn7" value="复制" onclick="copy_code(document.getElementById('lb_showsql').innerText)" />
                            </td>
                            <td id="td_continue" align="center" class="Tdcellright">
                                <asp:Button ID="btn_update" CssClass="btn71" runat="server" Text="  update" OnClick="btn_update_Click" />
                            </td>
                            <td id="td2" align="center" class="Tdcellright">
                                <asp:Button ID="btn_fy" CssClass="btn71" runat="server" Text="  分页" OnClick="btn_fy_Click" />
                            </td>
                            <td id="td4" align="center" class="Tdcellright">
                                <asp:Button ID="btn_class" CssClass="btn71" runat="server" Text="  生成类属性" OnClick="btn_class_Click" />
                            </td>
                            <td id="td5" align="center" class="Tdcellright">
                                <asp:Button ID="btn_voluation" CssClass="btn71" runat="server" Text="  生成赋值语句" OnClick="btn_voluation_Click" />
                            </td>
                            <td id="td6" align="center" class="Tdcellright">
                                <asp:Button ID="btn_select" CssClass="btn71" runat="server" Text="  select" OnClick="btn_select_Click" />
                            </td>
                            <td id="td3" align="center" class="Tdcellright" runat="server" visible="false">
                                <asp:Button ID="btn_speed" CssClass="btn71" runat="server" Text="  sql执行速度" OnClick="btn_speed_Click" />
                            </td>
                            <td id="td7" align="center" class="Tdcellright">
                                <asp:Button ID="btn_update2" CssClass="btn71" runat="server" Text="  update2" OnClick="btn_update2_Click" />
                            </td>
                            <td id="td8" align="center" class="Tdcellright">
                                <asp:Button ID="btn_insert2" CssClass="btn71" runat="server" Text="  insert2" OnClick="btn_insert2_Click" />
                            </td>
                            <td id="td9" align="center" class="Tdcellright">
                                <asp:Button ID="btn_cler" CssClass="btn71" runat="server" Text="  重置" OnClick="btn_cler_Click"  />
                            </td>
                                <td id="td10" align="center" class="Tdcellright">
                                <asp:Button ID="btn_getClass" CssClass="btn71" runat="server" Text="  生成类" OnClick="btn_getClass_Click"  />
                            </td>
                            <td width="35%" height="30" align="center" class="Tdcellright">&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="Tdcellleft" align="center" style="height: 40px; width: 15%;">过滤字段</td>
                <td class="Tdcellright" align="left" colspan="3" style="height: 40px; width: 35%;">
                    <textarea style="width: 95%; height: 40px" runat="server" id="txt_sql"></textarea>
                    <br />
                    如果是要在sql中过滤掉某些不需要的字段，则只需要将字段名放入输入框中以#分割 比如：</br>
                    hy_bt#hy_clrylist#hy_curclrid#hy_curclrname#hy_curtacheid#hy_curtachename#hy_cyrylist#hy_flowid#hy_ifconfirm#hy_iftx#hy_motherid#hy_readdatelist#hy_readuserlist
                </td>
            </tr>
            <tr>
                <td class="Tdcellleft" align="center" style="height: 40px; width: 15%;">where字段</td>
                <td class="Tdcellright" align="left" colspan="3" style="height: 40px; width: 35%;">
                    <textarea style="width: 95%; height: 40px" runat="server" id="txt_where"></textarea>
                    <br />
                    如果是要在sql中添加where字段，则只需要将字段名放入输入框中以#分割 比如：docid#hy_bt
                </td>
            </tr>
            <tr>
                <td class="Tdcellleft" align="center" style="height: 40px; width: 15%;">新的连接串</td>
                <td class="Tdcellright" align="left" colspan="3" style="height: 40px; width: 35%;">
                    <input runat="server" style="width: 90%" id="txt_con" value="" />&nbsp;&nbsp;<asp:Button ID="btn_con" runat="server" CssClass="btn7" Text="确定" OnClick="btn_con_Click" />
                </td>
            </tr>
            <tr>
                <td class="Tdcellleft" align="center" colspan="4" style="height: 30px; width: 15%;">sql语句</td>
            </tr>
            <tr>
                <td class="Tdcellright" align="left" colspan="4" style="height: 30px; width: 15%;">
                    <asp:Label ID="lb_showsql" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
