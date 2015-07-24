<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="include_top" %>
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
            <button><i class="icon-search"></i>搜索</button>
        </div>
    </div>
</div>
<div id="dowebok">
    <div class="Logo_User">
        <strong><b>会员登录</b><a href="#"></a></strong>
        <ul>
            <li>邮箱/手机号码<input type="text" class="form-control input-sm" placeholder="请输入帐号"></li>
            <li>密码<input type="text" class="form-control input-sm" placeholder="请输入密码"></li>
            <li>
                <label>
                    <input type="checkbox">
                    保持在线状态</label><a href="#">忘记密码？</a></li>
            <li>
                <button class="btn btn-warning btn-block">立即登录</button></li>
            <li style="text-align: center;"><a href="#" style="float: none;">还没有注册，点击注册。</a></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $('#dowebok').simplerSidebar({
            opener: '#User_Login',
            sidebar: {
                align: 'right',
                width: 300
            }
        });
    });
</script>

<div id="dowebokR">
    <div class="User_Reg">
        <strong><b>会员注册</b><a href="#"></a></strong>
        <ul>
            <li>邮箱/手机号码<input type="text" class="form-control input-sm" placeholder="请输入帐号"></li>
            <li>密码<input type="text" class="form-control input-sm" placeholder="请输入密码"></li>
            <li>确认密码<input type="text" class="form-control input-sm" placeholder="再次确认密码"></li>
            <li>昵称<input type="text" class="form-control input-sm" placeholder="设置昵称"></li>
            <li style="margin-top: 18px;">
                <button class="btn btn-warning btn-block">同意条款并注册</button></li>
            <li style="text-align: center;"><a href="#" style="float: none;">《创客平台服务条款》</a></li>
            <li style="text-align: left;">已有创客账号，立即 <a href="#" style="float: none;">登录</a></li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $('#dowebokR').simplerSidebar({
            opener: '#User_Register',
            sidebar: {
                align: 'right',
                width: 300
            }
        });
    });
</script>
