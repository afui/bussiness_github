﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using TPortalClass;


public partial class ggdy_Hy_TreeForSetRole : System.Web.UI.Page
{
    public string hy_mystyle()
    {
        string hy_mystyle = "";
        hy_mystyle = Session["mystyle"].ToString();
        return hy_mystyle;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string ls_roleid = "";
            string ls_roleusers = "";
            {
                HyRoleuser HyRoleuser = new HyRoleuser();
                if (this.Request.QueryString["roleid"] != null)
                    ls_roleid = this.Request.QueryString["roleid"].ToString();
                //得到该权限下边已经配置的人员
                DataTable dtjudeg = HyRoleuser.Getroleusersbyroleid(ls_roleid);
                if (dtjudeg.Rows.Count > 0)
                {
                    for (int i = 0; i < dtjudeg.Rows.Count; i++)
                    {
                        ls_roleusers += "," + dtjudeg.Rows[i]["hy_userid"].ToString();
                    }
                    ls_roleusers += ",";
                }
            }
            Response.Write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
            Response.Write("<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"zh-cn\">");
            Response.Write("<Head><Title>人员列表</Title>");
            Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
            Response.Write("<meta name=\"generator\" content=\"editplus\" />");
            Response.Write("<link type=\"text/css\" rel=\"stylesheet\" href=\"../css/lTREE.checkbox.css\" />");
            Response.Write("<style type=\"text/css\">");
            Response.Write("#lTREEMenuDEMO {border:1px solid #ccc;margin:3px;padding:3px;}");
            Response.Write("#infoBox {position:absolute;left:450px;top:40px;border:1px solid #ccc;width:400px;padding:0 10px;font-family:\"宋体\",Geneva,Arial,sans-serif;line-height:150%;}");
            Response.Write("#debugMSG strong {color:#f00;}");
            Response.Write("</style>");
            Response.Write("<!--[if IE 6]>");
            Response.Write("<script>");
            Response.Write("document.execCommand(\"BackgroundImageCache\", false, true);");
            Response.Write("</script>");
            Response.Write("<![endif]-->");
            Response.Write("</Head>");
            Response.Write("<body style=\"padding:2px;\">");
            //Response.Write("<form>");

            Response.Write("<div class=\"lTREEMenu lTREENormal\" id=\"lTREEMenuDEMO\">");
            Response.Write("<dl>");

            Response.Write("<dl>");
            Response.Write("<dd><input type=\"checkbox\" name=\"SelAll\" value=\"全选\" onclick=\"SelectAll();\" style=\"width:13;\"> <b>人员列表</b>");
            Response.Write("<dl>");

            //得到一级部门
            HyDept HyDept = new HyDept();
            DataTable dt = HyDept.GetFirstdeptsOrderByDeptid();

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    //输出一级部门头部
                    Response.Write("<dd class=\"folderClose\">");
                    Response.Write("<input type=\"checkbox\" name=\"Dept" + dt.Rows[i]["hy_deptid"].ToString() + "\" value=\"" + dt.Rows[i]["hy_deptid"].ToString() + "\">");
                    Response.Write(dt.Rows[i]["hy_deptname"].ToString());
                    Response.Write("<dl>");
                    //有下一级部门
                    if (HyDept.isHaveSubDept(dt.Rows[i]["hy_deptid"].ToString()) == true)
                    {
                        GetNextDept(dt.Rows[i]["hy_deptid"].ToString(), ls_roleusers);
                    }
                    //输出一级部门的人员
                    HyUser HyUser = new HyUser();
                    DataTable dtuser = HyUser.GetUsers(dt.Rows[i]["hy_deptid"].ToString());

                    if (dtuser.Rows.Count > 0)
                    {
                        for (int j = 0; j < dtuser.Rows.Count; j++)
                        {
                            Response.Write("<dt>");
                            //判断已选中
                            if (ls_roleusers.Contains("," + dtuser.Rows[j]["hy_userid"].ToString() + ","))
                            {
                                Response.Write("<input type=\"checkbox\" checked=\"checked\" name=\"User" + dtuser.Rows[j]["hy_userid"].ToString() + "_subuser\" value=\"");
                                Response.Write(dtuser.Rows[j]["hy_userid"].ToString() + "|" + dtuser.Rows[j]["hy_username"].ToString() + "\" text=\"" + dtuser.Rows[j]["hy_username"].ToString() + "\">");
                                Response.Write(dtuser.Rows[j]["hy_username"].ToString());
                                Response.Write("</dt>");
                            }
                            else
                            {
                                Response.Write("<input type=\"checkbox\" name=\"User" + dtuser.Rows[j]["hy_userid"].ToString() + "_subuser\" value=\"");
                                Response.Write(dtuser.Rows[j]["hy_userid"].ToString() + "|" + dtuser.Rows[j]["hy_username"].ToString() + "\" text=\"" + dtuser.Rows[j]["hy_username"].ToString() + "\">");
                                Response.Write(dtuser.Rows[j]["hy_username"].ToString());
                                Response.Write("</dt>");
                            }
                        }
                    }

                    //输出一级部门尾部
                    Response.Write("</dl>");
                    Response.Write("</dd>");
                }
            }

            Response.Write("</dl>");
            Response.Write("</dd>");
            Response.Write("</dl>");
            Response.Write("</div>");

            Response.Write("<script type=\"text/javascript\" src=\"hyhtml/ltree/js/lTREE.js\"></script>");
            Response.Write(" <script class=\"lJSFDemo\" type=\"text/javascript\">");
            Response.Write("  var lTree = new lTREE();");
            Response.Write("  lTree.config({ path: \"dl dd\" });");
            Response.Write("   lTree.tagName({ folder:\"DD\", file:\"DT\" });");
            Response.Write("   lTree.className({ folderClose: \"folderClose\", lastChild: \"lastChild\"});");
            Response.Write("   var t = new Date(), timer = []; lTree.build(\"lTREEMenuDEMO\");");
            Response.Write("   timer.push(new Date() - t);");
            Response.Write("   function chkAll() {");
            Response.Write("       var a = this.parentNode.getElementsByTagName(\"input\"), b = this.checked;");
            Response.Write("     for (var i = 0, l = a.length; i < l; i++) {");
            Response.Write("        a[i].checked = b;");
            Response.Write("            }");
            Response.Write("  }");
            Response.Write("  function chkOne() {");
            Response.Write("    var a = this, b = this.checked, p = lDOM.$(\"lTREEMenuDEMO\"), pn = null;");
            Response.Write("    while (a.tagName != \"DD\" && a != p) a = a.parentNode;");
            Response.Write("    pn = a.getElementsByTagName(\"input\");");
            Response.Write("   if (b) {");
            Response.Write("      for (var i = 1, l = pn.length; i < l; i++) {");
            Response.Write("        if (!pn[i].checked) {");
            Response.Write("            b = false; break;");
            Response.Write("      }");
            Response.Write("   }");
            Response.Write("   }");
            Response.Write("    pn[0].checked = b;");
            Response.Write("    }");
            Response.Write("   var arrCHK = lDOM.find(\"dl dd input\", lDOM.$(\"lTREEMenuDEMO\"), { type: \"checkbox\" });");
            Response.Write("   arrCHK.each(function(s) {");
            Response.Write("     if (s.parentNode.tagName == \"DT\") {");
            Response.Write("        s.onclick = chkOne;");
            Response.Write("    } else {");
            Response.Write("      s.onclick = chkAll;");
            Response.Write("      }");
            Response.Write("    }); </script>");
            //Response.Write("</form>");
            Response.Write("</Body></HTML>");
        }
    }

    //得到下一级部门的信息
    private void GetNextDept(string pis_DeptId, string ls_users)
    {
        //得到二级部门
        HyDept HyDept = new HyDept();
        DataTable dtdept = HyDept.GetSubDeptsOrderByDeptid(pis_DeptId);
        if (dtdept.Rows.Count > 0)
        {
            for (int i = 0; i < dtdept.Rows.Count; i++)
            {
                //输出二级部门头部
                Response.Write("<dd class=\"folderClose\">");
                Response.Write("<input type=\"checkbox\" name=\"Dept" + dtdept.Rows[i]["hy_deptid"].ToString() + "\" value=\"" + dtdept.Rows[i]["hy_deptid"].ToString() + "\">");
                Response.Write(dtdept.Rows[i]["hy_deptname"].ToString());
                Response.Write("<dl>");

                //有下一级部门
                if (HyDept.isHaveSubDept(dtdept.Rows[i]["hy_deptid"].ToString()) == true)
                {
                    GetNextDept(dtdept.Rows[i]["hy_deptid"].ToString(), ls_users);
                }

                //输出二级部门的人员
                HyUser HyUser = new HyUser();
                DataTable dtuser = HyUser.GetUsers(dtdept.Rows[i]["hy_deptid"].ToString());
                if (dtuser.Rows.Count > 0)
                {
                    for (int j = 0; j < dtuser.Rows.Count; j++)
                    {
                        //判断已选中
                        if (ls_users.Contains("," + dtuser.Rows[j]["hy_userid"].ToString() + ","))
                        {
                            Response.Write("<dt>");
                            Response.Write("<input type=\"checkbox\" checked=\"checked\" name=\"User" + dtuser.Rows[j]["hy_userid"].ToString() + "_subuser\" value=\"");
                            Response.Write(dtuser.Rows[j]["hy_userid"].ToString() + "|" + dtuser.Rows[j]["hy_username"].ToString() + "\" text=\"" + dtuser.Rows[j]["hy_username"].ToString() + "\">");
                            Response.Write(dtuser.Rows[j]["hy_username"].ToString());
                            Response.Write("</dt>");
                        }
                        else
                        {
                            Response.Write("<dt>");
                            Response.Write("<input type=\"checkbox\" name=\"User" + dtuser.Rows[j]["hy_userid"].ToString() + "_subuser\" value=\"");
                            Response.Write(dtuser.Rows[j]["hy_userid"].ToString() + "|" + dtuser.Rows[j]["hy_username"].ToString() + "\" text=\"" + dtuser.Rows[j]["hy_username"].ToString() + "\">");
                            Response.Write(dtuser.Rows[j]["hy_username"].ToString());
                            Response.Write("</dt>");
                        }
                    }
                }

                //输出二级部门尾部
                Response.Write("</dl>");
                Response.Write("</dd>");
            }
        }
    }


}
