<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectList.aspx.cs" Inherits="projectList" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会飞猪</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="js/simpler-sidebar.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/style.css" />
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
        <div class="Width100 Xiangm">

            <div class="Xiangm-left">

                <div class="Fengl">
                    <div class="Fen_top">项目分类</div>
                    <div class="Fen_Bottom">
                        <table width="200" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="89" height="30">互联网+</td>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="91" height="30">移动应用</td>
                            </tr>
                            <tr>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="89" height="30">金融服务</td>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="91" height="30">教育培训</td>
                            </tr>
                            <tr>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="89" height="30">智能家居</td>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="91" height="30">环保能源</td>
                            </tr>
                            <tr>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="89" height="30">生物医药</td>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="91" height="30">智能装备</td>
                            </tr>
                            <tr>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="89" height="30">农林牧渔</td>
                                <td width="20" height="30">
                                    <input type="checkbox"></td>
                                <td width="91" height="30">其他</td>
                            </tr>
                            <tr>
                                <td height="22" colspan="4"></td>
                            </tr>
                            <tr>
                                <td height="30" colspan="4">
                                    <div class="cff"><a href="projectPublish.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">发布项目</a></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--项目分类-->

                <div class="Fengl">
                    <div class="Fen_top">热门标签</div>
                    <div class="Fen_Bottom1">
                        <a href="#">O2O</a>
                        <a href="#">电子商务</a>
                        <a href="#">3D打印</a>
                    </div>
                </div>
                <!--热门标签-->

                <div class="Fengl Fjl">
                    <div class="Fen_top">热门项目</div>
                    <div class="Fen_Bottom2">
                        <a href="#">
                            <img src="Images/Img.jpg"><span>极光HUD智能抬头显示器</span></a>
                        <a href="#">
                            <img src="Images/Img.jpg"><span>极光HUD智能抬头显示器</span></a>
                        <a href="#" style="background: none">
                            <img src="Images/Img.jpg"><span>极光HUD智能抬头显示器</span></a>
                    </div>
                </div>
                <!--热门项目-->



            </div>
            <!--Xiangm-left-->

            <div class="Xiangm-right">
                <ul>
                    <asp:Label ID="lb_show" runat="server" ></asp:Label>
                </ul>
            </div>
            <!--Xiangm-right-->

        </div>

        <!--分页-->
        <div class="Pagle" style="margin-left: -245px;">
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
