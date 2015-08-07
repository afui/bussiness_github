<%@ Page Language="C#"  validateRequest="false"  AutoEventWireup="true" CodeFile="exportMain.aspx.cs" Inherits="iportal_bussiness_exportMain" %>

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
        //自适应IFRAME高度
        function reinitIframe() {

            var iframe = document.getElementById("ifr_rentpic");

            try {

                var bHeight = iframe.contentWindow.document.body.scrollHeight;

                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;

                var height = Math.max(bHeight, dHeight);

                iframe.height = height;

            } catch (ex) { }

        }
        window.setInterval("reinitIframe()", 200);
        function checkInput() {
            if (document.getElementById("txtdt_name").value == "") {
                fail("对不起，请填写姓名！");
                document.getElementById("txtdt_name").focus();
                return false;
            }
            if (document.getElementById("txtdt_type").value == "") {
                fail("对不起，请选择专家类型！");
                document.getElementById("txtdt_type").focus();
                return false;
            }
            if (document.getElementById("txtdt_email").value != "") {
                var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
                if (!pattern.test(document.getElementById("txtdt_email").value)) {
                    fail("对不起，请填写正确的邮箱地址！");
                    document.getElementById("txtdt_email").focus();
                    return false;
                }
            }
        }
        //保存
        function submitform() {
            if (checkInput() != false) {
                var fm = document.forms[0];
                fm.btn_save.click();
            }
        }
        function success() {
            var d = dialog({
                title: '提示',
                content: '数据保存成功！',
                okValue: '返回列表页面',
                ok: function () {
                    window.location = "exportList.aspx?rend=" + Math.random();
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
            首页 &gt; 内容管理 &gt; 专家信息
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">专家信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <table width="95%" border="0" cellpadding="0" cellspacing="1" class="tb1-main">
                            <tr height="40px">
                                <td align="center" class="Tdcellleft">专家姓名
                                </td>
                                <td align="left" class="Tdcellright">
                                    <asp:TextBox CssClass="txtInput" ID="txtdt_name" runat="server" Width="45%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">专家图片</td>
                                <td align="left">
                                    <iframe frameborder="0" id="ifr_rentpic" name="ifr_rentpic" width="600" src="/include/ifr_rentpic.aspx?docid=<%=this.txtDocid.Value %>&uid=<%=uid %>&rnd=<%=System.Guid.NewGuid().ToString() %>"></iframe>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td width="13%" align="center" class="Tdcellleft">专家类型
                                </td>
                                <td align="left" class="Tdcellright">
                                    <select cssclass="txtInput" id="txtdt_type" runat="server" width="45%">
                                        <option value="">--请选择--</option>
                                        <option value="品牌建设">品牌建设</option>
                                        <option value="营销策划">营销策划</option>
                                        <option value="工业设计">工业设计</option>
                                        <option value="法律咨询">法律咨询</option>
                                        <option value="知识产权">知识产权</option>
                                        <option value="生产管理">生产管理</option>
                                        <option value="原材料">原材料</option>
                                    </select>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">邮箱
                                </td>
                                <td align="left">
                                    <asp:TextBox CssClass="txtInput" ID="txtdt_email" runat="server" Width="45%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr height="40px">

                                <td align="center">联系电话
                                </td>
                                <td align="left">
                                    <asp:TextBox CssClass="txtInput" ID="txtdt_phone" runat="server" Width="45%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center" class="Tdcellleft">联系地址
                                </td>
                                <td align="left" class="Tdcellright">
                                    <asp:TextBox CssClass="txtInput" ID="txtdt_address" runat="server" Width="45%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">专家简介
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
