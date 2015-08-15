<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allDemand.aspx.cs" Inherits="allDemand" %>

<%@ Register TagPrefix="uc1" TagName="top" Src="~/include/top.ascx" %>
<%@ Register TagPrefix="uc2" TagName="bottom" Src="~/include/bottom.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会飞猪</title>
    <script type="text/javascript" src="Js/jquery.min.js"></script>
    <script type="text/javascript" src="Js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="Js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Js/simpler-sidebar.js"></script>
    <script src="js/slimpage.js"></script>
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
    <form id="form1" runat="server">
        <!--头部-->
        <uc1:top ID="top1" runat="server" />
        <!--分类-->
        <div class="Width100 MarginT20 Classification">
            <ul>
                <li><b>任务分类：</b><a href="#" class="hover">全部</a><a href="#">标志设计</a><a href="#"> VI设计</a><a href="#">家电</a><a href="#">包装设计</a><a href="#">策划</a><a href="#">装备制造</a><a href="#">品牌服务</a><a href="#">工业设计</a><a href="#">APP开发</a></li>
                <li><b>赏金分配：</b><a href="#" class="hover">全部</a><a href="#">单人悬赏</a><a href="#">多人悬赏</a><a href="#">计件任务</a><a href="#">招标任务</a><a href="#">雇佣任务 </a></li>
                <li><b>赏金状态：</b><a href="#" class="hover">全部</a><a href="#">已托管赏金</a><a href="#">未托管赏金</a><a href="#">暂未定价</a></li>
                <li><b>赏金状态：</b><a href="#" class="hover">全部</a><a href="#">加急</a><a href="#">今日发布</a><a href="#">昨日发布</a><a href="#">近3天发布</a><a href="#">24小时内到期</a><a href="#"> 2天内到期</a><a href="#">3天内到期</a></li>
            </ul>
        </div>

        <!--内容-->

        <div class="Width100">

            <div class="Xuqiu-left">
                <div class="xuq_top">
                    <a href="#" class="ah"><span>综合</span></a>
                    <a href="#"><span>发布时间</span></a>
                    <a href="#"><span>剩余时间</span></a>
                    <a href="#"><span>投稿数</span></a>
                    <i>赏金</i>
                    <div class="dd">
                        <div class="rs"><a href="#"><b></b></a></div>
                        <div class="rs1"><a href="#"><b></b></a></div>
                    </div>
                    <i>
                        <input type="text" class="input"><div class="dd1"></div>
                        <input type="text" class="input" style="margin-left: 10px;"></i>
                </div>

                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>
                <div class="xuq_bottom">
                    <table width="750" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="122" height="52"><span>¥ 1500</span></td>
                            <td width="366"><i>人人秀Logo设计</i><br>
                                <em>1025人浏览　25人投标</em></td>
                            <td width="126" height="52">单人悬赏 </td>
                            <td width="136" height="52">5天22小时后截止</td>
                        </tr>
                    </table>
                </div>

            </div>
            <!--Xuqiu-left-->

            <div class="Xuqiu-right">
                <div class="inu_top">
                    <span>快速发布需求任务</span>
                    <i>需求标题</i>
                    <input name="" type="text" class="input11" placeholder="如：xx公司Logo设计">
                    <i>需求分类</i>
                    <select name="">
                        <option>选择服务分类</option>
                    </select>
                    <select name="">
                        <option>选择服务子分类</option>
                    </select>
                    <i>需求描述</i>
                    <textarea></textarea>
                    <input name="" type="text" class="ff11" placeholder="验证码"><img src="Images/Img.jpg">
                    <div class="cff2"><a href="#">发布项目</a></div>
                </div>
                <div class="Feng3">
                    <div class="Fen_top3">热门标签</div>
                    <div class="Fen_Bottom3">
                        <ul>
                            <li>
                                <img src="Images/Img.jpg"><span>邦俊教育Logo设计</span><br>
                                <i>¥ 2000</i></li>
                            <li>
                                <img src="Images/Img.jpg"><span>邦俊教育Logo设计</span><br>
                                <i>¥ 2000</i></li>
                            <li>
                                <img src="Images/Img.jpg"><span>邦俊教育Logo设计</span><br>
                                <i>¥ 2000</i></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!--Width100-->

        <asp:Label ID="lb_page" runat="server" ></asp:Label>
        <div class="Pagle" style="margin-left: 210px;">
                        <span aria-hidden="true" id="page"></span>
        </div>
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>
