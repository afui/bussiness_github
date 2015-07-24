<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_user.aspx.cs" Inherits="Admin_Organ_main_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>社区智慧物业管理系统</title>
    <script src="../js/My97DatePicker/WdatePicker.js"></script>
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link href="../css/css-cn.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function CheckfmMainInput() {
            var fm = document.forms[0];
            if (fm.txtuserid.value == "") {
                alert("请输入系统名！");
                fm.txtuserid.focus();
                return false;
            }
            if (fm.txtusername.value == "") {
                alert("请输入中文名！");
                fm.txtusername.focus();
                return false;
            }
            if (fm.hy_deptname.value == "") {
                alert("请选择部门！");
                fm.hy_deptname.focus();
                return false;
            }
            if (fm.txtuserno.value == "") {
                alert("请输入排序号！");
                fm.txtuserno.focus();
                return false;
            }
            if (isNaN(fm.txtuserno.value)) {
                alert("排序号必须为数值！");
                fm.txtuserno.focus();
                return false;
            }
            return true;
        }
        //保存
        function submitform() {
            if (!CheckfmMainInput()) {
                return false;
            }
            var fm = document.forms[0];
            fm.btn_save.click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            首页 &gt; 系统管理 &gt; 人员管理
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="1000">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">人员信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <table width="95%" border="0" cellpadding="0" cellspacing="1" class="tb1-main">
                            <tbody>
                                <tr>
                                    <td width="13%" align="center" class="Tdcellleft" height="30px">系&nbsp;统&nbsp;名
                                    </td>
                                    <td width="37%" align="center" class="Tdcellright">
                                        <asp:TextBox ID="txtuserid" runat="server" CssClass="txtInput" Width="98%"></asp:TextBox>
                                    </td>
                                    <td width="13%" align="center" class="Tdcellleft">中&nbsp;文&nbsp;名
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtusername" runat="server" style="width: 98%" class="txtInput" />
                                    </td>
                                </tr>
                                <tr height="30px">
                                    <td align="center" class="Tdcellleft">所在机构
                                    </td>
                                    <td align="left" class="Tdcellright">
                                        <asp:TextBox ID="hy_deptname" runat="server" MaxLength="30" CssClass="txtInput" Width="75%"
                                            ReadOnly></asp:TextBox>
                                        <input type="button" onclick="var pathname = (window.location.pathname);
    var ls_url = '../ggdy/Hy_SelDept.aspx?txtfield=hy_deptname&valuefield=hy_deptid&type=1&deptid=' + document.getElementById('hy_deptid').value;
    sWindowStyle = 'status=no,resizable=no,scrollbars=yes,screenX=0,screenY=100,width=600,height=450,left=200,top=100';
    window.open(ls_url, '', sWindowStyle);"
                                            value="选 择" class="btnInput">
                                    </td>
                                    <td align="center" class="Tdcellleft">办公室
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtfjh" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
                                
                                <tr height="30px">
                                    
                                    <td align="center" class="Tdcellleft">手&nbsp;机&nbsp;号
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtmobile" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                    <td align="center">办公室电话
                                    </td>
                                    <td align="center">
                                        <input id="txtofficetel" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
                               
                               
                                <tr height="30px">
                                <td align="center">现任职务
                                    </td>
                                    <td align="center">
                                        <input id="txtposition" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                    
                                    <td align="center" class="Tdcellleft">排&nbsp;序&nbsp;号
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtuserno" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
                                <tr height="30px">
                                    <td align="center" class="Tdcellleft">是否启用
                                    </td>
                                    <td align="left" class="Tdcellright">
                                        <asp:DropDownList ID="ddlisenabled" runat="server" CssClass="btnSelect">
                                            <asp:ListItem>启用</asp:ListItem>
                                            <asp:ListItem>不启用</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    
                                </tr>
                            </tbody>
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
                </td>
            </tr>
        </table>
        <div style="display: none;">
         <tr height="30px">
                                    <td align="center" class="Tdcellleft">身份证号码
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtsfzhm" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                    <td align="center" class="Tdcellleft">短&nbsp;&nbsp;&nbsp;&nbsp;号
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtvirtualtel" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
        <tr height="30px">
                                    <td align="center" class="Tdcellleft">性别
                                    </td>
                                    <td align="left" class="Tdcellright">
                                        <asp:DropDownList ID="ddlxb" Style="width: 99%" runat="server" CssClass="btnSelect">
                                            <asp:ListItem>--请选择--</asp:ListItem>
                                            <asp:ListItem>男</asp:ListItem>
                                            <asp:ListItem>女</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" class="Tdcellleft">政治面貌
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtzzmm" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                    <td align="center" class="Tdcellleft">出生年月
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtbirthday" onclick="WdatePicker({ el: $dp.$('txtbirthday') })" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
                                <tr height="30px">
                                    <td align="center" class="Tdcellleft">学历
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtxl" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                    <td align="center" class="Tdcellleft">毕业院校
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtbyyx" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
                                 <tr height="30px">
                                    <td align="center" class="Tdcellleft">进单位时间
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtjdwsj" onclick="WdatePicker({ el: $dp.$('txtjdwsj') })" value="" style="width: 98%"
                                            class="txtInput" runat="server" />
                                    </td>
                                    <td align="center" class="Tdcellleft">家庭住址
                                    </td>
                                    <td align="center" class="Tdcellright">
                                        <input id="txtjtzz" value="" style="width: 98%" class="txtInput" runat="server" />
                                    </td>
                                </tr>
            新增或修改：<input id="txtop" runat="server" /><br />
            部门ID：<asp:TextBox ID="hy_deptid" runat="server"></asp:TextBox><br />
            <asp:Button ID="btn_save" runat="server" OnClick="btnSubmit_Click" Text="修改保存" />
            人员ID：<asp:TextBox ID="txtid" runat="server"></asp:TextBox>
            角色ID：<asp:TextBox ID="txtjsids2" runat="server"></asp:TextBox>
            角色名：<asp:TextBox ID="txtjsnames2" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
