<%@ Page Language="C#" AutoEventWireup="true" CodeFile="center.aspx.cs" Inherits="center" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>管理首页</title>
    <link href="images/index/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <div class="navigation nav_icon">
        你好，<i><asp:Label ID="lbluserinfo" runat="server"></asp:Label></i>，欢迎进入后台管理中心</div>
    <div class="line10">
    </div>
    <div class="nlist1">
        <ul>
            <li>本次登录IP：<asp:Literal ID="litIP" runat="server" Text="-" /></li>
            <li>上次登录IP：<asp:Literal ID="litBackIP" runat="server" Text="-" /></li>
            <li>上次登录时间：<asp:Literal ID="litBackTime" runat="server" Text="-" /></li>
        </ul>
    </div>
    <div class="line10">
    </div>
    <div class="nlist2 clearfix">
        <h2>
            站点信息</h2>
        <ul>
            <li>站点名称：<asp:Literal ID="webname" runat="server"></asp:Literal></li>
            <li>站点域名：<asp:Literal ID="weburl" runat="server"></asp:Literal></li>
            <li>技术支持：<asp:Literal ID="webcompany" runat="server"></asp:Literal></li>
            <li>服务器名称：<%=Server.MachineName%></li>
            <li>服务器IP：<%=Request.ServerVariables["LOCAL_ADDR"] %></li>
            <li>NET框架版本：<%=Environment.Version.ToString()%></li>
            <li>操作系统：<%=Environment.OSVersion.ToString()%></li>
            <li>IIS环境：<%=Request.ServerVariables["SERVER_SOFTWARE"]%></li>
            <li>服务器端口：<%=Request.ServerVariables["SERVER_PORT"]%></li>
            <li>目录物理路径：<%=Request.ServerVariables["APPL_PHYSICAL_PATH"]%></li>
            <li>数据库名：<asp:Literal ID="dbname" runat="server"></asp:Literal></li>
            <li>系统版本：<asp:Literal ID="versions" runat="server"></asp:Literal></li>
        </ul>
        <div class="line10">
        </div>
    </div>
    <div class="clear" style="height: 20px;">
    </div>
    </form>
</body>
</html>
