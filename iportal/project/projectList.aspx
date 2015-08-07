<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectList.aspx.cs" Inherits="projectList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ŀ����</title>
    <link href="../../css/css-cn.css" rel="stylesheet" />
    <link href="../css/pagination.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../images/index/css/style.css" />
    <script type="text/javascript" language="javascript" src="../../js/HomeBookMark.js"></script>
    <script src="../artDialog/jquery-1.10.2.js"></script>
    <script src="../artDialog/dialog-min.js"></script>
    <link href="../artDialog/ui-dialog.css" rel="stylesheet" />
    <script type="text/javascript">
        function tip(prompt, path) {
            var d = dialog({
                content: prompt,
                cancel: false,
                ok: function () {
                    window.location = path;
                }
            });
            d.show();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            &nbsp;��ҳ &gt; ��Ŀ���� &gt; ��Ŀ�б�
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
            <tr>
                <td>
                    <!--��ť��ʼ-->
                    <div class="tools_box">
                        <div class="tools_bar">
                            <div class="search_box">
                                ��Ŀ���ƣ�<asp:TextBox CssClass="txtInput" ID="txtNmae" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="�� ��" CssClass="btnSearch" OnClick="btnSearch_Click" />
                            </div>
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
                                    <th width="10%" align="center">��Ŀ����
                                    </th>
                                    <th width="10%" align="center">��Ŀ��ַ
                                    </th>
                                    <th align="center" width="10%">��Ŀ�ؼ���
                                    </th>
                                    <th align="center" width="30%">��Ŀ����
                                    </th>
                                    <th width="10%" align="center">Ԥ�����ʽ��
                                    </th>
                                    <th width="10%" align="center">�ֻ�����
                                    </th>
                                    <th width="10%" align="center">����
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="22" onmouseover="this.className='tr_over'" onmouseout="this.className='tr_out'">
                                <td align="center" widtd="5%"><%# (page - 1) * pageSize + Container.ItemIndex + 1%>
                                </td>
                                <td align="center" widtd="5%">
                                    <input type="checkbox" name="docids" value="<%#Eval("id")%>" />
                                </td>
                                <td widtd="10%" align="center"><a href="projectMain.aspx?docid=<%#Eval("id")%>&ren=<%=System.Guid.NewGuid().ToString() %>"><%# Eval("projectNmae")%></a>
                                </td>
                                <td widtd="10%" align="center"><%# Eval("projectAdress")%>
                                </td>
                                <td align="center" widtd="10%"><%# Eval("projcetKeyword")%>
                                </td>
                                <td align="center" widtd="30%"><%# Eval("projcetSummary")%>
                                </td>
                                <td widtd="10%" align="center"><%# Eval("financing") %>
                                </td>
                                <td widtd="10%" align="center"><%# Eval("phoneNumber") %>
                                </td>
                                <td widtd="10%" align="center"><%# Eval("eamil") %>
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
            ɾ����IDS��<input id="txtuids" name="txtuids" runat="server" />
            <asp:TextBox ID="txtPage" runat="server"></asp:TextBox>
            ɾ����<asp:Button ID="btndelinfo" Text="ɾ��" OnClick="btndelinfo_Click" runat="server" />
        </div>
    </form>
</body>
</html>
