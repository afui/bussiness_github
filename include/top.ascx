<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="include_top" %>
<script src="../artDialog/dialog-min.js"></script>
<link href="../artDialog/ui-dialog.css" rel="stylesheet" />

<script type="text/javascript">
    function emailCheck(strObj) {
        var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (!pattern.test(strObj)) {
            tip("请输入正确的邮箱地址！");
            document.getElementById('top1_txtEmail').focus();
            return false;
        }
        return true;
    }
    function saveData() {
        if (emailCheck(document.getElementById('top1_txtEmail').value)) {
            if (document.getElementById('top1_txtPwd').value != document.getElementById('top1_txtConfirePwd').value) {
                tip("两次输入的密码不一致！");
                document.getElementById('top1_txtPwd').value = "";
                document.getElementById('top1_txtConfirePwd').value = "";
                document.getElementById('top1_txtPwd').focus();
                return;
            }
        }
    }
    function tip(prompt) {
        var d = dialog({
            title: '提示',
            content: prompt
        });
        d.show();
    }
    function saveDataSuccess() {
        document.getElementById('region_2').style.display = 'none';
        document.getElementById('region_1').style.display = 'none';
        document.getElementById('dowebok').style.display = 'none';
        tip("保存成功！");
    }
</script>
<div class="Top Width100">
    <div class="pull-left">
        <a href="#">
            <img src="../images/Logo.png"></a>
    </div>
    <div class="pull-right">
        <a href="javascript:void(0)" class="Logo" id="User_Register">注册</a>
        <a href="javascript:void(0)" class="Rion" id="User_Login">登录</a>
        <div class="T_search">
            <input type="text" placeholder="搜索项目、服务、找人">
            <button onclick="saveDataSuccess()"><i class="icon-search"></i>搜索</button>
        </div>
    </div>
</div>
<div id="dowebok">
    <div class="Logo_User">
        <strong><b>会员登录</b><a href="javascript:void(0)" class="close-sidebar"></a></strong>
        <ul>
            <li>邮箱/手机号码<input type="text" class="form-control input-sm" placeholder="请输入帐号"></li>
            <li>密码<input type="text" class="form-control input-sm" placeholder="请输入密码"></li>
            <li>
                <label>
                    <input type="checkbox">
                    保持在线状态</label><a href="#">忘记密码？</a></li>
            <li>
                <button class="btn btn-warning btn-block">立即登录</button></li>
            <li style="text-align: center;"><a href="#" id="not_register" style="float: none;">还没有注册，点击注册。</a></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $('#dowebok').simplerSidebar({
            opener: '#User_Login',
            sidebar: {
                align: 'right',
                width: 300,
                closingLinks: '.close-sidebar'
            }
        });
    });
    $(function () {
        $('#region_1').simplerSidebar({
            opener: '#not_register',
            sidebar: {
                align: 'right',
                width: 300,
                closingLinks: '.close-sidebar'
            }
        });
    });
</script>
<!--会员注册 注册类型选择-->
<div id="region_1">
    <div class="User_Reg">
        <strong><b>会员注册</b><a href="#" class="close-sidebar"></a></strong>
        <ul>
            <li>
                <input checked="checked" id="personal" name="type" value="1" type="radio" class="input_checkbox">&nbsp;&nbsp;个人/创客</li>
            <li>
                <input type="radio" id="investor" name="type" value="2" class="input_checkbox">&nbsp;&nbsp;投资人</li>
            <li>
                <input type="radio" id="enterprise" name="type" value="3" class="input_checkbox">&nbsp;&nbsp;企业</li>
            <li><a href="javascript:void(0)" class="Quest Quest2" id="next_2">下一步</a></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $('#region_1').simplerSidebar({
            opener: '#User_Register',
            sidebar: {
                align: 'right',
                width: 300,
                closingLinks: '.close-sidebar'
            }
        });
    });
</script>
<!--会员注册 填写注册信息-->
<div id="region_2">
    <div class="User_Reg">
        <strong><b>会员注册</b><a href="#" class="close-sidebar"></a></strong>
        <ul>
            <li>邮箱<input type="text" id="txtEmail" class="form-control input-sm" runat="server" placeholder="请输入帐号" /></li>
            <li>密码<input type="text" id="txtPwd" class="form-control input-sm" runat="server" placeholder="请输入密码" /></li>
            <li>确认密码<input type="text" id="txtConfirePwd" runat="server" class="form-control input-sm" placeholder="再次确认密码" /></li>
            <li>昵称<input type="text" id="txtName" runat="server" class="form-control input-sm" placeholder="设置昵称" /></li>
            <li style="margin-top: 18px;">
                <asp:Button ID="btn_save" CssClass="btn btn-warning btn-block" runat="server" Text="同意条款并注册" OnClick="btn_save_Click" />
            </li>
            <li style="text-align: center;"><a href="#" style="float: none;">《创客平台服务条款》</a></li>
            <li style="text-align: left;">已有创客账号，立即 <a href="#" id="not_login" style="float: none;">登录</a></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $('#region_2').simplerSidebar({
            opener: '#next_2',
            sidebar: {
                align: 'right',
                width: 300,
                closingLinks: '.close-sidebar'
            }
        });
    });
</script>
<!--菜单-->
<div class="Maun">
    <div class="Width100">
        <ul>
            <li><a href="index.aspx?rend=<%=System.Guid.NewGuid().ToString() %>" class="hover">网站首页</a></li>
            <span>&nbsp;</span>
            <li><a target="_balank" href="projectList.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">项目融资</a></li>
            <span>&nbsp;</span>
            <li><a href="demandPublish.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">需求发布</a></li>
            <span>&nbsp;</span>
            <li><a href="serverCompany.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">服务商入住</a></li>
            <span>&nbsp;</span>
            <li><a href="#">创客资本</a></li>
            <span>&nbsp;</span>
            <li><a target="_balank" href="showExportList.aspx?rend=<%=System.Guid.NewGuid().ToString() %>>">专家咨询</a></li>
        </ul>
    </div>
</div>
<div style="display: none">
    <input id="checkType" runat="server" />
</div>
