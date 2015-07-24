<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectPublish.aspx.cs" Inherits="projectPublish" %>

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
    <%--编辑器start--%>
    <link rel="stylesheet" href="/editor/themes/default/default.css" />
    <link rel="stylesheet" href="/editor/plugins/code/prettify.css" />
    <script type="text/javascript" charset="utf-8" src="/editor/kindeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="/editor/plugins/code/prettify.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtdt_summary', {
                cssPath: '/editor/plugins/code/prettify.css',
                uploadJson: '/editor/upload_json.ashx',
                fileManagerJson: '/editor/file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtProjectDetail', {
                cssPath: '/editor/plugins/code/prettify.css',
                uploadJson: '/editor/upload_json.ashx',
                fileManagerJson: '/editor/file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
    <%--编辑器end--%>
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
        <div class="Width100 Issue">
            <div class="release">发布融资项目</div>
            <table width="750" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="40" align="right"><i>*</i>项目海报</td>
                    <td width="19"></td>
                    <td width="207" rowspan="3"><em>
                        <img src="images/Img.jpg"></em></td>
                    <td width="118" height="40"></td>
                    <td width="254" height="40"></td>
                </tr>
                <tr>
                    <td height="40"></td>
                    <td height="40"></td>
                    <td rowspan="2"><a href="#" class="publish">上传图片</a></td>
                    <td rowspan="2" valign="bottom">
                        <p>
                            海报尺寸：750*375像素<br>
                            文件小于2MB，支持gif,png,jpg,jepg格式
                        </p>
                    </td>
                </tr>
                <tr>
                    <td height="31"></td>
                    <td height="31"></td>
                </tr>
                <tr>
                    <td height="10" colspan="5"></td>
                </tr>
                <tr>
                    <td height="70" align="right"><i>*</i>项目名称</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" runat="server" id="txtName" class="put" />
                    </td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td height="70" align="right">项目网址</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" class="put" id="txtPath" runat="server" /></td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td height="70" align="right"><i>*</i>项目描述</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" class="put" id="txtDetail" runat="server" /></td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td height="70" align="right"><i>*</i>项目关键词</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" class="put" id="txtKeyWords" runat="server" /></td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td width="152" height="10"></td>
                    <td width="19" height="10"></td>
                    <td colspan="2" rowspan="2" valign="top">
                        <div class="out">
                            <ul>
                                <li>
                                    <input id="ck_net" type="checkbox" runat="server" value="互联网" /><span>互联网</span></li>
                                <li>
                                    <input id="ck_move" type="checkbox" runat="server" value="移动应用" /><span>移动应用</span></li>
                                <li>
                                    <input id="ck_medicene" type="checkbox" runat="server" value="生物医药" /><span>生物医药</span></li>
                                <li>
                                    <input id="ck_finance" type="checkbox" runat="server" value="金融服务" /><span>金融服务</span></li>
                                <li>
                                    <input id="ck_education" type="checkbox" runat="server" value="教育培训" /><span>教育培训</span></li>
                                <li>
                                    <input id="Checkbox5" type="checkbox" runat="server" value="智能装备" /><span>智能装备</span></li>
                                <li>
                                    <input id="Checkbox6" type="checkbox" runat="server" value="智能家居" /><span>智能家居</span></li>
                                <li>
                                    <input id="Checkbox7" type="checkbox" runat="server" value="环保能源" /><span>环保能源</span></li>
                                <li>
                                    <input id="Checkbox8" type="checkbox" runat="server" value="农林牧渔" /><span>农林牧渔</span></li>
                                <li>
                                    <input id="Checkbox9" type="checkbox" runat="server" value="其他" /><span>其他</span></li>
                            </ul>
                        </div>
                    </td>
                    <td rowspan="2"></td>
                </tr>
                <tr>
                    <td height="144" align="right" valign="top"><i>*</i>行业分类</td>
                    <td width="19"></td>
                </tr>
                <tr>
                    <td height="239" align="right" valign="top"><i>*</i>项目详情</td>
                    <td width="19"></td>
                    <td height="239" colspan="2" valign="top">
                        <div style="width: 319px; height: 222px; border-radius: 3px;">
                            <textarea id="txtProjectDetail" cols="100" rows="8" style="width: 300px; height: 250px; visibility: hidden;"></textarea>
                        </div>
                    </td>
                    <td height="239"></td>
                </tr>
                <tr>
                    <td height="70" align="right">预设融资金额</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" runat="server" id="txtAmount" class="put1" />;万元</td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td height="70" align="right"><i>*</i>手机号码</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" id="txtPhone" runat="server" class="put" /></td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td height="70" align="right"><i>*</i>邮箱</td>
                    <td width="19"></td>
                    <td height="70" colspan="2">
                        <input type="text" id="txtEmail" runat="server" class="put" /></td>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td height="57" align="right"><i>*</i>项目商业计划书</td>
                    <td width="19"></td>
                    <td height="57" colspan="3" valign="bottom"><a href="#" class="publish" style="margin: 0 10px 0 0">上传文件</a><p>
                        文件小于15M
                    </p>
                    </td>
                </tr>
                <tr>
                    <td height="80" align="right"><i>*</i>项目路演视频</td>
                    <td width="19"></td>
                    <td height="80" colspan="2">
                        <input type="text" class="put2" id="txtMoviePath" runat="server" placeholder="输入视频链接网址" /></td>
                    <td height="80"></td>
                </tr>
                <tr>
                    <td height="10" colspan="5"></td>
                </tr>
                <tr>
                    <td height="230" align="right" valign="top"><i>*</i>团队介绍</td>
                    <td width="19"></td>
                    <td height="230" colspan="2" valign="top">
                        <div style="width: 319px; height: 222px; border-radius: 3px;">
                            <textarea id="txtdt_summary" cols="100" rows="8" style="width: 300px; height: 200px; visibility: hidden;"
                                runat="server"></textarea>
                        </div>
                    </td>
                    <td height="230"></td>
                </tr>
                <tr>
                    <td height="70" colspan="5"><a href="#" class="publish1">发布项目</a></td>
                </tr>
            </table>
            <!--release-->
        </div>
        <!--网站底部-->
        <uc2:bottom ID="bottom2" runat="server" />
    </form>
</body>
</html>
