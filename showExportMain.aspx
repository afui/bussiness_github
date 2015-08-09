<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showExportMain.aspx.cs" Inherits="showExportMain" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会飞猪</title>
    <script type="text/javascript" src="Js/jquery.min.js"></script>
    <script type="text/javascript" src="Js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="Js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Js/simpler-sidebar.js"></script>
    <link rel="stylesheet" href="Css/bootstrap.css" />
    <link rel="stylesheet" href="Css/font-awesome.min.css" />
    <link rel="stylesheet" href="Css/style.css" />
    <!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
		<![endif]-->
    <script type="text/javascript">
        $(function () {

            $("#kinMaxShow").kinMaxShow({
                height: 400,
                button: {
                    switchEvent: 'click',
                    normal: { background: 'url(images/button.png) no-repeat -14px 0', marginRight: '8px', border: '0', right: '44%', bottom: '20px' },
                    //当前焦点图按钮样式 设置，写法同上            
                    focus: { background: 'url(images/button.png) no-repeat 0 0', border: '0' }
                }
            });
        });

        function saveData(type) {
            document.getElementById('txtType').value = type;
            if (type == "1") {
                //问题详情验证
                if (document.getElementById('txtDetail').value == "") {
                    alert('对不起，请填写问题详情！');
                    document.getElementById('txtDetail').focus();
                    return false;
                }
                //邮箱填写验证
                if (document.getElementById('txtEmail').value == "") {
                    alert('对不起，请填写邮件地址！');
                    document.getElementById('txtEmail').focus();
                    return false;
                } else {
                    var temp = document.getElementById('txtEmail').value;
                    //对电子邮件的验证
                    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                    if (!myreg.test(temp)) {
                        alert('提示\n\n请输入有效的E_mail！');
                        document.getElementById('txtEmail').focus();
                        return false;
                    }
                }
                document.getElementById('btn_save').click();
            } else if (type == "2") {
                //姓名验证
                if (document.getElementById('txtName').value == "") {
                    alert('对不起，请填写姓名！');
                    document.getElementById('txtName').focus();
                    return false;
                }
                //邮箱填写验证
                if (document.getElementById('txtDEmail').value == "") {
                    alert('对不起，请填写邮件地址！');
                    document.getElementById('txtDEmail').focus();
                    return false;
                } else {
                    var temp = document.getElementById('txtDEmail').value;
                    //对电子邮件的验证
                    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                    if (!myreg.test(temp)) {
                        alert('提示\n\n请输入有效的E_mail！');
                        document.getElementById('txtDEmail').focus();
                        return false;
                    }
                }
                //问题详情验证
                if (document.getElementById('txtDDetail').value == "") {
                    alert('对不起，请填写问题详情！');
                    document.getElementById('txtDDetail').focus();
                    return false;
                }
                document.getElementById('btn_save').click();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <body>
            <!--头部-->
            <uc1:top ID="top1" runat="server" />
            <div class="Width100 Xiangm">

                <div class="Xiangm-left">

                    <div class="Fengl">
                        <div class="Fen_top">快速提问</div>
                        <div class="Fen_Bottom4">
                            <table width="200" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="30">问题描述</td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea class="txext" id="txtDetail" runat="server"></textarea></td>
                                </tr>
                                <tr>
                                    <td height="30">电子邮箱</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="txext1" runat="server" id="txtEmail" /></td>
                                </tr>
                                <tr>
                                    <td height="25"></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:void(0)" onclick="saveData('1');">我要提问</a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--项目分类-->

                </div>
                <!--Xiangm-left-->

                <div class="specialist">

                    <div class="expert">
                        <div class="exp_top">专家简介</div>
                        <asp:Label ID="lb_show" runat="server"></asp:Label>
                    </div>

                    <div class="expert1">
                        <div class="exp_top1">我要咨询<i>电子邮箱地址不会被公开。 必填项已用*标注。</i></div>
                        <div class="exp_Bottom1">
                            <table width="730" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="13" height="40"><i>*</i></td>
                                    <td width="719" height="40">姓名</td>
                                </tr>
                                <tr>
                                    <td height="40" colspan="2">
                                        <input type="text" runat="server" id="txtName" class="txext2" /></td>
                                </tr>
                                <tr>
                                    <td width="13" height="40"><i>*</i></td>
                                    <td width="719" height="40">邮箱</td>
                                </tr>
                                <tr>
                                    <td height="40" colspan="2">
                                        <input type="text" runat="server" id="txtDEmail" class="txext2" /></td>
                                </tr>
                                <tr>
                                    <td width="13" height="40"><i>*</i></td>
                                    <td width="719" height="40">问题描述</td>
                                </tr>
                                <tr>
                                    <td height="40" colspan="2">
                                        <textarea class="txext3" runat="server" id="txtDDetail"></textarea></td>
                                </tr>
                                <tr>
                                    <td height="36" colspan="2"><a href="javascript:void(0)" onclick="saveData('2');">提交问题</a></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </div>
                <!--specialist-->
            </div>
            <!--网站底部-->
            <uc2:bottom ID="bottom2" runat="server" />
            <div style="display: none">
                保存：<asp:Button ID="btn_save" runat="server" Text="Button" OnClick="btn_save_Click" />
                按钮类型：<input id="txtType" runat="server" value="" />
            </div>
    </form>
</body>
</html>
