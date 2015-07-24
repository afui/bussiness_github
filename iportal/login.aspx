<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="login.aspx.cs"
    Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站后台管理系统登录</title>
    <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
   <%-- <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>--%>
    <script src="../js/jquery-1.6.2.min.js"></script>
    <script>
        function ToggleCode(obj, codeurl) {
            $(obj).attr("src", codeurl + "?time=" + Math.random());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="admin_login_wrap">
        <h1>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网站后台管理系统登录</h1>
        <div class="adming_login_border">
            <div class="admin_input">
                <form action="index.html" method="post">
                <ul class="admin_items">
                    <li>
                        <label for="user">
                            用户名：</label>
                        <asp:TextBox ID="user" TextMode="SingleLine" Width="265" class="admin_input_style"
                            runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <label for="pwd">
                            密码：</label>
                        <asp:TextBox ID="pwd" TextMode="Password" Width="265" class="admin_input_style" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <label for="user">
                            验证码：</label>
                        <asp:TextBox ID="txtCode" runat="server" CssClass="admin_input_style" MaxLength="6"
                            Style="width: 180px;" />
                        <img src="/include/imageCode.aspx" width="70" height="22" alt="点击切换验证码" title="点击切换验证码"
                            style="margin-top: 2px; vertical-align: top; cursor: pointer;" onclick="ToggleCode(this, '/include/imageCode.aspx');return false;" />
                    </li>
                    <li>
                        <asp:Button ID="btn_submit" runat="server" TabIndex="3" class="btn btn-primary" Text="提交"
                            OnClick="btn_submit_Click" />
                    </li>
                </ul>
                </form>
            </div>
        </div>
        <p class="admin_copyright">
            <a tabindex="5" href="#">返回首页</a> &copy; 2014 Powered by <a href="#" target="_blank">
                宁波力科网络</a></p>
    </div>
    <div style="display: none;">
        <asp:Button ID="btnLogin" Text="登录" runat="server" OnClick="btn_submit_Click" /><asp:Label
            ID="lblurl" runat="server"></asp:Label></div>
    </form>
</body>
</html>
