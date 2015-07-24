<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TourGuideEdit.aspx.cs" Inherits="TourGuideEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>社区智慧物业管理系统</title>
    <script src="../js/My97DatePicker/WdatePicker.js"></script>
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link href="../css/css-cn.css" rel="stylesheet" type="text/css" />
    <script src="../artDialog/jquery-1.10.2.js"></script>
    <script src="../artDialog/dialog-min.js"></script>
    <link href="../artDialog/ui-dialog.css" rel="stylesheet" />
    <script type="text/javascript">
        function checkInput() {
            if (document.getElementById("txtNmae").value == "") {
                fail("对不起，请填写姓名！");
                document.getElementById("txtNmae").focus();
                return false;
            }
            if (document.getElementById("txtCardid").value == "") {
                fail("对不起，请填写导游卡号！");
                document.getElementById("txtCardid").focus();
                return false;
            }
            if (document.getElementById("txtNumber").value == "") {
                fail("对不起，请填写导游证号！");
                document.getElementById("txtNumber").focus();
                return false;
            }
            if (document.getElementById("txtIdendity").value == "") {
                fail("对不起，请填写身份证件！");
                document.getElementById("txtIdendity").focus();
                return false;
            }
            if (document.getElementById("txtQualification").value == "") {
                fail("对不起，请填写资格证号！");
                document.getElementById("txtQualification").focus();
                return false;
            }
            if (document.getElementById("txtAnnual").value == "") {
                fail("对不起，请填写年审日期！");
                document.getElementById("txtAnnual").focus();
                return false;
            }
            if (document.getElementById("txtCardDate").value == "") {
                fail("对不起，请填写发卡日期！");
                document.getElementById("txtCardDate").focus();
                return false;
            }
            if (document.getElementById("txtScore").value == "") {
                fail("对不起，请填写分值！");
                document.getElementById("txtScore").focus();
                return false;
            }
            if (document.getElementById("txtPermit").value == "") {
                fail("对不起，请填写旅行社许可证号！");
                document.getElementById("txtPermit").focus();
                return false;
            }
            if (document.getElementById("txtSummary").value == "") {
                fail("对不起，请填写旅行社简称！");
                document.getElementById("txtSummary").focus();
                return false;
            }
            if (document.getElementById("txtBirthday").value == "") {
                fail("对不起，请填写出生日期！");
                document.getElementById("txtBirthday").focus();
                return false;
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
                    window.location = "TourGuideList.aspx?rend=" + Math.random();
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
            首页 &gt; 旅游质监模块 &gt; 导游管理
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="1000">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">导游信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <table width="95%" border="0" cellpadding="0" cellspacing="1" class="tb1-main">
                            <tr>
                                <td width="13%" align="center" class="Tdcellleft" height="30px">姓名
                                </td>
                                <td width="37%" align="center" class="Tdcellright">
                                    <asp:TextBox ID="txtNmae" runat="server" CssClass="txtInput" Width="90%"></asp:TextBox>
                                </td>
                                <td><span style="color: red">**</span></td>
                                <td width="13%" align="center" class="Tdcellleft">导游卡号
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtCardid" runat="server" style="width: 90%" class="txtInput" />
                                </td>
                                <td><span style="color: red">**</span></td>
                            </tr>
                            <tr height="30px">

                                <td align="center" class="Tdcellleft">导游证号
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtNumber" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                                <td align="center">性别
                                </td>
                                <td align="center">
                                    <select id="st_sex" class="txtInput" runat="server">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </td>
                                <td><span style="color: red">**</span></td>
                            </tr>
                            <tr height="30px">
                                <td align="center">身份证件
                                </td>
                                <td align="center">
                                    <input id="txtIdendity" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                                <td align="center" class="Tdcellleft">资格证号
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtQualification" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                            </tr>
                            <tr height="30px">
                                <td align="center">等级证号
                                </td>
                                <td align="center">
                                    <input id="txtRegister" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td>&nbsp;</td>
                                <td align="center" class="Tdcellleft">区域
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtArea" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>
                            </tr>
                            <tr height="30px">
                                <td align="center" class="Tdcellleft">年审日期
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtAnnual" value="" onclick="WdatePicker()" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                                <td align="center" class="Tdcellleft">发卡日期
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtCardDate" value="" onclick="WdatePicker()" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                            </tr>
                            <tr height="30px">
                                <td align="center">分值
                                </td>
                                <td align="center">
                                    <input id="txtScore" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                                <td align="center" class="Tdcellleft">语种名称
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtLanguage" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>
                            </tr>
                            <tr height="30px">
                                <td align="center">手机
                                </td>
                                <td align="center">
                                    <input id="txtPhone" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>

                                <td align="center" class="Tdcellleft">等级
                                </td>
                                <td align="center" class="Tdcellright">
                                    <select id="st_grade" class="txtInput" runat="server">
                                        <option value="初级">初级</option>
                                        <option value="中级" selected="selected">中级</option>
                                        <option value="高级">高级</option>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr height="30px">
                                <td align="center">旅行社许可证号
                                </td>
                                <td align="center">
                                    <input id="txtPermit" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                                <td align="center" class="Tdcellleft">旅行社简称
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtSummary" value="" style="width: 90%" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                            </tr>
                            <tr height="30px">
                                <td align="center">民族
                                </td>
                                <td align="center">
                                    <input id="txtNation" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>

                                <td align="center" class="Tdcellleft">证件类型
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtCardType" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>
                            </tr>
                            <tr height="30px">
                                <td align="center">学历
                                </td>
                                <td align="center">
                                    <select id="st_record" class="txtInput" runat="server">
                                        <option value="高中">高中</option>
                                        <option value="大专" selected="selected">大专</option>
                                        <option value="本科">本科</option>
                                        <option value="硕士">硕士</option>
                                        <option value="博士">博士</option>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                                <td align="center" class="Tdcellleft">出生日期
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtBirthday" value="" style="width: 90%" onclick="WdatePicker()" class="txtInput" runat="server" />
                                </td>
                                <td><span style="color: red">**</span></td>
                            </tr>
                            <tr height="30px">
                                <td align="center">联系电话
                                </td>
                                <td align="center">
                                    <input id="txtTel" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>

                                <td align="center" class="Tdcellleft">电子邮箱
                                </td>
                                <td align="center" class="Tdcellright">
                                    <input id="txtEmail" value="" style="width: 90%" class="txtInput" runat="server" /><td>&nbsp;</td>
                                </td>
                            </tr>
                            <tr height="30px">
                                <td align="center">工作性质
                                </td>
                                <td align="center">
                                    <select id="st_wordType" runat="server" class="txtInput">
                                        <option value="全职">全职</option>
                                        <option value="兼职">兼职</option>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                                <td align="center" class="Tdcellleft">是否推荐
                                </td>
                                <td align="center" class="Tdcellright">
                                    <select id="st_recommend" runat="server" class="txtInput">
                                        <option value="不推荐">不推荐</option>
                                        <option value="推荐">推荐</option>
                                    </select>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr height="30px">
                                <td align="center">备注
                                </td>
                                <td align="center">
                                    <textarea id="txtRemarks" runat="server" style="width: 90%; height: 60px"></textarea><td>&nbsp;</td>
                                </td>
                                <td align="center" class="Tdcellleft"></td>
                                <td align="center" class="Tdcellright"></td>
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
                        <asp:Button ID="btn_save" runat="server" OnClick="btnSubmit_Click" Text="修改保存" />
                        文档ID:<input id="txtDocid" value="" type="text" runat="server" />
                    </div>
    </form>
</body>
</html>
