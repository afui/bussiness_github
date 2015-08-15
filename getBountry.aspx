<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getBountry.aspx.cs" Inherits="getBountry" %>

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
    <script type="text/javascript">
        function dataSubmit() {
            document.getElementById('btn_save').click();
        }
        function tip(prompt) {
            var d = dialog({
                title: '提示',
                content: prompt
            });
            d.show();
        }

        function success() {
            var d = dialog({
                title: '提示',
                content: '您的需求发布成功！',
                okValue: '确定',
                ok: function () {
                    window.location = 'allDemand.aspx?rend=<%=System.Guid.NewGuid().ToString()%>';
                    return false;
                }
            });
            d.show();
        }
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
                <img src="images/mission3.gif">
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
                        <table width="867" border="1" cellpadding="0" cellspacing="0" bgcolor="#f7f7f7" style="margin: 0">
                            <tr>
                                <td width="291" height="50" align="center">需求标题</td>
                                <td width="282" height="50" align="center">订单号</td>
                                <td width="286" height="50" align="center">交易金额</td>
                            </tr>
                            <tr bgcolor="#fff" style="font-size: 14px;">
                                <td height="100" align="center">
                                    <asp:Label ID="lb_title" runat="server"></asp:Label></td>
                                <td height="100" align="center">
                                    <asp:Label ID="lb_orderid" runat="server"></asp:Label></td>
                                <td height="100" align="center">
                                    <asp:Label ID="lb_amount" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="153">
                        <input type="radio" name="radio" id="radio" runat="server" checked="True" value="radio">
                        <label for="radio">
                            <img src="images/mission4.gif"></label></td>
                </tr>
                <tr bgcolor="#f7f7f7">
                    <td colspan="2"></td>
                    <td height="20"></td>
                </tr>
            </table>
            <a href="javascript:void(0);" onclick="dataSubmit()" class="Quest Quest3">确定支付</a>
        </div>
        <div style="display: none">
            <input id="txtDocid" runat="server" />
            <asp:Button ID="btn_save" runat="server" Text="保存" OnClick="btn_save_Click" />
        </div>
        <!--Task-->
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>
