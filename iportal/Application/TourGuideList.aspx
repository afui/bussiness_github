<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TourGuideList.aspx.cs" Inherits="TourGuideList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>导游管理</title>
    <link href="../../css/css-cn.css" rel="stylesheet" />
    <link href="../css/pagination.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script type="text/javascript" language="javascript" src="../../js/HomeBookMark.js"></script>
    <script src="../artDialog/jquery-1.10.2.js"></script>
    <script src="../artDialog/dialog-min.js"></script>
    <link href="../artDialog/ui-dialog.css" rel="stylesheet" />
    <script type="text/javascript">
        function tip(prompt, path) {
            var d = dialog({
                content: prompt,
                cancel: false,
                ok: function () {
                    window.location = path;
                }
            });
            d.show();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            &nbsp;首页 &gt; 旅游质监模块 &gt; 导游管理
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
            <tr>
                <td>
                    <!--按钮开始-->
                    <div class="tools_box">
                        <div class="tools_bar">
                            <div class="search_box">
                                姓名：<asp:TextBox ID="txtName" runat="server" CssClass="txtInput"></asp:TextBox>
                                性别:<asp:DropDownList CssClass="txtInput" ID="ddl_sex" runat="server">
                                    <asp:ListItem>全部</asp:ListItem>
                                    <asp:ListItem Value="男">男</asp:ListItem>
                                    <asp:ListItem Value="女">女</asp:ListItem>
                                </asp:DropDownList>
                                等级：<asp:DropDownList CssClass="txtInput" ID="ddl_grade" runat="server">
                                    <asp:ListItem>全部</asp:ListItem>
                                    <asp:ListItem Value="初级">初级</asp:ListItem>
                                    <asp:ListItem Value="中级">中级</asp:ListItem>
                                    <asp:ListItem Value="高级">高级</asp:ListItem>
                                </asp:DropDownList>
                                性质：<asp:DropDownList CssClass="txtInput" ID="ddl_properties" runat="server">
                                    <asp:ListItem>全部</asp:ListItem>
                                    <asp:ListItem Value="专职">专职</asp:ListItem>
                                    <asp:ListItem Value="兼职">兼职</asp:ListItem>
                                </asp:DropDownList>
                                推荐：<asp:DropDownList CssClass="txtInput" ID="ddl_recommend" runat="server">
                                    <asp:ListItem>全部</asp:ListItem>
                                    <asp:ListItem Value="推荐">推荐</asp:ListItem>
                                    <asp:ListItem Value="不推荐">不推荐</asp:ListItem>
                                </asp:DropDownList>
                                身份证：<asp:TextBox CssClass="txtInput" ID="txt_nonumber" runat="server"></asp:TextBox>
                                导游证：<asp:TextBox CssClass="txtInput" ID="txttx_guideNo" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="搜 索" CssClass="btnSearch" OnClick="btnSearch_Click" />
                            </div>
                            <a href="javascript:void(0);" onclick="window.location='TourGuideEdit.aspx?op=add&rnd='+Math.random()+'&url='+window.location.href;"
                                class="tools_btn" id="tdnewdoc" runat="server"><span><b class="add">添加</b></span></a>
                            <a href="javascript:void(0);" onclick="DelInfo();" class="tools_btn"
                                id="tddeldoc" runat="server"><span><b class="delete">删 除</b></span></a>
                        </div>
                    </div>
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
                                    <th width="5%" align="center">姓名
                                    </th>
                                    <th width="10%" align="center">导游证号
                                    </th>
                                    <th align="center" width="20%">旅行社简称
                                    </th>
                                    <th align="center" width="10%">工作性质
                                    </th>
                                    <th width="5%" align="center">学历
                                    </th>
                                    <th width="10%" align="center">联系电话
                                    </th>
                                    <th width="10%" align="center">年审日期
                                    </th>
                                    <th width="10%" align="center">发卡日期
                                    </th>
                                    <th width="10%" align="center">是否推荐
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="22" onmouseover="this.className='tr_over'" onmouseout="this.className='tr_out'">
                                <a href="TourGuideEdit.aspx?op=modify&docid=<%#Eval("id")%>">
                                    <td align="center" widtd="5%"><%# (page - 1) * pageSize + Container.ItemIndex + 1%>
                                    </td>
                                    <td align="center" widtd="5%">
                                        <input type="checkbox" name="docids" value="<%#Eval("id")%>" />
                                    </td>
                                    <td widtd="5%" align="center"><%#Eval("Name") %>
                                    </td>
                                    <td widtd="10%" align="center"><%#Eval("CardID") %>
                                    </td>
                                    <td align="center" widtd="25%"><%#Eval("TravelAgencyName") %>
                                    </td>
                                    <td align="center" widtd="10%"><%#Eval("NatureOfWork") %>
                                    </td>
                                    <td widtd="5%" align="center"><%#Eval("Degree") %>
                                    </td>
                                    <td widtd="10%" align="center"><%#Eval("tel") %>
                                    </td>
                                    <td widtd="10%" align="center"><%#Eval("YearAuditDate","{0:yyyy-MM-dd}") %>
                                    </td>
                                    <td widtd="10%" align="center"><%#Eval("HairpinDate","{0:yyyy-MM-dd}") %>
                                    </td>
                                    <td widtd="10%" align="center"><%#Eval("rep1") %>
                                    </td>
                                </a>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"6\">暂无记录</td></tr>" : ""%>
            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <!--列表展示.结束-->
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
            删除的IDS：<input id="txtuids" name="txtuids" runat="server" />
            <asp:TextBox ID="txtPage" runat="server"></asp:TextBox>
            删除：<asp:Button ID="btndelinfo" Text="删除" OnClick="btndelinfo_Click" runat="server" />
        </div>
    </form>
</body>
</html>
