<%@ Page Language="C#" AutoEventWireup="true" CodeFile="serverCompany.aspx.cs" Inherits="serverCompany" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会飞猪</title>
    <script type="text/javascript" src="Js/jquery.min.js"></script>
    <script type="text/javascript" src="Js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="Js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Js/simpler-sidebar.js"></script>
    <link rel="stylesheet" href="Css/bootstrap.css" />
    <link rel="stylesheet" href="Css/font-awesome.min.css" />
    <link rel="stylesheet" href="Css/style.css" />
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
</head>
<body>
    <body>
        <form id="form1" runat="server">
            <!--头部-->
            <uc1:top ID="top1" runat="server" />
            <!--菜单-->
            <div class="Maun">
                <div class="Width100">
                    <ul>
                        <li><a href="#">所有服务商</a></li>
                        register<span>&nbsp;</span>
                        <li><a href="#" class="hover">创客工厂</a></li>
                    </ul>
                </div>
            </div>

            <!--分类-->
            <div class="Width100 MarginT20 Classification">
                <ul>
                    <li><b>行业分类：</b><a href="#" class="hover">全部</a><a href="#">汽车</a><a href="#">纺织服装</a><a href="#">家电</a><a href="#">工程</a><a href="#">机械</a><a href="#">装备制造</a><a href="#">原材料</a><a href="#">交通运输设备</a><a href="#">绿色工业</a><a href="#">通信电子设备</a><a href="#">家居装饰</a></li>
                    <li><b>地区选择：</b><a href="#" class="hover">全部</a><a href="#">北京</a><a href="#">上海</a><a href="#">浙江</a><a href="#">广东</a><a href="#">江苏</a><a href="#">四川</a><a href="#">重庆</a></li>
                </ul>
            </div>

            <!--内容-->
            <div class="Width100 factory_li">
                <ul>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                    <li><a href="#">
                        <img src="Images/Img.jpg">华贸生物科技有限公司<br>
                        河南 > 郑州<br>
                        行业：生物医药、原材料</a></li>
                </ul>
            </div>

            <!--分页-->
            <div class="Width100 Pagle">
                <ul class="pagination pagination-sm">
                    <li class="disabled">
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
                    </li>
                </ul>
            </div>
            <!--网站底部-->
            <uc2:bottom ID="bottom2" runat="server" />
        </form>
    </body>
</html>
