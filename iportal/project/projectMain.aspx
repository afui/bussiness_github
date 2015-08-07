<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="projectMain.aspx.cs" Inherits="projectMain" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            首页 &gt; 项目管理 &gt; 项目详情
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">项目详情</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" class="border-table">
                            <tr height="40px">
                                <td align="center" class="Tdcellleft">项目海报 
                                </td>
                                <td align="left" class="Tdcellright">
                                    <img src="../../images/Img.jpg" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">项目名称</td>
                                <td align="left">
                                    <asp:Label ID="lb_projectName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td width="13%" align="center" class="Tdcellleft">项目网址 
                                </td>
                                <td align="left" class="Tdcellright">
                                    <asp:Label ID="lb_projectNet" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">项目描述
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_projectSummary" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">

                                <td align="center">项目关键词
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_projectKey" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center" class="Tdcellleft">行业分类
                                </td>
                                <td align="left" class="Tdcellright">
                                    <asp:Label ID="lb_industry" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">项目详情
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_projectDetail" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">预设融资金额
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_financing" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">手机号码
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_phone" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">邮箱
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_email" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">项目商业计划书
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_business" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">项目路演视频
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_movice" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">团队介绍
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_teamDetail" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td align="center">项目留言
                                </td>
                                <td align="left">
                                    <asp:Label ID="lb_message" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--/内容-->
                    <!--工具栏-->
                    <div class="page-footer">
                        <div class="btn-list">
                            <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript: history.back(-1);" />
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <!--/工具栏-->
            </tr>
        </table>
    </form>
</body>
</html>
