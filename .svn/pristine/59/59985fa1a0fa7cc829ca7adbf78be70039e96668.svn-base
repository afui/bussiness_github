<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_role.aspx.cs" Inherits="main_role" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>社区智慧物业管理系统</title>
    <link href="../css/css-cn.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            首页 &gt; 系统管理 &gt; 权限管理
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="1000">
            <tr>
                <td>
                    <!--内容-->
                    <div class="content-tab-wrap">
                        <div id="floatHead" class="content-tab">
                            <div class="content-tab-ul-wrap">
                                <ul>
                                    <li><a href="javascript:;" onclick="tabs(this);" class="selected">权限信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <dl>
                            <dt>权限序号：</dt>
                            <dd>
                                <asp:TextBox ID="txtRoleSort" runat="server" Width="400px" CssClass="txtInput" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
                            </dd>
                        </dl>
                        <dl>
                            <dt>权限编号：</dt>
                            <dd>
                                <asp:TextBox ID="txtRoleId" runat="server" Width="400px" CssClass="txtInput" ></asp:TextBox>
                            </dd>
                        </dl>
                        <dl>
                            <dt>权限名称：</dt>
                            <dd>
                                <asp:TextBox ID="txtRoleNmae" runat="server" Width="400px" CssClass="txtInput"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleNmae" ErrorMessage="RequiredFieldValidator"
                                    SetFocusOnError="True">权限名称不能为空</asp:RequiredFieldValidator>
                            </dd>
                        </dl>
                        <dl>
                            <dt>权限备注：</dt>
                            <dd>
                                <asp:TextBox ID="txtRoleDemo" TextMode="MultiLine" Height="40px" runat="server" Width="400px" CssClass="txtInput"></asp:TextBox>
                            </dd>
                        </dl>
                    </div>
                    <!--/内容-->
                    <!--工具栏-->
                    <div class="page-footer">
                        <div class="btn-list">
                            <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" OnClick="btnSubmit_Click" />
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
            新增或修改：<input id="txtop" runat="server" /><br />
            文档ID：<input id="txtdocid" runat="server" value="" /><br />
            URL：<input id="txturl" runat="server" value="" /><br />
        </div>
    </form>
</body>
</html>
