<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ϵͳ��̨��������</title>
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
            strTime += year + "��" + month + "��" + date + "�� ";
            strTime += "����" + week + " ";
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
            if (sTmp.indexOf(src) == -1) return "1"; //����쳣,���˳�����������һ.
            switch (src) {
                case 1:
                    sValue = "һ";
                    break;
                case 2:
                    sValue = "��";
                    break;
                case 3:
                    sValue = "��";
                    break;
                case 4:
                    sValue = "��";
                    break;
                case 5:
                    sValue = "��";
                    break;
                case 6:
                    sValue = "��";
                    break;
                case 7:
                    sValue = "��";
                    break;
                case 0:
                    sValue = "��";
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
            ���ݼ����У����Ե�...
        </div>
        <div id="global_layout" class="layout" style="width: 100%">
            <!--ͷ��-->
            <div position="top" class="header">
                <div class="header_box">
                    <div class="header_right">
                        <span><b>
                            <asp:Label ID="lbluserinfo" runat="server"></asp:Label></b>&nbsp;���ã���ӭ����</span>
                        <br />
                        <a href="index.aspx">��̨��ҳ</a> | <a target="_blank" href="../">Ԥ����վ</a> | <a href="javascript:f_addTab('main_xgmm','�޸�����','SysManage/main_xgmm.aspx?rnd='+Math.random())">�޸�����</a> | <a id="lbtnExit" href="login.aspx">�˳�ϵͳ</a>
                    </div>
                    <div class="logo">
                        <img src="images/index/images/head_logo.png" />
                    </div>
                </div>
            </div>
            <!--���-->
            <div position="left" title="�����˵�" id="global_left_nav">
                <div title="���ݹ���" iconcss="menu-icon-model" class="l-scroll">
                    <ul id="global_channel_tree1" style="margin-top: 3px;">
                        <li url="bussiness/exportList.aspx"><span>ר����Ϣ</span></li>
                        <li url="bussiness/questionList.aspx"><span>��ѯ�б�</span></li>
                    </ul>
                </div>
                <div title="ϵͳ����" iconcss="menu-icon-setting">
                    <ul class="nlist">
                        <li><a href="javascript:f_addTab('list_user','�û�����','SysManage/list_user.aspx')">�û�����</a></li>
                        <li><a href="javascript:f_addTab('OrgList','��������','SysManage/OrgList.aspx')">��������</a></li>
                        <li><a href="javascript:f_addTab('list_role','Ȩ�޹���','SysManage/list_role.aspx')">Ȩ�޹���</a></li>
                        <li><a href="javascript:f_addTab('list_log','ϵͳ��־','SysManage/list_log.aspx')">ϵͳ��־</a></li>
                        <li><a href="javascript:f_addTab('list_category','��Ŀ����','CategoryManage/list_category.aspx')">��Ŀ����</a></li>
                    </ul>
                </div>
            </div>
            <div position="center" id="framecenter" toolsid="tab-tools-nav">
                <div tabid="home" title="��������" iconcss="tab-icon-home" style="height: 300px">
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
                            <td>�����ǣ�<span id="spnDate"></span><script language="JavaScript">                                                              fStartClock();</script>&nbsp;<span
                                id="spjszc">����֧�֣���������&nbsp;�ۺ����绰��0574-88195320&nbsp;</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>