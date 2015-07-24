<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hy_SelDept.aspx.cs"
    Inherits="ggdy_Hy_SelDept" %>

<!--url = 'Hy_SelDept.aspx?txtfield=hy_deptname&valuefield=hy_deptid&type=1&deptid=001-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>选择部门</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="hyhtml/images/Hycss.css" rel="stylesheet">
    <link href="hyhtml/images/mainWin.css" rel="stylesheet">
    <script src="hyhtml/ltree/js/DeptSelection.js"></script>
    <script type="text/javascript">
        //保存
        function submitform() {

           
            var ls_text = ExtractDeptnames_Public();
            
            var ls_value = ExtractDeptids_Public();
            
            if (ls_value == "") {
                alert("请选择部门！");
                return false;
            }
            var lv_text = ls_text.split("+");
            var lv_value = ls_value.split("+");
            
            try {
                if (document.getElementById("type").value == "1") {
                    
                    window.opener.document.getElementById(document.getElementById("txtfield").value).value = lv_text[0];
                } else {
                    window.opener.document.getElementById(document.getElementById("txtfield").value).value = ls_text;
                }
            } catch (err) { }
            try {
                if (document.getElementById("type").value == "1") {
                    window.opener.document.getElementById(document.getElementById("valuefield").value).value = lv_value[0];
                } else {
                    window.opener.document.getElementById(document.getElementById("valuefield").value).value = ls_value;
                }
            } catch (err) { }

            self.close();
        }
    </script>

    <base target="_self">
</head>
<body text="#000000" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginheight="0"
    marginwidth="0">
    <form>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" vlign="top">
        <tr>
            <td height="30" align="center" class="style1">
                【选择部门】
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
                    <tr>
                        <td height="33" align="center" bgcolor="#D1E7FF">
                            部门列表
                        </td>
                    </tr>
                    <tr>
                        <td align="left" bgcolor="#ffffff" height="300">
                            <iframe frameborder="0" id="TreeStructWin" name="TreeStructWin" scrolling="yes" align="center"
                                src="Hy_TreeForXzbm.aspx?deptid=<%=pis_deptid() %>" style="width: 100%;
                                height: 100%; visibility: inherit; z-index: 2"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <table border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td width="15" align="center">
                        </td>
                        <td width="52" align="center" class="btntools">
                            <table width="40" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="4">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input id="btn_return" type="button" name="btn_return" value=" 关 闭" onclick="self.close();"
                                            class="btn7" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="15" align="center">
                        </td>
                        <td width="52" align="center" class="btntools">
                            <table width="40" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="4">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input id="Button1" type="button" name="btn_return" value=" 选 择" onclick="submitform();"
                                            class="btn7" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="15" align="left">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
    <div style="display: none">
        <input type="text" id="txtfield" runat="server" /><br/>          //父文档中存放部门名称的字段
        <input type="text" id="valuefield" runat="server" />   <br/>     //父文档中存放部门ID的字段
        <input type="text" id="type" runat="server" />              //可多选还是单选   1：单选  非1：多选  默认为空即多选
    </div>
</body>
</html>
