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

public partial class Admin_Organ_OrgMana : System.Web.UI.Page
{
    HyDept HyDept = new HyDept();
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断session
        if (this.Session["uid"] != null)
        {
            if (this.Session["uid"].ToString() == "")
            {
                this.Response.Redirect("../login.aspx");
            }
        }
        else
        {
            this.Response.Redirect("../login.aspx");
        }
        if (!this.IsPostBack)
        {
            if (this.Request.QueryString["op"] != null)
            {
                this.txtop.Value = this.Request.QueryString["op"].ToString();
            }
            if (this.Request.QueryString["docid"] != null)
            {
                this.txtdocid.Value = this.Request.QueryString["docid"].ToString();
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
        if (this.txtop.Value == "modify")
        {
            HyDept HyDept = new HyDept();
            DataTable dt = new DataTable();
            dt = HyDept.Getdept(this.txtdocid.Value);
            if (dt.Rows.Count > 0)
            {
                this.txtJgdz.Text = dt.Rows[0]["hy_deptAdd"].ToString();
                this.txtOrgDesc.Text = dt.Rows[0]["hy_deptDetail"].ToString();
                this.txtOrgId.Text = dt.Rows[0]["hy_deptid"].ToString();
                this.txtOrgName.Text = dt.Rows[0]["hy_deptname"].ToString();
                this.dr_isenabled.SelectedValue = dt.Rows[0]["hy_isenabled"].ToString();
                this.txtFuzheMan.Text = dt.Rows[0]["hy_fzr"].ToString();
                this.txtFuzheTel.Text = dt.Rows[0]["hy_fzrphone"].ToString();
                this.txtorder.Text = dt.Rows[0]["hy_deptsort"].ToString();
            }
        }
        else if (this.txtop.Value == "add")
        {
            //得到部门ID
            getDetpId();
        }
    }
    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bool flag = false;
        HyDept HyDept = new HyDept();
        HyDept.hy_deptAdd = this.txtJgdz.Text;
        HyDept.hy_deptDetail = this.txtOrgDesc.Text;
        HyDept.hy_deptid = this.txtOrgId.Text;
        HyDept.hy_deptname = this.txtOrgName.Text;
        HyDept.hy_deptsort = 1;
        HyDept.hy_isenabled = this.dr_isenabled.SelectedValue;
        HyDept.hy_fzr = this.txtFuzheMan.Text;
        HyDept.hy_fzrphone = this.txtFuzheTel.Text;
        if (this.txtop.Value == "add")
        {
            flag = HyDept.insert();
        }
        else if (this.txtop.Value == "modify")
        {
            flag = HyDept.Update();
        }
        if (flag)
        {
            Response.Write("<script>alert('保存成功！');window.location='OrgList.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
        }
        else
        {
            Response.Write("<script>alert('保存失败，请联系管理员！');window.location='OrgList.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
        }
    }
    //得到部门id
    private void getDetpId()
    {
        DataTable dt = new DataTable();
        string lsdeptid;
        //如果传入了部门ID  则说明是下级部门  如果没有传入  说明是一级部门
        if (this.Request.QueryString["deptid"] == "")
        {
            //部门ID为空，说明是第一级部门                
            dt = HyDept.GetFirstdeptsOrderByDeptid();
            if (dt.Rows.Count > 0)
            {
                //判断当前部门是不是有数据的
                lsdeptid = (System.Int32.Parse(dt.Rows[0]["hy_deptid"].ToString()) + 1).ToString();
                if (lsdeptid.Length == 1)
                {
                    this.txtOrgId.Text = "00" + lsdeptid;
                }
                else if (lsdeptid.Length == 2)
                {
                    this.txtOrgId.Text = "0" + lsdeptid;
                }
                else
                {
                    this.txtOrgId.Text = lsdeptid;
                }
            }
            else
            {
                this.txtOrgId.Text = "001";
            }

        }
        else
        {
            //部门ID不为空，说明不是第一级部门                
            dt = HyDept.GetSubDeptsOrderByDeptid(this.Request.QueryString["deptid"].ToString());
            if (dt.Rows.Count > 0)
            {
                //判断当前部门是不是有数据的
                lsdeptid = (long.Parse(dt.Rows[0]["hy_deptid"].ToString()) + 1).ToString();
                this.txtOrgId.Text = this.Request.QueryString["deptid"].ToString() + lsdeptid.Substring(lsdeptid.Length - 3, 3).ToString();
            }
            else
            {
                this.txtOrgId.Text = this.Request.QueryString["deptid"].ToString() + "001";
            }
        }
    }
}