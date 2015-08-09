<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会飞猪</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="js/simpler-sidebar.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
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
    <form id="form1" runat="server">
        <!--头部-->
        <uc1:top ID="top1" runat="server" />
        <!--广告条-->
        <div class="Banner">
            <div id="kinMaxShow">
                <div>
                    <img src="Images/Banner1.jpg" />
                </div>
                <div>
                    <img src="images/Banner2.jpg" />
                </div>
            </div>
        </div>
        <!--项目融资-->
        <div class="Width100 MarginT10">
            <div class="Tatle"><b>项目融资</b><a href="#">浏览更多></a></div>
            <div class="Financing">
                <div class="bd">
                    <a class="prev"></a>
                    <a class="next"></a>
                    <ul>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                        <li><a href="#">
                            <img src="images/img.jpg" /><div class="title">开车不低头 智能车载抬头显示器——极光HUD</div>
                        </a></li>
                    </ul>
                </div>
                <script type="text/javascript">
                    jQuery(".Financing").slide({ mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, vis: 4, trigger: "click" });
                </script>
            </div>
        </div>

        <!--需求热点-->
        <div class="Width100">
            <div class="Tatle"><b>需求热点</b><a href="#">更多需求></a></div>
            <div class="Demand">
                <ul>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                    <li><b>¥1500.00</b><a href="#">【新手必做】13000元！急！快！推</a><span>推荐精品任务发布 321投标</span></li>
                </ul>
            </div>
        </div>


        <!--4个服务项目介绍-->
        <div class="Project MarginT20">
            <div class="Width100">
                <ul>
                    <li>1</li>
                    <li class="Tow">2</li>
                    <li class="Wth">3</li>
                    <li class="For">4</li>
                </ul>
            </div>
        </div>

        <!--服务商-->
        <div class="Width100 MarginT10">
            <div class="Tatle"><b>服务商</b><a href="#">更多服务商></a></div>
            <div class="Service">
                <ul>
                    <li><a href="#">
                        <img src="images/img.jpg" />甲骨映画 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />济南琨睿品牌策划有限公司 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />麦度卡通品牌设计 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />兰古设计 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />甲骨映画 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />济南琨睿品牌策划有限公司 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />麦度卡通品牌设计 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />兰古设计 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />甲骨映画 </a></li>
                    <li><a href="#">
                        <img src="images/img.jpg" />济南琨睿品牌策划有限公司 </a></li>
                </ul>
            </div>
        </div>

        <!--专家咨询-->
        <div class="Width100 MarginT10">
            <div class="Tatle"><b>专家咨询</b><a target="_blank" href="showExportList.aspx?ren=<%=System.Guid.NewGuid().ToString() %>">更多专家></a></div>
            <div class="Expert">
                <div class="bd">
                    <a class="prev"></a>
                    <a class="next"></a>
                    <ul>
                        <%=getExport() %>
                    </ul>
                </div>
                <script type="text/javascript">
                    jQuery(".Expert").slide({ mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, vis: 4, trigger: "click" });
                </script>
            </div>
        </div>
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>
