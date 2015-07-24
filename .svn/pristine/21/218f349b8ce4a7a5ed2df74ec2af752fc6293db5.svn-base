using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class SysManage_list_log : System.Web.UI.Page
{
    protected int totalCount;
    protected int page;
    protected int pageSize;
    protected string keyword_s = string.Empty;
    protected string keyword_e = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null || this.Session["uid"].ToString() == "")
        {
            this.Response.Redirect("../login.aspx");
        }

        if (this.Request.QueryString["keyword_s"] != null)
            this.keyword_s = this.Request.QueryString["keyword_s"].ToString();

        if (this.Request.QueryString["keyword_e"] != null)
            this.keyword_e = this.Request.QueryString["keyword_e"].ToString();

        this.pageSize = 10; //每页数量
        if (!Page.IsPostBack)
        {
            ChkRole();
            RptBind();
        }
    }

    #region 检查权限=================================
    private void ChkRole()
    {
    }
    #endregion

    #region 数据绑定=================================
    private void RptBind()
    {
        if (this.Request.QueryString["page"] != null)
            this.page = int.Parse(this.Request.QueryString["page"].ToString());
        else
            this.page = 1;

        this.txtdate_s.Text = this.keyword_s;
        this.txtdate_e.Text = this.keyword_e;
        txtPageNum.Text = this.pageSize.ToString();
        txtPage.Text = this.page.ToString();

        TPortalClass.HySyslogs HySyslogs = new TPortalClass.HySyslogs();

        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        string ls_kssj = this.txtdate_s.Text;
        string ls_jssj = this.txtdate_e.Text;

        DataTable dt = HySyslogs.Getlogs_search(ls_kssj, ls_jssj);
        this.totalCount = dt.Rows.Count;
        DataTable tempTable = dt.Clone();
        for (int i = (this.page - 1) * this.pageSize; i < this.page * this.pageSize; i++)
        {
            if (i > dt.Rows.Count - 1)
                break;

            DataRow dr = tempTable.NewRow();
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                dr[dt.Columns[j].ColumnName] = dt.Rows[i][j];
            }
            tempTable.Rows.Add(dr);
        }
        rptList.DataSource = tempTable;
        rptList.DataBind();

        string pageUrl = HyCommon.CombUrlTxt("list_log.aspx", "page={0}&rnd={1}&keyword_s={2}&keyword_e={3}",
            "__id__", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtdate_s.Text + "", "" + this.txtdate_e.Text + "");
        PageContent.InnerHtml = HyCommon.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
    }
    #endregion

    //关健字查询
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        string pageUrl = HyCommon.CombUrlTxt("list_log.aspx", "rnd={0}&keyword_s={1}&keyword_e={2}",
            "" + System.Guid.NewGuid().ToString() + "", "" + this.txtdate_s.Text + "", "" + this.txtdate_e.Text + "");
        Response.Redirect(pageUrl);
    }

    //批量删除
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        TPortalClass.HySyslogs HySyslogs = new TPortalClass.HySyslogs();
        string ls_tip = "删除成功！";
        for (int i = 0; i < rptList.Items.Count; i++)
        {
            //int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
            string id = ((HiddenField)rptList.Items[i].FindControl("hidId")).Value;
            CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
            if (cb.Checked)
            {
                HySyslogs.ID = id;
                HySyslogs.Delete();
            }
        }
        string pageUrl = HyCommon.CombUrlTxt("list_log.aspx", "page={0}&rnd={1}&keyword_s={2}&keyword_e={3}",
            "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtdate_s.Text + "", "" + this.txtdate_e.Text + "");

        HyCommon.WriteLog("删除", "批量删除操作日志记录", Session["uid"].ToString(), Session["uname"].ToString());
        Response.Write("<script>alert('" + ls_tip + "');window.location='" + pageUrl + "';</script>");
    }

}


