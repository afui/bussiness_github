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
            } else {
                document.getElementById('top1_btn_save').click();
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
    //更改验证码
    function showimg(im) {
        im.src = "../iportal/ggdy/ValidateImg.aspx?" + new Date;
    }

    function loginOut() {
        document.getElementById('top1_btn_loginOut').click();
    }
    function closeTip() {
        document.getElementById('close').click();
    }
</script>
<div class="Top Width100">
    <div class="pull-left">
        <button id="close" ></button>
        <a href="javascript:void(0)">
            <img src="../images/Logo.png"></a>
    </div>
    <div class="pull-right">
        <asp:Label ID="lb_showLogin" runat="server"></asp:Label>
        <div class="T_search">
            <input type="text" placeholder="搜索项目、服务、找人">
            <button onclick="saveDataSuccess()"><i class="icon-search"></i>搜索</button>
        </div>
    </div>
</div>
<div id="dowebok">
    <div class="Logo_User">
        <strong><b>会员登录</b><a href="javascript:void(0)" onclick="closeTip();"></a></strong>
        <ul>
            <li>邮箱/手机号码<input type="text" runat="server" id="txtUid" class="form-control input-sm" placeholder="请输入帐号" /></li>
            <li>密码<input type="password" id="txtLogPwd" runat="server" class="form-control input-sm" placeholder="请输入密码" /></li>
            <li>验证码
                <input id="txtCheckCode" value="" class="form-control input-sm" runat="server" placeholder="请输入验证码" />
            </li>
            <li>
                <img id="ValidateImg" style="width: 30%" src="../iportal/ggdy/ValidateImg.aspx" onclick="showimg(this);" style="cursor: pointer;" alt="看不清楚?换一张" />
            </li>
            <li>账户类型&nbsp;&nbsp;<select id="st_type" class="form-control input-sm" runat="server"><option selected="selected" value="1">个人/创客</option>
                <option value="2">投资人</option>
                <option value="3">企业</option>
            </select></li>
            <li>
                <label>
                    <input type="checkbox">
                    保持在线状态</label><a href="javascript:void(0)">忘记密码？</a></li>
            <li>
                <asp:Button ID="btn_login" CssClass="btn btn-warning btn-block" runat="server" Text="立即登录" OnClick="btn_login_Click" />
            </li>
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
        <strong><b>会员注册</b>
            <button class="close-sidebar">111</button></strong>
        <ul>
            <li>
                <input checked="True" id="ck_personal" name="type" value="1" runat="server" type="radio" class="input_checkbox" />&nbsp;&nbsp;个人/创客</li>
            <li>
                <input type="radio" id="ck_investor" name="type" value="2" runat="server" class="input_checkbox" />&nbsp;&nbsp;投资人</li>
            <li>
                <input type="radio" id="ck_enterprise" name="type" value="3" runat="server" class="input_checkbox" />&nbsp;&nbsp;企业</li>
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
            <li>密码<input type="password" id="txtPwd" class="form-control input-sm" runat="server" placeholder="请输入密码" /></li>
            <li>确认密码<input type="password" id="txtConfirePwd" runat="server" class="form-control input-sm" placeholder="再次确认密码" /></li>
            <li>昵称<input type="text" id="txtName" runat="server" class="form-control input-sm" placeholder="设置昵称" /></li>
            <li style="margin-top: 18px;">
                <a href="javascript:void(0)" onclick="saveData()" class="btn btn-warning btn-block">同意条款并注册</a>
            </li>
            <li style="text-align: center;"><a href="javascript:void(0)" style="float: none;">《创客平台服务条款》</a></li>
            <li style="text-align: left;">已有创客账号，立即 <a href="javascript:void(0)" id="not_login" style="float: none;">登录</a></li>
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
<div id="userShow">
    <div class="User_Reg">
        <strong><b>我的资料</b><a href="javascript:void(0)" class="close-sidebar"></a></strong>
        <ul>
            <li>昵称
                <asp:Label ID="lb_name" CssClass="form-control input-sm" runat="server"></asp:Label>
            </li>
            <li>邮箱<asp:Label ID="lb_email" CssClass="form-control input-sm" runat="server"></asp:Label></li>
            <li>账户类型<asp:Label ID="lb_type" CssClass="form-control input-sm" runat="server"></asp:Label></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $('#userShow').simplerSidebar({
            opener: '#User',
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
    <asp:Button ID="btn_save" CssClass="btn btn-warning btn-block" runat="server" Text="同意条款并注册" OnClick="btn_save_Click" />
    <input id="checkType" runat="server" />
    <asp:Button ID="btn_loginOut" runat="server" Text="注销" OnClick="btn_loginOut_Click" />
</div>


