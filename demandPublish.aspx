﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demandPublish.aspx.cs" Inherits="demandPublish" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会飞猪</title>
    <link rel="stylesheet" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.min.js"></script>
    <script type="text/javascript" src="Js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="Js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Js/simpler-sidebar.js"></script>
    <link rel="stylesheet" href="Css/bootstrap.css" />
    <link rel="stylesheet" href="Css/font-awesome.min.css" />
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

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--头部-->
        <uc1:top ID="top1" runat="server" />
        <!--菜单-->
        <div class="Width100">

            <div class="mission">需求任务发布</div>
            <div class="mission1">
                <img src="images/mission1.gif">
            </div>

        </div>
        <!--分类-->

        <div class="Width100 Task">

            <table width="982" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#f7f7f7">
                    <td width="20"></td>
                    <td height="55" colspan="3">一、选择需求服务类目</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="50" colspan="2"></td>
                    <td width="164" height="50" align="left" valign="top">
                        <select name="select" class="Jobs">
                            <option>Logo/VI设计</option>
                        </select></td>
                    <td width="761" height="50" valign="top">
                        <select name="select" class="Jobs">
                            <option>LOGO设计</option>
                        </select></td>
                </tr>
            </table>

            <table width="982" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#f7f7f7">
                    <td width="20"></td>
                    <td height="41" colspan="2" valign="bottom">一、需求任务描述</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td width="925" height="27" valign="top">
                        <p>请尽可能准确描述您的需求</p>
                    </td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38"><i>*</i>您的需求任务名称</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="50">
                        <input type="text" class="put"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38" valign="bottom"><i>*</i>您的需求任务名称</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="40">
                        <select name="select" class="Jobs">
                            <option>LOGO设计</option>
                        </select></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38" valign="bottom"><i>*</i>描述您的公司任务需求的具体内容。</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="180">
                        <textarea class="Jobs1"></textarea></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38"><i>*</i>备注</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="50">
                        <input type="text" class="put"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td width="925" height="27" valign="top">
                        <p style="margin: 0">如果您已有草图或者参考案例，请在这里上传与描述。</p>
                    </td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="20" colspan="2"></td>
                    <td height="53"><a href="#" class="publish" style="margin: 0">上传图片</a></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38"><i>*</i>留下您的手机号码，以方便更好的为您服务。</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="50">
                        <input type="text" class="put"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="20"></td>
                </tr>
            </table>

            <table width="982" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#f7f7f7">
                    <td width="20"></td>
                    <td height="41" colspan="2" valign="bottom">一、需求任务描述</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td width="925" height="18" valign="top"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="40"><i>*</i>赏金金额</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="50">
                        <input type="text" class="put1" placeholder="100">元</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="40" valign="bottom"><i>*</i>任务征集形式</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="50">
                        <select name="select" class="Jobs">
                            <option>多人分享</option>
                        </select></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="40" valign="bottom"><i>*</i>任务征集形式</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="38" colspan="2"></td>
                    <td height="50">
                        <select name="select" class="Jobs">
                            <option>招标</option>
                        </select></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="40" valign="bottom"><i>*</i>您希望多久完成征集</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="70">
                        <div class="out2">
                            <ul>
                                <li>
                                    <input type="checkbox"><span>7天</span></li>
                                <li>
                                    <input type="checkbox"><span>5天</span></li>
                                <li>
                                    <input type="checkbox"><span>3天</span></li>
                                <li>
                                    <input type="checkbox"><span>1天</span></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38"><em>其他</em><input type="text" class="Jobs2" placeholder="20"><em>天</em></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="20"></td>
                </tr>
            </table>
            <a href="orderConfirm.aspx?rend=<%=System.Guid.NewGuid().ToString() %>" class="Quest">下一步</a>
        </div>
        <!--Task-->
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>
