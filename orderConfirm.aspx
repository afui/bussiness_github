﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderConfirm.aspx.cs" Inherits="orderConfirm" %>

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
                <img src="images/mission2.gif">
            </div>

        </div>
        <!--分类-->

        <div class="Width100 Task">
            <table width="982" border="0" cellpadding="0" cellspacing="0">
                <tr bgcolor="#f7f7f7">
                    <td width="20"></td>
                    <td height="41" colspan="2" valign="bottom">订单确认</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td width="925" height="18" valign="top"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td width="925" height="38">订单详情</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="166" valign="middle">
                        <table width="815" border="1" cellpadding="0" cellspacing="0" bgcolor="#f7f7f7" style="margin: 0">
                            <tr>
                                <td width="173" height="50" align="center">服务类别</td>
                                <td width="277" height="50" align="center">需求标题</td>
                                <td width="148" height="50" align="center">行业</td>
                                <td width="207" height="50" align="center">需求描述</td>
                            </tr>
                            <tr bgcolor="#fff" style="font-size: 14px;">
                                <td height="100" align="center">Logo/VI设计<br>
                                    Logo设计</td>
                                <td height="100" align="center">会飞猪创客部落网络平台标志设计</td>
                                <td height="100" align="center">互联网</td>
                                <td height="100" align="center"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38">备注</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="50" colspan="2"></td>
                    <td height="50">
                        <input type="text" class="put"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38">联系方式</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="50" colspan="2"></td>
                    <td height="50">
                        <input type="text" class="put"></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="38"><i></i>征集时间： 7天</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td height="50" colspan="2"></td>
                    <td height="50">赏金金额：<strong>1000</strong>元</td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="20"></td>
                </tr>
            </table>
            <a href="getBountry.aspx?rend=<%=System.Guid.NewGuid().ToString() %>" class="Quest Quest2">确定，去托管赏金</a><a href="demandPublish.aspx?rend=<%=System.Guid.NewGuid().ToString() %>" class="Quest1">返回上一步</a>
        </div>
        <!--Task-->
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>
