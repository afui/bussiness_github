<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_content.aspx.cs" ValidateRequest="false" Inherits="ContentManage_main_content" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ݹ���</title>
    <link type="text/css" rel="stylesheet" href="../images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/jquery/messages_cn.js"></script>
    <script type="text/javascript" src="../images/index/scripts/ui/js/ligerBuild.min.js"></script>
    <script type="text/javascript" src="../images/index/js/function.js"></script>
    <script type="text/javascript">
        //������֤
        $(function () {
            $("#form1").validate({
                invalidHandler: function (e, validator) {
                    parent.jsprint("�� " + validator.numberOfInvalids() + " ����д�������飡", "", "Warning");
                },
                errorPlacement: function (lable, element) {
                    //�ɼ�Ԫ����ʾ������ʾ
                    if (element.parents(".tab_con").css('display') != 'none') {
                        element.ligerTip({ content: lable.html(), appendIdTo: lable });
                    }
                },
                success: function (lable) {
                    lable.ligerHideTip();
                }
            });
        });
    </script>
    <%--�༭��start--%>
    <link rel="stylesheet" href="/editor/themes/default/default.css" />
    <link rel="stylesheet" href="/editor/plugins/code/prettify.css" />
    <script type="text/javascript" charset="utf-8" src="/editor/kindeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="/editor/lang/zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="/editor/plugins/code/prettify.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor1 = K.create('#content1', {
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
    <%--�༭��end--%>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
        <div id="pageloading" style="display: none;">
            �����ύ�У����Ե�...
        </div>
        <div class="navigation">
            <a href="javascript:history.go(-1);" class="back">����</a>��ҳ &gt; ���ݹ��� &gt; ���ݹ���
        </div>
        <div id="contentTab">
            <ul class="tab_nav">
                <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:void(0);">���ݷ���</a></li>
            </ul>
            <div class="tab_con" style="display: block;">
                <table class="form_table">
                    <col width="180px">
                    <col>
                    <tbody>
                        <tr>
                            <th width="15%">���ڣ�
                            </th>
                            <td width="35%">
                                <asp:TextBox ID="txtpubtime" onclick="WdatePicker({startDate:document.forms[0].txtpubtime.value,dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"
                                    runat="server" CssClass="txtInput normal required"></asp:TextBox>
                            </td>
                            <th width="15%">���
                            </th>
                            <td width="35%">
                                <asp:Label ID="lbltype" runat="server"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th>���⣺
                            </th>
                            <td colspan="3">
                                <asp:TextBox ID="txttitle" runat="server" CssClass="txtInput normal required" MaxLength="80" Width="600"></asp:TextBox><label>*</label>
                            </td>
                        </tr>
                        <tr>
                            <th>���ݣ�
                            </th>
                            <td colspan="3">
                                <textarea id="content1" cols="100" rows="8" style="width: 700px; height: 280px; visibility: hidden;"
                                    runat="server"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="foot_btn_box">
                <asp:Button ID="btnSubmit" runat="server" Text="�� ��" CssClass="btnSubmit" OnClick="btnSubmit_Click" OnClientClick="document.getElementById('pageloading').style.display='block';" />
            </div>
        </div>
        <div style="display: none">
            �������޸ģ�<input id="txtop" runat="server" value="" /><br />
            �ĵ�ID��<input id="txtid" runat="server" value="" /><br />
            ���ID��<input id="txtcid" runat="server" value="" /><br />
            URL��<input id="txturl" runat="server" value="" /><br />
        </div>
    </form>
</body>
</html>