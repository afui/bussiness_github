<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_category.aspx.cs" Inherits="CategoryManage_list_category" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>类别管理</title>
    <link type="text/css" rel="stylesheet" href="../images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/pagination.css" />
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/ui/js/ligerBuild.min.js"></script>
    <script type="text/javascript" src="../images/index/js/function.js"></script>
    <script type="text/javascript">
    function sjlbInfo()
{
    //上级目录
    var mlid = document.getElementById("txtcid_url").value;
    if(mlid.length==4)
    {
        window.location = "list_category.aspx";
    }else{
        window.location = "list_category.aspx?cid=" + mlid.substring(0, mlid.length - 4) + "&rnd=" + Math.random();
    } 
}
    </script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <div id="pageloading" style="display: none;">
        数据提交中，请稍等...</div>
    <div class="navigation">
        首页 &gt; 类别管理 &gt; 类别列表</div>
    <div class="tools_box">
        <div class="tools_bar">
            <%--<div class="search_box">
                <asp:TextBox ID="txtKeywords" runat="server" CssClass="txtInput"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="搜 索" CssClass="btnSearch" OnClick="btnSearch_Click" />
            </div>--%>
            <a href="#" onclick="window.location='main_category.aspx?op=add&lastid='+document.getElementById('txtcid_url').value+'&rnd='+Math.random()+'&url='+window.location.href;"
                class="tools_btn" id="tdnewdoc" runat="server"><span><b class="add">添加类别</b></span></a>
            <a href="#" onclick="checkAll(this);" class="tools_btn"><span><b
                class="all">全选</b></span></a>
            <asp:LinkButton ID="btnDelete" runat="server" CssClass="tools_btn" OnClick="btnDelete_Click"
                OnClientClick="return ExePostBack('btnDelete','存在下级类别时，无法进行删除！是否确定要进行删除？');"><span><b class="delete">批量删除</b></span></asp:LinkButton>
            <a href="#" onclick="sjlbInfo();" class="tools_btn" id="fhsjlb" runat="server"><span><b
                class="all">上级类别</b></span></a>
        </div>
    </div>
    <!--列表展示.开始OnItemDataBound="rptList_ItemDataBound"-->
    <asp:Repeater ID="rptList" runat="server" >
        <HeaderTemplate>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                <tr>
                    <th width="6%">
                        选择
                    </th>
                    <th width="20%" align="center">
                        类别编号
                    </th>
                    <th align="left">
                        类别名称
                    </th>
                    <th align="left" width="10%">
                        排序
                    </th>
                    <th align="left" width="10%">
                        下级类别
                    </th>
                    <th width="12%">
                        修改
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td align="center">
                    <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" />
                    <asp:HiddenField ID="hidId" Value='<%#Eval("CID")%>' runat="server" />
                </td>
                <td  align="center">
                    <%#Eval("CID")%>
                </td>
                <td>
                    <%#Eval("hy_cname")%>
                </td>
                <td>
                    <%#Eval("hy_csort")%>
                </td>
                <td>
                    <a href="#" onclick="var ss='list_category.aspx?cid=<%# Eval("CID")%>&rnd='+Math.random();window.location=ss;">
                        下级类别</a>
                </td>
                <td align="center">
                    <a href="javascript:void(0);" onclick="window.location='main_category.aspx?op=modify&id=<%#Eval("CID")%>&rnd='+Math.random()+'&url='+window.location.href;">
                            修改</a>
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
            显示<asp:Label ID="txtPageNum" runat="server"></asp:Label>条/页，当前第<asp:Label ID="txtPage"
                runat="server"></asp:Label>页，打开第<asp:TextBox ID="txtGotoPage" runat="server" CssClass="txtInput2 small2"></asp:TextBox>页
            <asp:Button ID="btnGoto" runat="server" Text="GOTO" OnClick="btnGoto_Click" CssClass="but_color"
                OnClientClick="document.getElementById('pageloading').style.display='block';" />
        </div>
    </div>
    <div class="line10">
    </div>
    <div style="display: none">
        栏目编号：<asp:TextBox ID="txtcid" runat="server"></asp:TextBox>
        URL中传入的栏目编号：<asp:TextBox ID="txtcid_url" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>
