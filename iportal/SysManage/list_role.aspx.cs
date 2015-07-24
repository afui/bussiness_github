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

public partial class list_role : System.Web.UI.Page
{
    protected int totalCount;
    protected int page = 1;
    protected int pageSize;
    protected string keywords = string.Empty;
    protected string ls_url = "list_role.aspx";
    HyRole HyRole = new HyRole();
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
            if (this.Request.QueryString["keywords"] != null)
            {
                this.txtKeywords.Text = this.Request.QueryString["keywords"].ToString();
            }
            if (this.Request.QueryString["deptid"] != null)
            {
                this.txtdeptid.Value = this.Request.QueryString["deptid"].ToString();
            }
            pageSize = GetPageSize(10); //每页数量
            if (!Page.IsPostBack)
            {
                RptBind();
                ChkRole("Role0008");    //检查权限
            }
        }
    }
    // 检查权限=================================
    private void ChkRole(string Roleid)
    {
    }
    // 数据绑定
    private void RptBind()
    {
        HyCommon HyCommon = new HyCommon();
        if (this.Request.QueryString["page"] != null)
        {
            this.page = int.Parse(HyCommon.Filter(this.Request.QueryString["page"].ToString()));
        }
        this.txtPageNum.Text = this.pageSize.ToString();
        DataTable dt = new DataTable();
        HyRole.hy_rolename = HyCommon.Filter(this.txtKeywords.Text);
        dt = HyRole.SearchdocsByKey(page, pageSize);
        totalCount = HyRole.getDataCount();
        this.lblcount.Text = totalCount.ToString();
        rptList.DataSource = dt;
        rptList.DataBind();
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}&keywords={2}", "__id__", System.Guid.NewGuid().ToString(), this.txtKeywords.Text);
        PageContent.InnerHtml = HyCommon.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);


    }
    //删除
    protected void btndelinfo_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}", page.ToString(), System.Guid.NewGuid().ToString());
        string ls_tip = "删除成功！";
        String[] v_uids = this.txtuids.Value.Split(',');
        HyRole HyRole = new HyRole();
        for (int i = 0; i < v_uids.Length; i++)
        {
            HyRole.hy_roleid = v_uids[i];
            HyRole.Delete();
        }
        //写系统日志
        HyCommon.WriteLog("删除", "删除机构记录", Session["uid"].ToString(), Session["uname"].ToString());
        Response.Write("<script>alert('" + ls_tip + "');window.location='" + pageUrl + "';</script>");
    }
    //关健字查询
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}&keywords={2}", page.ToString(), System.Guid.NewGuid().ToString(), this.txtKeywords.Text);
        Response.Redirect(pageUrl);
    }
    //设置分页数量
    protected void txtPageNum_TextChanged(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        int _pagesize;
        if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
        {
            if (_pagesize > 0)
            {
                HyCommon.WriteCookie("page_size", _pagesize.ToString(), 43200);
            }
        }
        Response.Redirect(HyCommon.CombUrlTxt(ls_url, "rnd={1}&keywords={2}", System.Guid.NewGuid().ToString(), this.txtKeywords.Text));
    }
    // 返回图文每页数量
    private int GetPageSize(int _default_size)
    {
        HyCommon HyCommon = new HyCommon();
        int _pagesize;
        if (int.TryParse(HyCommon.GetCookie("page_size"), out _pagesize))
        {
            if (_pagesize > 0)
            {
                return _pagesize;
            }
        }
        return _default_size;
    }

    public string getRoleUser(string RoleId)
    {
        //Getroleusersbyroleid
        string RoleUser = "";
        HyRoleuser HyRoleuser = new HyRoleuser();
        DataTable dt = HyRoleuser.getRoleUserNameByRoleid(RoleId);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == dt.Rows.Count - 1)
                {
                    RoleUser += dt.Rows[i]["hy_username"].ToString();
                }
                else
                {
                    RoleUser += dt.Rows[i]["hy_username"].ToString() + ",";
                }

            }
            if (RoleUser.Length > 10)
            {
                RoleUser = RoleUser.Substring(0, 20) + "...";
            }
        }
        return RoleUser;
    }
}
