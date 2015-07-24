<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_user.aspx.cs" Inherits="SysManage_list_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�û�����</title>
    <link href="../../css/css-cn.css" rel="stylesheet" />
    <link href="../css/pagination.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script type="text/javascript" language="javascript" src="../../js/HomeBookMark.js"></script>
    <script type="text/javascript">
        function ResetPwd(uid) {
            document.getElementById("txtuid").value = uid;
            document.getElementById("btnpwd").click();
        }
    </script>
</head>
<body >
    <form id="form1" runat="server">
        <div class="navigation">
            &nbsp;��ҳ &gt; ϵͳ���� &gt; �û�����
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="98%">
            <tr>
                <td>
                    <!--��ť��ʼ-->
                    <div class="tools_box">
                        <div class="tools_bar">
                        
                            <div class="search_box">
                                 ���ţ� <asp:DropDownList ID="ddlbmmc" runat="server" OnSelectedIndexChanged="ddl_bmxl_SelectedIndexChanged"
                                                AutoPostBack="true" CssClass="btnSelect">
                                            </asp:DropDownList>&nbsp;&nbsp;������<asp:TextBox ID="txtKeywords" runat="server" CssClass="txtInput"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="�� ��" CssClass="btnSearch" OnClick="btnSearch_Click" />
                            </div>
                            <a href="javascript:void(0);" onclick="window.location='main_user.aspx?op=add&rnd='+Math.random()+'&url='+window.location.href;"
                                class="tools_btn" id="tdnewdoc" runat="server"><span><b class="add">�����û�</b></span></a>
                            <a href="javascript:void(0);" onclick="DelInfo();" class="tools_btn"
                                id="tddeldoc" runat="server"><span><b class="delete">ɾ ��</b></span></a>
                        </div>
                    </div>
                    <!--�б�չʾ.��ʼ-->
                    <asp:Repeater ID="rptList" runat="server">
                        <HeaderTemplate>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                                <tr>
                                    <th align="center" width="5%">���
                                    </th>
                                    <th align="center" width="5%">
                                        <input type="checkbox" name="seleall" value="" onclick="CheckAll();" title="ȫѡ">
                                    </th>
                                    <th width="12%" align="center">�û�ID
                                    </th>
                                    <th align="center">�û�����
                                    </th>
                                    <th align="center" width="15%">�绰
                                    </th>
                                    <th align="center" width="15%">�ֻ�
                                    </th>

                                    <th width="20%" align="center">����
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="22" onmouseover="this.className='tr_over'" onmouseout="this.className='tr_out'">
                                <td align="center">
                                    <%# (page - 1) * pageSize + Container.ItemIndex + 1%></a>
                                </td>
                                <td align="center">
                                    <input type="checkbox" name="docids" value="<%#Eval("id")%>">
                                </td>
                                <td align="center">
                                    <%#Eval("hy_userid")%>
                                </td>
                                <td align="center">
                                    <%#Eval("hy_username")%>
                                </td>
                                <td align="center">
                                    <%#Eval("hy_officetel")%>
                                </td>
                                <td align="center">
                                    <%#Eval("hy_mobile")%>
                                </td>

                                <td align="center">
                                    <a href="javascript:void(0);" onclick="window.location='main_user.aspx?op=modify&id=<%#Eval("id")%>&rnd='+Math.random()+'&url='+window.location.href;">�޸�</a><a href="#" onclick="window.open('main_xgmm.aspx?userid=<%#Eval("hy_userid")%>&rnd='+Math.random()+'&url='+window.location.href,'newwindow','height=600,width=800,top=100,left=400,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')">
                                �޸�����</a>
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
                    <div class="pagelist">
                        <div class="l-btns m10">
                            <span>��ʾ</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);"
                                OnTextChanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>��/ҳ</span>
                        </div>
                        <div class="l-btns m10">
                            <span>��<asp:Literal ID="lblcount" runat="server"></asp:Literal>��¼</span>
                        </div>
                        <div id="PageContent" runat="server" class="default">
                        </div>
                    </div>
                    <!--/���ݵײ�-->
                    <div class="line10">
                    </div>
                </td>
            </tr>
        </table>
        <div style="display: none;">
            ��Ա��ţ�<asp:TextBox ID="txtuid" runat="server"></asp:TextBox>
            �����ʼ����<asp:Button ID="btnpwd" runat="server" Text="�����ʼ��" OnClick="btnpwd_Click" />
            ����id��<asp:TextBox ID="txtbmid" runat="server"></asp:TextBox>
            ɾ����IDS��<input id="txtuids" name="txtuids" runat="server" />
            <asp:TextBox ID="txtPage" runat="server"></asp:TextBox>
            ɾ����<asp:Button ID="btndelinfo" Text="ɾ��" OnClick="btndelinfo_Click" runat="server" />
        </div>
    </form>
</body>
</html>