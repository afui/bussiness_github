<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_log.aspx.cs" Inherits="SysManage_list_log" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>系统日志</title>
    <link type="text/css" rel="stylesheet" href="../images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/pagination.css" />
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/ui/js/ligerBuild.min.js"></script>
    <script type="text/javascript" src="../images/index/js/function.js"></script>
    <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <div class="navigation">
        首页 &gt; 系统管理 &gt; 系统日志</div>
    <div class="tools_box">
        <div class="tools_bar">
            <div class="search_box">
                <asp:TextBox ID="txtdate_s" runat="server" CssClass="txtInput" onclick="WdatePicker({startDate:'%y-%M-%d 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"></asp:TextBox>至<asp:TextBox
                    ID="txtdate_e" runat="server" CssClass="txtInput" onclick="WdatePicker({startDate:'%y-%M-%d 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="搜 索" CssClass="btnSearch" OnClick="btnSearch_Click" />
            </div>
            <a href="javascript:void(0);" onclick="checkAll(this);" class="tools_btn"><span><b
                class="all">全选</b></span></a>
            <asp:LinkButton ID="btnDelete" runat="server" CssClass="tools_btn" OnClick="btnDelete_Click"
                OnClientClick="return ExePostBack('btnDelete','是否确定要进行删除？');"><span><b class="delete">批量删除</b></span></asp:LinkButton>
        </div>
    </div>
    <!--列表展示.开始-->
    <asp:Repeater ID="rptList" runat="server">
        <HeaderTemplate>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                <tr>
                    <th width="6%">
                        选择
                    </th>
                    <th width="15%">
                        操作时间
                    </th>
                    <th width="12%">
                        操作人员
                    </th>
                    <th width="12%">
                        IP
                    </th>
                    <th width="12%">
                        操作类型
                    </th>
                    <th align="left">
                        操作内容
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td align="center">
                    <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" />
                    <asp:HiddenField ID="hidId" Value='<%#Eval("ID")%>' runat="server" />
                </td>
                <td align="center">
                    <%#Eval("hy_createtime").ToString()%>
                </td>
                <td align="center">
                    <%#Eval("hy_oppusername")%>
                </td>
                <td align="center">
                    <%#Eval("hy_oppip")%>
                </td>
                <td align="center">
                    <%#Eval("hy_opptype")%>
                </td>
                <td>
                    <%#Eval("hy_oppcontent")%>
                </td>
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
    <div class="page_box">
        <div id="PageContent" runat="server" class="flickr right">
        </div>
        <div class="left">
            显示<asp:TextBox ID="txtPageNum" runat="server" CssClass="txtInput2 small2" ReadOnly="true"></asp:TextBox>条/页
            <div style="display: none">
                当前第<asp:TextBox ID="txtPage" runat="server" CssClass="txtInput2 small2" ReadOnly="true"></asp:TextBox>页</div>
        </div>
    </div>
    <div class="line10">
    </div>
    </form>
</body>
</html>
