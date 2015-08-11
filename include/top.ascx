<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="include_top" %>
<script src="../artDialog/dialog-min.js"></script>
<link href="../artDialog/ui-dialog.css" rel="stylesheet" />

<script type="text/javascript">
    function emailCheck(strObj) {
        var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (!pattern.test(strObj)) {
            tip("��������ȷ�������ַ��");
            document.getElementById('top1_txtEmail').focus();
            return false;
        }
        return true;
    }
    function saveData() {
        if (emailCheck(document.getElementById('top1_txtEmail').value)) {
            if (document.getElementById('top1_txtPwd').value != document.getElementById('top1_txtConfirePwd').value) {
                tip("������������벻һ�£�");
                document.getElementById('top1_txtPwd').value = "";
                document.getElementById('top1_txtConfirePwd').value = "";
                document.getElementById('top1_txtPwd').focus();
                return;
            }
        }
    }
    function tip(prompt) {
        var d = dialog({
            title: '��ʾ',
            content: prompt
        });
        d.show();
    }
    function saveDataSuccess() {
        document.getElementById('region_2').style.display = 'none';
        document.getElementById('region_1').style.display = 'none';
        document.getElementById('dowebok').style.display = 'none';
        tip("����ɹ���");
    }
</script>
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
            <button onclick="saveDataSuccess()"><i class="icon-search"></i>����</button>
        </div>
    </div>
</div>
<div id="dowebok">
    <div class="Logo_User">
        <strong><b>��Ա��¼</b><a href="javascript:void(0)" class="close-sidebar"></a></strong>
        <ul>
            <li>����/�ֻ�����<input type="text" class="form-control input-sm" placeholder="�������ʺ�"></li>
            <li>����<input type="text" class="form-control input-sm" placeholder="����������"></li>
            <li>
                <label>
                    <input type="checkbox">
                    ��������״̬</label><a href="#">�������룿</a></li>
            <li>
                <button class="btn btn-warning btn-block">������¼</button></li>
            <li style="text-align: center;"><a href="#" id="not_register" style="float: none;">��û��ע�ᣬ���ע�ᡣ</a></li>
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
<!--��Աע�� ע������ѡ��-->
<div id="region_1">
    <div class="User_Reg">
        <strong><b>��Աע��</b><a href="#" class="close-sidebar"></a></strong>
        <ul>
            <li>
                <input checked="checked" id="personal" name="type" value="1" type="radio" class="input_checkbox">&nbsp;&nbsp;����/����</li>
            <li>
                <input type="radio" id="investor" name="type" value="2" class="input_checkbox">&nbsp;&nbsp;Ͷ����</li>
            <li>
                <input type="radio" id="enterprise" name="type" value="3" class="input_checkbox">&nbsp;&nbsp;��ҵ</li>
            <li><a href="javascript:void(0)" class="Quest Quest2" id="next_2">��һ��</a></li>
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
<!--��Աע�� ��дע����Ϣ-->
<div id="region_2">
    <div class="User_Reg">
        <strong><b>��Աע��</b><a href="#" class="close-sidebar"></a></strong>
        <ul>
            <li>����<input type="text" id="txtEmail" class="form-control input-sm" runat="server" placeholder="�������ʺ�" /></li>
            <li>����<input type="text" id="txtPwd" class="form-control input-sm" runat="server" placeholder="����������" /></li>
            <li>ȷ������<input type="text" id="txtConfirePwd" runat="server" class="form-control input-sm" placeholder="�ٴ�ȷ������" /></li>
            <li>�ǳ�<input type="text" id="txtName" runat="server" class="form-control input-sm" placeholder="�����ǳ�" /></li>
            <li style="margin-top: 18px;">
                <asp:Button ID="btn_save" CssClass="btn btn-warning btn-block" runat="server" Text="ͬ�����ע��" OnClick="btn_save_Click" />
            </li>
            <li style="text-align: center;"><a href="#" style="float: none;">������ƽ̨�������</a></li>
            <li style="text-align: left;">���д����˺ţ����� <a href="#" id="not_login" style="float: none;">��¼</a></li>
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
<!--�˵�-->
<div class="Maun">
    <div class="Width100">
        <ul>
            <li><a href="index.aspx?rend=<%=System.Guid.NewGuid().ToString() %>" class="hover">��վ��ҳ</a></li>
            <span>&nbsp;</span>
            <li><a target="_balank" href="projectList.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">��Ŀ����</a></li>
            <span>&nbsp;</span>
            <li><a href="demandPublish.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">���󷢲�</a></li>
            <span>&nbsp;</span>
            <li><a href="serverCompany.aspx?rend=<%=System.Guid.NewGuid().ToString() %>">��������ס</a></li>
            <span>&nbsp;</span>
            <li><a href="#">�����ʱ�</a></li>
            <span>&nbsp;</span>
            <li><a target="_balank" href="showExportList.aspx?rend=<%=System.Guid.NewGuid().ToString() %>>">ר����ѯ</a></li>
        </ul>
    </div>
</div>
<div style="display: none">
    <input id="checkType" runat="server" />
</div>
