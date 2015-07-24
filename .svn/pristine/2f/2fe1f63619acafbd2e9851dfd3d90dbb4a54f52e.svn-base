using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TPortalClass;

public partial class main_role : System.Web.UI.Page
{
    HyRole HyRole = new HyRole();
    protected void Page_Load(object sender, EventArgs e)
    {

        //判断session
        if (this.Session["uid"] != null)
        {
            if (this.Session["uid"].ToString() == "")
            {
                this.Response.Redirect("/login.aspx");
            }
        }
        else
        {
            this.Response.Redirect("/login.aspx");
        }
        if (!this.IsPostBack)
        {
            this.txtRoleId.Text = "Role";
            if (this.Request.QueryString["op"] != null)
            {
                this.txtop.Value = this.Request.QueryString["op"].ToString();
            }
            if (this.Request.QueryString["hy_roleid"] != null)
            {
                this.txtdocid.Value = this.Request.QueryString["hy_roleid"].ToString();
            }
            RptBind();
            ChkRole("Role0008");    //检查权限
        }
    }
    // 检查权限=================================
    private void ChkRole(string Roleid)
    {
    }
    // 数据绑定
    private void RptBind()
    {
        HyRole HyRole = new HyRole();
        DataTable dt = new DataTable();
        if (this.txtop.Value == "modify")
        {
            HyRole.hy_roleid = this.txtdocid.Value;
            dt = HyRole.Getdocbyid();
            if (dt.Rows.Count > 0)
            {
                this.txtRoleSort.Text = dt.Rows[0]["hy_sort"].ToString();
                this.txtRoleId.Text = dt.Rows[0]["hy_roleid"].ToString();
                this.txtRoleNmae.Text = dt.Rows[0]["hy_rolename"].ToString();
                this.txtRoleDemo.Text = dt.Rows[0]["hy_demo"].ToString();
            }
            this.txtRoleId.Enabled = false;
        }
        else if (this.txtop.Value == "add")
        {
            dt.Clear();
            dt = HyRole.GetMaxSort();
            if (dt.Rows.Count > 0)
            {
                this.txtRoleSort.Text = Convert.ToString(Convert.ToInt32(dt.Rows[0]["hy_sort"].ToString()) + 2);
            }
            else
            {
                this.txtRoleSort.Text = "1";
            }
        }
    }
    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bool flag = false;
        HyRole HyRole = new HyRole();
        try
        {
            if (!this.txtRoleId.Text.Substring(0, 4).Contains("Role"))
            {
                Response.Write("<script>alert('对不起，权限编号要以Role开头');</script>");
                return;
            }
            if (this.txtRoleId.Text.Length < 5)
            {
                Response.Write("<script>alert('权限编号长度必须大于4位！');</script>");
                return;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，权限编号要Role开头');</script>");
            return;
        }
        HyRole.hy_sort = Convert.ToInt32(this.txtRoleSort.Text);
        HyRole.hy_roleid = this.txtRoleId.Text;
        HyRole.hy_rolename = this.txtRoleNmae.Text;
        HyRole.hy_demo = this.txtRoleDemo.Text;
        if (this.txtop.Value == "add")
        {
            flag = HyRole.Insert();
        }
        else if (this.txtop.Value == "modify")
        {
            flag = HyRole.Update();
        }
        if (flag)
        {
            Response.Write("<script>alert('保存成功！');window.location='list_role.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
        }
        else
        {
            Response.Write("<script>alert('保存失败，请联系管理员！');window.location='list_role.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
        }
    }
}