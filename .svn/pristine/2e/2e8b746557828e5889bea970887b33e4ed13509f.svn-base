<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_xgmm.aspx.cs" Inherits="SysManage_main_xgmm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>修改密码</title>
    <link href="../css/css-cn.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script type="text/javascript">
        function submitform() {
            var ls_OldPass = document.forms[0].txtoldpwd.value;
            var ls_NewPass = document.forms[0].txtnewpwd.value;
            var ls_NewPassAgain = document.forms[0].txtcomfig.value;
            if (ls_OldPass == "") {
                alert("请输入旧密码！");
                document.forms[0].txtoldpwd.focus();
                return false;
            }
            if (ls_NewPass == "") {
                alert("请输入新密码！");
                document.forms[0].txtnewpwd.focus();
                return false;
            }
            if (ls_NewPassAgain == "") {
                alert("请输入重复新密码！");
                document.forms[0].txtcomfig.focus();
                return false;
            }
            if (ls_NewPass != ls_NewPassAgain) {
                alert("重复新密码输入有误！");
                return false;
            }
            document.forms[0].btnSubmit.click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            &nbsp;首页 &gt; 系统管理 &gt; 用户管理 &gt; 修改密码
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="1000">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">权限信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <dl>
                            <dt>用户ID：</dt>
                            <dd>
                                <asp:TextBox ID="txtUid" runat="server" ReadOnly="True" CssClass="txtInput normal required"></asp:TextBox>
                            </dd>
                        </dl>
                        <dl>
                            <dt>用户名：</dt>
                            <dd>
                                <asp:TextBox ID="txtUname" runat="server" CssClass="txtInput normal required"></asp:TextBox>
                            </dd>
                        </dl>
                        <dl>
                            <dt>旧密码：</dt>
                            <dd>
                                <asp:TextBox ID="txtoldpwd" runat="server" CssClass="txtInput normal required" TextMode="Password"></asp:TextBox><label>*</label>
                            </dd>
                        </dl>
                        <dl>
                            <dt>新密码：</dt>
                            <dd>
                                <asp:TextBox ID="txtnewpwd" runat="server" CssClass="txtInput normal required" TextMode="Password"></asp:TextBox><label>*</label>
                            </dd>
                        </dl>
                        <dl>
                            <dt>密码确认：</dt>
                            <dd>
                                <asp:TextBox ID="txtcomfig" runat="server" CssClass="txtInput normal required" TextMode="Password"></asp:TextBox><label>*</label>
                            </dd>
                        </dl>
                    </div>
                    <!--/内容-->
                    <!--工具栏-->
                    <div class="page-footer">
                        <div class="btn-list">
                            <input id="btn_submit" type="button" name="btn_submit" value="提交保存" onclick="return submitform();" class="btn" runat="server" />
                            <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript: history.back(-1);" />
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <!--/工具栏-->
                </td>
            </tr>
        </table>
        <!-- 大表格，结束 -->
        <div style="display: none;">
            修改保存：<asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="修改保存" /><br />
        </div>
    </form>
</body>
</html>
