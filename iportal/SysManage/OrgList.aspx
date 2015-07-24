<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrgList.aspx.cs" Inherits="Admin_Organ_OrgList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>社区智慧物业管理系统</title>
    <link href="../../css/css-cn.css" rel="stylesheet" />
    <link href="../css/pagination.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script language="javascript" src="../../js/HomeBookMark.js"></script>
    <script language="jscript" type="text/javascript">
        function backUp() {
            var deptid = document.getElementById("txtdeptid").value;
            if (deptid != "") {
                if (deptid.length > 3) {
                    window.location = "OrgList.aspx?deptid=" + deptid.substring(0, deptid.length - 3) + "&rnd=" + Math.random() + "&url=" + window.location.href + "";
                } else {
                    window.location = "OrgList.aspx?rnd=" + Math.random() + "&url=" + window.location.href + "";
                }
            } else {
                alert("对不起，这已是一级部门！");
                return;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
             &nbsp;首页 &gt; 系统管理 &gt; 机构管理
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="98%">
            <tr>
                <td>
                    <!--按钮开始-->
                    <div class="tools_box">
                        <div class="tools_bar">
                            <div class="search_box">
                                <asp:TextBox ID="txtKeywords" runat="server" CssClass="txtInput"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="搜 索" CssClass="btnSearch" OnClick="btnSearch_Click" />
                            </div>
                            <a href="javascript:void(0);" onclick="window.location='OrgMana.aspx?op=add&deptid='+document.getElementById('txtdeptid').value+'&rnd='+Math.random()+'&url='+window.location.href;" class="tools_btn" id="tdnewdoc" runat="server">
                                <span><b class="add">新 增</b></span></a> <a href="javascript:void(0);" onclick="DelInfo();" class="tools_btn"
                                    id="tddeldoc" runat="server"><span><b class="delete">删 除</b></span></a>
                            <a href="javascript:void(0);" onclick="backUp();" class="tools_btn"
                                id="A1" runat="server"><span><b class="backup">返回上一级</b></span></a>
                        </div>
                    </div>
                    <!--按钮结束-->
                    <!--列表展示.开始-->
                    <asp:Repeater ID="rptList" runat="server">
                        <HeaderTemplate>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                                <tr>
                                    <th align="center" width="5%">序号
                                    </th>
                                    <th align="center" width="5%">
                                        <input type="checkbox" name="seleall" value="" onclick="CheckAll();" title="全选">
                                    </th>
                                    <th align="center">机构名称
                                    </th>
                                    
                                    <th align="center" width="10%">下属机构
                                    </th>
                                    <th align="center" width="10%">修改
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="22" onmouseover="this.className='tr_over'" onmouseout="this.className='tr_out'"
                                class="tr_out">
                                <td align="center">
                                    <%# (page - 1) * pageSize + Container.ItemIndex + 1%></a>
                                </td>
                                <td align="center">
                                    <input type="checkbox" name="docids" value="<%#Eval("hy_deptid")%>">
                                </td>
                                <td align="center">
                                    <%#Eval("hy_deptname")%>&nbsp;
                                </td>
                               
                                <td align="center">
                                    <a href="#" onclick="window.location='OrgList.aspx?deptid=<%#Eval("hy_deptid")%>&rnd='+Math.random()+'&url='+window.location.href;">下属机构</a>
                                </td>
                                <td align="center">
                                    <a href="#" onclick="window.location='OrgMana.aspx?op=modify&docid=<%#Eval("hy_deptid")%>&rnd='+Math.random()+'&url='+window.location.href;">修改</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"6\">暂无记录</td></tr>" : ""%>
                        </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <!--列表展示.结束-->
                    <!--内容底部-->
                    <div class="line15">
                    </div>
                    <div class="pagelist">
                        <div class="l-btns m10">
                            <span>显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);"
                                OnTextChanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
                        </div>
                        <div class="l-btns m10">
                            <span>共<asp:Literal ID="lblcount" runat="server"></asp:Literal>记录</span>
                        </div>
                        <div id="PageContent" runat="server" class="default">
                        </div>
                    </div>
                    <!--/内容底部-->
                    <div class="line10">
                    </div>
                </td>
            </tr>
        </table>
        <div style="display: none;">
            是否有权限，1表示有权限，0表示没有权限：<input id="isrole" runat="server" />
            删除的IDS：<input id="txtuids" name="txtuids" runat="server" />
            删除：<asp:Button ID="btndelinfo" Text="删除" OnClick="btndelinfo_Click" runat="server" />
            当前URL（去除?page）<asp:TextBox ID="txturl" runat="server"></asp:TextBox>
            部门ID：<input id="txtdeptid" runat="server" value="" type="text" />
        </div>
    </form>
</body>
</html>
