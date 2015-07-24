<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exportList.aspx.cs" Inherits="exportList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ι���</title>
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
            &nbsp;��ҳ &gt; �����ʼ�ģ�� &gt; ���ι���
        </div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
            <tr>
                <td>
                    <!--��ť��ʼ-->
                    <div class="tools_box">
                        <div class="tools_bar">
                            <div class="search_box">
                                ������<asp:TextBox CssClass="txtInput" ID="txtNmae" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="�� ��" CssClass="btnSearch" OnClick="btnSearch_Click" />
                            </div>
                            <a href="javascript:void(0);" onclick="window.location='exportMain.aspx?op=add&rnd='+Math.random()+'&url='+window.location.href;"
                                class="tools_btn" id="tdnewdoc" runat="server"><span><b class="add">���</b></span></a>
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
                                    <th width="10%" align="center">����
                                    </th>
                                    <th width="10%" align="center">���
                                    </th>
                                    <th align="center" width="20%">����
                                    </th>
                                    <th align="center" width="20%">��ϵ�绰
                                    </th>
                                    <th width="30%" align="center">��ϵ��ַ
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
                                <td widtd="5%" align="center"><a href="exportMain.aspx?op=modify&docid=<%#Eval("id")%>"><%#Eval("dt_name") %> </a>
                                </td>
                                <td widtd="10%" align="center"><%#Eval("dt_type") %>
                                </td>
                                <td align="center" widtd="25%"><%#Eval("dt_email") %>
                                </td>
                                <td align="center" widtd="10%"><%#Eval("dt_phone") %>
                                </td>
                                <td widtd="5%" align="center"><%#Eval("dt_address") %>
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
