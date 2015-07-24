<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_log.aspx.cs" Inherits="SysManage_list_log" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>ϵͳ��־</title>
    <link type="text/css" rel="stylesheet" href="../images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/pagination.css" />
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/ui/js/ligerBuild.min.js"></script>
    <script type="text/javascript" src="../images/index/js/function.js"></script>
    <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <div class="navigation">
        ��ҳ &gt; ϵͳ���� &gt; ϵͳ��־</div>
    <div class="tools_box">
        <div class="tools_bar">
            <div class="search_box">
                <asp:TextBox ID="txtdate_s" runat="server" CssClass="txtInput" onclick="WdatePicker({startDate:'%y-%M-%d 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"></asp:TextBox>��<asp:TextBox
                    ID="txtdate_e" runat="server" CssClass="txtInput" onclick="WdatePicker({startDate:'%y-%M-%d 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="�� ��" CssClass="btnSearch" OnClick="btnSearch_Click" />
            </div>
            <a href="javascript:void(0);" onclick="checkAll(this);" class="tools_btn"><span><b
                class="all">ȫѡ</b></span></a>
            <asp:LinkButton ID="btnDelete" runat="server" CssClass="tools_btn" OnClick="btnDelete_Click"
                OnClientClick="return ExePostBack('btnDelete','�Ƿ�ȷ��Ҫ����ɾ����');"><span><b class="delete">����ɾ��</b></span></asp:LinkButton>
        </div>
    </div>
    <!--�б�չʾ.��ʼ-->
    <asp:Repeater ID="rptList" runat="server">
        <HeaderTemplate>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                <tr>
                    <th width="6%">
                        ѡ��
                    </th>
                    <th width="15%">
                        ����ʱ��
                    </th>
                    <th width="12%">
                        ������Ա
                    </th>
                    <th width="12%">
                        IP
                    </th>
                    <th width="12%">
                        ��������
                    </th>
                    <th align="left">
                        ��������
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td align="center">
                    <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" />
                    <asp:HiddenField ID="hidId" Value='<%#Eval("ID")%>' runat="server" />
                </td>
                <td align="center">
                    <%#Eval("hy_createtime").ToString()%>
                </td>
                <td align="center">
                    <%#Eval("hy_oppusername")%>
                </td>
                <td align="center">
                    <%#Eval("hy_oppip")%>
                </td>
                <td align="center">
                    <%#Eval("hy_opptype")%>
                </td>
                <td>
                    <%#Eval("hy_oppcontent")%>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"6\">���޼�¼</td></tr>" : ""%>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <!--�б�չʾ.����-->
    <div class="line15">
    </div>
    <div class="page_box">
        <div id="PageContent" runat="server" class="flickr right">
        </div>
        <div class="left">
            ��ʾ<asp:TextBox ID="txtPageNum" runat="server" CssClass="txtInput2 small2" ReadOnly="true"></asp:TextBox>��/ҳ
            <div style="display: none">
                ��ǰ��<asp:TextBox ID="txtPage" runat="server" CssClass="txtInput2 small2" ReadOnly="true"></asp:TextBox>ҳ</div>
        </div>
    </div>
    <div class="line10">
    </div>
    </form>
</body>
</html>
