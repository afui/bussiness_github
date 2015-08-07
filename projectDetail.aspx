<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectDetail.aspx.cs" Inherits="projectDetail" %>

<%@ Register Src="include/top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="include/bottom.ascx" TagName="bottom" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会飞猪</title>
    <link rel="stylesheet" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.min.js"></script>
    <script type="text/javascript" src="Js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Js/jquery.kinMaxShow-1.1.min.js"></script>
    <script type="text/javascript" src="Js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Js/simpler-sidebar.js"></script>
    <link rel="stylesheet" href="Css/bootstrap.css" />
    <link rel="stylesheet" href="Css/font-awesome.min.css" />
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
    <script>
        function saveData() {
            if (document.getElementById('txtMessage').value != "") {
                document.getElementById('btn_save').click();
            } else {
                alert('请填写项目留言！');
            }
        }
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
                    <li><a href="#">网站首页</a></li>
                    <span>&nbsp;</span>
                    <li><a href="#" class="hover">项目融资</a></li>
                    <span>&nbsp;</span>
                    <li><a href="#">需求发布</a></li>
                    <span>&nbsp;</span>
                    <li><a href="#">服务商入住</a></li>
                    <span>&nbsp;</span>
                    <li><a href="#">创客资本</a></li>
                    <span>&nbsp;</span>
                    <li><a href="#">专家咨询</a></li>
                </ul>
            </div>
        </div>
        <!--分类-->
        <div class="Width100 Xiangm">
            <div class="Xiangm-left">
                <div class="Feng2">
                    <img src="Images/Img.jpg">
                    <span>昵称：极光HUD发明者</span>
                    <p>
                        城市：浙江省  宁波市<br>
                        能力标签：工业设计 产品设计 智能装备
                    </p>
                    <div class="cff1"><a href="#">联系TA</a></div>
                </div>
                <!--项目分类-->
            </div>
            <!--Xiangm-left-->
            <div class="Xiangm1-right">
                <asp:Label ID="lb_show" runat="server"></asp:Label>

                <div class="xixmly">
                    <div class="xmly_top">项目留言</div>
                    <textarea class="xmly_center" runat="server" id="txtMessage"></textarea>
                    <div class="xmly_bottom"><a href="javascript:void(0)" onclick="saveData()">发表留言</a></div>
                </div>
            </div>
            <!--Xiangm1-right-->
        </div>
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
        <div style="display: ">
            <asp:Button ID="btn_save" runat="server" Text="保存" OnClick="btn_save_Click" />
            <asp:TextBox ID="txtDocid" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
