<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="include_top" %>
<div class="Top Width100">
    <div class="pull-left">
        <a href="#">
            <img src="../images/Logo.png"></a>
    </div>
    <div class="pull-right">
        <a href="javascript:void(0)" class="Logo" id="User_Register">ע��</a>
        <a href="javascript:void(0)" class="Rion" id="User_Login">��¼</a>
        <div class="T_search">
            <input type="text" placeholder="������Ŀ����������">
            <button><i class="icon-search"></i>����</button>
        </div>
    </div>
</div>
<div id="dowebok">
    <div class="Logo_User">
        <strong><b>��Ա��¼</b><a href="#"></a></strong>
        <ul>
            <li>����/�ֻ�����<input type="text" class="form-control input-sm" placeholder="�������ʺ�"></li>
            <li>����<input type="text" class="form-control input-sm" placeholder="����������"></li>
            <li>
                <label>
                    <input type="checkbox">
                    ��������״̬</label><a href="#">�������룿</a></li>
            <li>
                <button class="btn btn-warning btn-block">������¼</button></li>
            <li style="text-align: center;"><a href="#" style="float: none;">��û��ע�ᣬ���ע�ᡣ</a></li>
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
        <strong><b>��Աע��</b><a href="#"></a></strong>
        <ul>
            <li>����/�ֻ�����<input type="text" class="form-control input-sm" placeholder="�������ʺ�"></li>
            <li>����<input type="text" class="form-control input-sm" placeholder="����������"></li>
            <li>ȷ������<input type="text" class="form-control input-sm" placeholder="�ٴ�ȷ������"></li>
            <li>�ǳ�<input type="text" class="form-control input-sm" placeholder="�����ǳ�"></li>
            <li style="margin-top: 18px;">
                <button class="btn btn-warning btn-block">ͬ�����ע��</button></li>
            <li style="text-align: center;"><a href="#" style="float: none;">������ƽ̨�������</a></li>
            <li style="text-align: left;">���д����˺ţ����� <a href="#" style="float: none;">��¼</a></li>
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
