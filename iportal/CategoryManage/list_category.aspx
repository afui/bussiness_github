<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_category.aspx.cs" Inherits="CategoryManage_list_category" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>������</title>
    <link type="text/css" rel="stylesheet" href="../images/index/scripts/ui/skins/Aqua/css/ligerui-all.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/pagination.css" />
    <script type="text/javascript" src="../images/index/scripts/jquery/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../images/index/scripts/ui/js/ligerBuild.min.js"></script>
    <script type="text/javascript" src="../images/index/js/function.js"></script>
    <script type="text/javascript">
    function sjlbInfo()
{
    //�ϼ�Ŀ¼
    var mlid = document.getElementById("txtcid_url").value;
    if(mlid.length==4)
    {
        window.location = "list_category.aspx";
    }else{
        window.location = "list_category.aspx?cid=" + mlid.substring(0, mlid.length - 4) + "&rnd=" + Math.random();
    } 
}
    </script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <div id="pageloading" style="display: none;">
        �����ύ�У����Ե�...</div>
    <div class="navigation">
        ��ҳ &gt; ������ &gt; ����б�</div>
    <div class="tools_box">
        <div class="tools_bar">
            <%--<div class="search_box">
                <asp:TextBox ID="txtKeywords" runat="server" CssClass="txtInput"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="�� ��" CssClass="btnSearch" OnClick="btnSearch_Click" />
            </div>--%>
            <a href="#" onclick="window.location='main_category.aspx?op=add&lastid='+document.getElementById('txtcid_url').value+'&rnd='+Math.random()+'&url='+window.location.href;"
                class="tools_btn" id="tdnewdoc" runat="server"><span><b class="add">������</b></span></a>
            <a href="#" onclick="checkAll(this);" class="tools_btn"><span><b
                class="all">ȫѡ</b></span></a>
            <asp:LinkButton ID="btnDelete" runat="server" CssClass="tools_btn" OnClick="btnDelete_Click"
                OnClientClick="return ExePostBack('btnDelete','�����¼����ʱ���޷�����ɾ�����Ƿ�ȷ��Ҫ����ɾ����');"><span><b class="delete">����ɾ��</b></span></asp:LinkButton>
            <a href="#" onclick="sjlbInfo();" class="tools_btn" id="fhsjlb" runat="server"><span><b
                class="all">�ϼ����</b></span></a>
        </div>
    </div>
    <!--�б�չʾ.��ʼOnItemDataBound="rptList_ItemDataBound"-->
    <asp:Repeater ID="rptList" runat="server" >
        <HeaderTemplate>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                <tr>
                    <th width="6%">
                        ѡ��
                    </th>
                    <th width="20%" align="center">
                        �����
                    </th>
                    <th align="left">
                        �������
                    </th>
                    <th align="left" width="10%">
                        ����
                    </th>
                    <th align="left" width="10%">
                        �¼����
                    </th>
                    <th width="12%">
                        �޸�
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td align="center">
                    <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" />
                    <asp:HiddenField ID="hidId" Value='<%#Eval("CID")%>' runat="server" />
                </td>
                <td  align="center">
                    <%#Eval("CID")%>
                </td>
                <td>
                    <%#Eval("hy_cname")%>
                </td>
                <td>
                    <%#Eval("hy_csort")%>
                </td>
                <td>
                    <a href="#" onclick="var ss='list_category.aspx?cid=<%# Eval("CID")%>&rnd='+Math.random();window.location=ss;">
                        �¼����</a>
                </td>
                <td align="center">
                    <a href="javascript:void(0);" onclick="window.location='main_category.aspx?op=modify&id=<%#Eval("CID")%>&rnd='+Math.random()+'&url='+window.location.href;">
                            �޸�</a>
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
            ��ʾ<asp:Label ID="txtPageNum" runat="server"></asp:Label>��/ҳ����ǰ��<asp:Label ID="txtPage"
                runat="server"></asp:Label>ҳ���򿪵�<asp:TextBox ID="txtGotoPage" runat="server" CssClass="txtInput2 small2"></asp:TextBox>ҳ
            <asp:Button ID="btnGoto" runat="server" Text="GOTO" OnClick="btnGoto_Click" CssClass="but_color"
                OnClientClick="document.getElementById('pageloading').style.display='block';" />
        </div>
    </div>
    <div class="line10">
    </div>
    <div style="display: none">
        ��Ŀ��ţ�<asp:TextBox ID="txtcid" runat="server"></asp:TextBox>
        URL�д������Ŀ��ţ�<asp:TextBox ID="txtcid_url" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>
