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
            } else {
                document.getElementById('top1_btn_save').click();
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
    //������֤��
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
            <input type="text" placeholder="������Ŀ����������">
            <button onclick="saveDataSuccess()"><i class="icon-search"></i>����</button>
        </div>
    </div>
</div>
<div id="dowebok">
    <div class="Logo_User">
        <strong><b>��Ա��¼</b><a href="javascript:void(0)" onclick="closeTip();"></a></strong>
        <ul>
            <li>����/�ֻ�����<input type="text" runat="server" id="txtUid" class="form-control input-sm" placeholder="�������ʺ�" /></li>
            <li>����<input type="password" id="txtLogPwd" runat="server" class="form-control input-sm" placeholder="����������" /></li>
            <li>��֤��
                <input id="txtCheckCode" value="" class="form-control input-sm" runat="server" placeholder="��������֤��" />
            </li>
            <li>
                <img id="ValidateImg" style="width: 30%" src="../iportal/ggdy/ValidateImg.aspx" onclick="showimg(this);" style="cursor: pointer;" alt="�������?��һ��" />
            </li>
            <li>�˻�����&nbsp;&nbsp;<select id="st_type" class="form-control input-sm" runat="server"><option selected="selected" value="1">����/����</option>
                <option value="2">Ͷ����</option>
                <option value="3">��ҵ</option>
            </select></li>
            <li>
                <label>
                    <input type="checkbox">
                    ��������״̬</label><a href="javascript:void(0)">�������룿</a></li>
            <li>
                <asp:Button ID="btn_login" CssClass="btn btn-warning btn-block" runat="server" Text="������¼" OnClick="btn_login_Click" />
            </li>
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
        <strong><b>��Աע��</b>
            <button class="close-sidebar">111</button></strong>
        <ul>
            <li>
                <input checked="True" id="ck_personal" name="type" value="1" runat="server" type="radio" class="input_checkbox" />&nbsp;&nbsp;����/����</li>
            <li>
                <input type="radio" id="ck_investor" name="type" value="2" runat="server" class="input_checkbox" />&nbsp;&nbsp;Ͷ����</li>
            <li>
                <input type="radio" id="ck_enterprise" name="type" value="3" runat="server" class="input_checkbox" />&nbsp;&nbsp;��ҵ</li>
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
            <li>����<input type="password" id="txtPwd" class="form-control input-sm" runat="server" placeholder="����������" /></li>
            <li>ȷ������<input type="password" id="txtConfirePwd" runat="server" class="form-control input-sm" placeholder="�ٴ�ȷ������" /></li>
            <li>�ǳ�<input type="text" id="txtName" runat="server" class="form-control input-sm" placeholder="�����ǳ�" /></li>
            <li style="margin-top: 18px;">
                <a href="javascript:void(0)" onclick="saveData()" class="btn btn-warning btn-block">ͬ�����ע��</a>
            </li>
            <li style="text-align: center;"><a href="javascript:void(0)" style="float: none;">������ƽ̨�������</a></li>
            <li style="text-align: left;">���д����˺ţ����� <a href="javascript:void(0)" id="not_login" style="float: none;">��¼</a></li>
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
        <strong><b>�ҵ�����</b><a href="javascript:void(0)" class="close-sidebar"></a></strong>
        <ul>
            <li>�ǳ�
                <asp:Label ID="lb_name" CssClass="form-control input-sm" runat="server"></asp:Label>
            </li>
            <li>����<asp:Label ID="lb_email" CssClass="form-control input-sm" runat="server"></asp:Label></li>
            <li>�˻�����<asp:Label ID="lb_type" CssClass="form-control input-sm" runat="server"></asp:Label></li>
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
    <asp:Button ID="btn_save" CssClass="btn btn-warning btn-block" runat="server" Text="ͬ�����ע��" OnClick="btn_save_Click" />
    <input id="checkType" runat="server" />
    <asp:Button ID="btn_loginOut" runat="server" Text="ע��" OnClick="btn_loginOut_Click" />
</div>


