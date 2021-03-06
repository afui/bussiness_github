<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>系统后台管理中心</title>
    <link href="images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="images/index/css/style.css" rel="stylesheet" type="text/css" />
    <script src="images/index/scripts/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="images/index/scripts/ui/js/ligerBuild.min.js" type="text/javascript"></script>
    <script src="images/index/js/function.js" type="text/javascript"></script>
    <script src="images/index/js/hyindex.js" type="text/javascript"></script>
    <script src="js/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        var timerID = null;
        var timerRunning = false;
        function fStopClock() {
            if (timerRunning)
                window.clearTimeout(timerID);
            timerRunning = false;
        }
        function fGetTime() {
            var datNow = new Date();
            var year = datNow.getFullYear();
            var month = datNow.getMonth() + 1;
            var week = datNow.getUTCDay();
            var date = datNow.getDate();
            var hours = datNow.getHours();
            var minutes = datNow.getMinutes();
            var seconds = datNow.getSeconds();
            var day = datNow.getDay();
            var strTime = "";
            week = fFormatWeek(week);
            strTime += year + "年" + month + "月" + date + "日 ";
            strTime += "星期" + week + " ";
            strTime += ((hours <= 24) ? hours : hours - 24);
            strTime += ((minutes < 10) ? ":0" : ":") + minutes;
            strTime += ((seconds < 10) ? ":0" : ":") + seconds;
            spnDate.innerText = strTime;
            timerID = window.setTimeout("fGetTime()", 1000);
            timerRunning = true;
        }
        function fFormatWeek(src) {
            var sValue = "";
            var sTmp = "1,2,3,4,5,6,7,0";
            if (sTmp.indexOf(src) == -1) return "1"; //如果异常,则退出，返回星期一.
            switch (src) {
                case 1:
                    sValue = "一";
                    break;
                case 2:
                    sValue = "二";
                    break;
                case 3:
                    sValue = "三";
                    break;
                case 4:
                    sValue = "四";
                    break;
                case 5:
                    sValue = "五";
                    break;
                case 6:
                    sValue = "六";
                    break;
                case 7:
                    sValue = "日";
                    break;
                case 0:
                    sValue = "日";
                    break;
                default:
                    sValue = "3";
                    break;
            }
            return sValue;
        }
        function fStartClock() {
            fStopClock();
            fGetTime();
        }
    </script>
</head>
<body style="padding: 0px;">
    <form id="form1" runat="server">
        <div class="pageloading_bg" id="pageloading_bg">
        </div>
        <div id="pageloading">
            数据加载中，请稍等...
        </div>
        <div id="global_layout" class="layout" style="width: 100%">
            <!--头部-->
            <div position="top" class="header">
                <div class="header_box">
                    <div class="header_right">
                        <span><b>
                            <asp:Label ID="lbluserinfo" runat="server"></asp:Label></b>&nbsp;您好，欢迎光临</span>
                        <br />
                        <a href="index.aspx">后台首页</a> | <a target="_blank" href="../">预览网站</a> | <a href="javascript:f_addTab('main_xgmm','修改密码','SysManage/main_xgmm.aspx?rnd='+Math.random())">修改密码</a> | <a id="lbtnExit" href="login.aspx">退出系统</a>
                    </div>
                    <div class="logo">
                        <img src="images/index/images/head_logo.png" />
                    </div>
                </div>
            </div>
            <!--左边-->
            <div position="left" title="管理菜单" id="global_left_nav">
                <div title="内容管理" iconcss="menu-icon-model" class="l-scroll">
                    <ul id="global_channel_tree1" style="margin-top: 3px;">
                        <li url="bussiness/exportList.aspx"><span>专家信息</span></li>
                        <li url="bussiness/questionList.aspx"><span>咨询列表</span></li>
                    </ul>
                </div>
                <div title="项目管理" iconcss="menu-icon-model" class="l-scroll">
                    <ul id="global_channel_tree2" style="margin-top: 3px;">
                        <li url="project/projectList.aspx"><span>项目信息列表</span></li>
                        <li url="bussiness/questionList.aspx"><span>咨询列表</span></li>
                    </ul>
                </div>
                <div title="系统管理" iconcss="menu-icon-setting">
                    <ul class="nlist">
                        <li><a href="javascript:f_addTab('list_user','用户管理','SysManage/list_user.aspx')">用户管理</a></li>
                        <li><a href="javascript:f_addTab('OrgList','机构管理','SysManage/OrgList.aspx')">机构管理</a></li>
                        <li><a href="javascript:f_addTab('list_role','权限管理','SysManage/list_role.aspx')">权限管理</a></li>
                        <li><a href="javascript:f_addTab('list_log','系统日志','SysManage/list_log.aspx')">系统日志</a></li>
                        <li><a href="javascript:f_addTab('list_category','栏目管理','CategoryManage/list_category.aspx')">栏目管理</a></li>
                    </ul>
                </div>
            </div>
            <div position="center" id="framecenter" toolsid="tab-tools-nav">
                <div tabid="home" title="管理中心" iconcss="tab-icon-home" style="height: 300px">
                    <iframe frameborder="0" name="sysMain" src="center.aspx"></iframe>
                </div>
            </div>
            <div position="bottom" class="footer">
                <div class="footer_left">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Copyright (c) 2013-2020 Nbheyi All Rights Reserved.
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="footer_right">
                    <table border="0" cellspacing="0" cellpadding="0" align="right">
                        <tr>
                            <td>今天是：<span id="spnDate"></span><script language="JavaScript">                                                              fStartClock();</script>&nbsp;<span
                                id="spjszc">技术支持：宁波合益&nbsp;售后服务电话：0574-88195320&nbsp;</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
