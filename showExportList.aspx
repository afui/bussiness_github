﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showExportList.aspx.cs" Inherits="showExportList" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会飞猪</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="js/simpler-sidebar.js"></script>
    <link rel="stylesheet" href="Css/bootstrap.css" />
    <link rel="stylesheet" href="Css/font-awesome.min.css" />
    <link rel="stylesheet" href="Css/style.css" />
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
</head>
<body>
    <form id="form1" runat="server">
        <!--头部-->
        <uc1:top ID="top1" runat="server" />
        <!--菜单-->
        <div class="Maun">
            <div class="Width100">
                <ul>
                    <li><a href="#" class="hover">专家咨询</a></li>
                    register<span>&nbsp;</span>
                    <li><a href="#">问题总汇</a></li>
                </ul>
            </div>
        </div>

        <!--分类-->
        <div class="Width100 MarginT20 Classification">
            <ul>
                <li><b>行业领域：</b><a href="#" class="hover">全部</a><a href="#">品牌建设</a><a href="#">营销策划</a><a href="#">工业设计</a><a href="#">法律咨询</a><a href="#">知识产权</a><a href="#">生产管理</a><a href="#">原材料</a></li>
            </ul>
        </div>

        <!--内容-->
        <div class="Width100 factory_li1">
            <asp:Label ID="lb_show" runat="server"></asp:Label>
        </div>

        <!--分页-->
        <div class="Width100 Pagle">
            <ul class="pagination pagination-sm">
                <%-- <li class="disabled">
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>--%>
            </ul>
        </div>
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>