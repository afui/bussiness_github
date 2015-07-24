<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="questiontMain.aspx.cs" Inherits="questiontMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../js/My97DatePicker/WdatePicker.js"></script>
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link href="../css/css-cn.css" rel="stylesheet" type="text/css" />
    <%--弹窗--%>
    <script src="../artDialog/jquery-1.10.2.js"></script>
    <script src="../artDialog/dialog-min.js"></script>
    <link href="../artDialog/ui-dialog.css" rel="stylesheet" />
    <%--编辑器start--%>
    <link rel="stylesheet" href="/editor/themes/default/default.css" />
    <link rel="stylesheet" href="/editor/plugins/code/prettify.css" />
    <script type="text/javascript" charset="utf-8" src="/editor/kindeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="/editor/plugins/code/prettify.js"></script>
    <style>
        .txext3 {
            width: 700px;
            height: 135px;
            border: 1px solid #CDCDCD;
            line-height: 30px;
            border-radius: 3px;
        }
    </style>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtdt_summary', {
                cssPath: '/editor/plugins/code/prettify.css',
                uploadJson: '/editor/upload_json.ashx',
                fileManagerJson: '/editor/file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
    <%--编辑器end--%>
    <title></title>
    <script type="text/javascript">

        //保存
        function submitform() {
            var fm = document.forms[0];
            fm.btn_save.click();
        }
        function success() {
            var d = dialog({
                title: '提示',
                content: '回复成功！',
                okValue: '返回列表页面',
                ok: function () {
                    window.location = "questionList.aspx?rend=" + Math.random();
                },
                cancelValue: '留在当前页面',
                cancel: function () { }
            });
            d.show();
        }
        function fail(prompt) {
            var d = dialog({ content: prompt });
            d.show();
            setTimeout(function () { d.close().remove(); }, 3000);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            首页 &gt; 内容管理 &gt; 提问信息
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">提问信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <table width="95%" border="0" cellpadding="0" cellspacing="1" class="tb1-main">
                            <tr height="40px">
                                <td align="center" class="Tdcellleft">姓名
                                </td>
                                <td align="left" class="Tdcellright">
                                    <input type="text" runat="server" id="txtName" class="txext2" />
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">邮箱
                                </td>
                                <td align="left">
                                    <input type="text" runat="server" id="txtEmail" class="txext2" />
                                </td>
                            </tr>
                            <tr height="40px">

                                <td align="center">问题描述
                                </td>
                                <td height="40" colspan="2">
                                    <textarea class="txext3" runat="server" id="txtDetail"></textarea>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">回复
                                </td>
                                <td align="left">
                                    <textarea id="txtdt_summary" cols="100" rows="8" style="width: 700px; height: 280px; visibility: hidden;"
                                        runat="server"></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--/内容-->
                    <!--工具栏-->
                    <div class="page-footer">
                        <div class="btn-list">
                            <input id="btn_submit" type="button" name="btn_submit" value="提交保存" onclick="return submitform();"
                                class="btn" runat="server" />
                            <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript: history.back(-1);" />
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <!--/工具栏-->
                    <div style="display: none">
                        新增或修改：<input id="txtop" runat="server" /><br />
                        <asp:Button ID="btn_save" runat="server" Text="修改保存" OnClick="btn_save_Click" />
                        文档ID:<input id="txtDocid" value="" type="text" runat="server" />
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
