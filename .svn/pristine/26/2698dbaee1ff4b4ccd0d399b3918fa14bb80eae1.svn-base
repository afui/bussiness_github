<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_category.aspx.cs" Inherits="CategoryManage_main_category" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>类别管理</title>
    <link type="text/css" rel="stylesheet" href="../images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/jquery/messages_cn.js"></script>
    <script type="text/javascript" src="../images/index/scripts/ui/js/ligerBuild.min.js"></script>
    <script type="text/javascript" src="../images/index/js/function.js"></script>
    <script type="text/javascript">
        //表单验证
        $(function () {
            $("#form1").validate({
                invalidHandler: function (e, validator) {
                    parent.jsprint("有 " + validator.numberOfInvalids() + " 项填写有误，请检查！", "", "Warning");
                },
                errorPlacement: function (lable, element) {
                    //可见元素显示错误提示
                    if (element.parents(".tab_con").css('display') != 'none') {
                        element.ligerTip({ content: lable.html(), appendIdTo: lable });
                    }
                },
                success: function (lable) {
                    lable.ligerHideTip();
                }
            });
        });
        //查看地图
        function LookupMap() {
            var sNextWindow = 'status=no,resizable=no,scrollbars=no,screenX=0,screenY=0,width=650,height=500,left=150,top=150';
            var lv_temp = document.getElementById('txtlongitude').value.split(",");
            var ls_jd = lv_temp[0];
            var ls_wd = lv_temp[1];
            var s_url = 'map_pop.aspx?x=' + ls_jd + '&y=' + ls_wd + '&title=&content=&rnd=' + Math.random();
            var qpyj = window.open(s_url, 'ideas', sNextWindow);
            qpyj.moveTo(150, 150);
            qpyj.focus();
        }
    </script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
        <div class="navigation">
            <a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 类别管理 &gt; 类别管理
        </div>
        <div id="contentTab">
            <ul class="tab_nav">
                <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:void(0);">类别信息</a></li>
            </ul>
            <div class="tab_con" style="display: block;">
                <table class="form_table">
                    <col width="180px">
                    <col>
                    <tbody>
                        <tr>
                            <th>类别编号：
                            </th>
                            <td>
                                <asp:TextBox ID="txtcid" runat="server" CssClass="txtInput normal required" MaxLength="50"></asp:TextBox><label>*</label>
                            </td>
                        </tr>
                        <tr>
                            <th>类别名称：
                            </th>
                            <td>
                                <asp:TextBox ID="txtcname" runat="server" CssClass="txtInput normal required" MaxLength="20"></asp:TextBox><label>*</label>
                            </td>
                        </tr>


                        <tr>
                            <th>排序号：
                            </th>
                            <td>
                                <asp:TextBox ID="txtcsort" runat="server" CssClass="txtInput normal required digits"
                                    MaxLength="8"></asp:TextBox><label>*</label>
                            </td>
                        </tr>
                        <%--<tr>
                        <th>
                            手机号码：
                        </th>
                        <td>
                            <asp:TextBox ID="txttel" runat="server" CssClass="txtInput normal" MaxLength="50"></asp:TextBox><label>*</label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            E-Mail：
                        </th>
                        <td>
                            <asp:TextBox ID="txtmail" runat="server" CssClass="txtInput normal" MaxLength="50"></asp:TextBox><label>*</label>
                        </td>
                    </tr>--%>
                        <%--<tr>
                        <th>
                            状态：
                        </th>
                        <td>
                            <asp:RadioButtonList ID="rblstate" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True">启用</asp:ListItem>
                                <asp:ListItem Value="1">禁用</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>--%>
                    </tbody>
                </table>
            </div>
            <div class="foot_btn_box">
                <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btnSubmit" OnClick="btnSubmit_Click" />
            </div>
        </div>
        <div style="display: none">
            新增或修改：<input id="txtop" runat="server" value="" /><br />
            是否有处理权限：<input id="txtSystemClRight" runat="server" value="0" /><br />
            上一级部门：<input id="txtlastcid" runat="server" value="" /><br />
            URL：<input id="txturl" runat="server" value="" /><br />
        </div>
    </form>
</body>
</html>
