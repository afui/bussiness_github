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
using TPortalClass;

public partial class ContentManage_list_content : System.Web.UI.Page
{
    protected int totalCount;
    protected int page;
    protected int pageSize;
    protected string keywords = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null || this.Session["uid"].ToString() == "")
        {
            this.Response.Redirect("../login.aspx");
        }

        //if (this.Request.QueryString["keywords"] != null)
        //    this.keywords = this.Request.QueryString["keywords"].ToString();

        this.pageSize = 10; //每页数量
        if (!Page.IsPostBack)
        {            
            RptBind();
            ChkRole("Role0008");    //检查权限
        }
    }

    #region 检查权限=================================
    private void ChkRole(string Roleid)
    {
        //HySysroleuser HySysroleuser = new HySysroleuser();
        //if (HySysroleuser.isHaveRole(Roleid, this.Session["uid"].ToString()) == true || HySysroleuser.isHaveRole("Role9999", this.Session["uid"].ToString()) == true)
        //{
        //    tdnewdoc.Visible = true;
        //    btnDelete.Visible = true;
        //}
        //else
        //{
        //    tdnewdoc.Visible = false;
        //    btnDelete.Visible = false;
        //}
    }
    #endregion

    #region 数据绑定=================================
    private void RptBind()
    {
        if (this.Request.QueryString["page"] != null)
            this.page = int.Parse(this.Request.QueryString["page"].ToString());
        else
            this.page = 1;

        if (this.Request.QueryString["cid"] != null)
            this.txtcid_url.Text = this.Request.QueryString["cid"].ToString();

        //this.txtKeywords.Text = this.keywords;
        txtPageNum.Text = this.pageSize.ToString();
        txtPage.Text = this.page.ToString();

        HyContent HyContent = new HyContent();
        DataTable dt = new DataTable();
        dt = HyContent.Getdocs(this.txtcid_url.Text, page, pageSize);
        this.totalCount = HyContent.GetdocsNum(this.txtcid_url.Text);
        //this.totalCount = dt.Rows.Count;
        //DataTable tempTable = dt.Clone();
        //for (int i = (this.page - 1) * this.pageSize; i < this.page * this.pageSize; i++)
        //{
        //    if (i > dt.Rows.Count - 1)
        //        break;

        //    DataRow dr = tempTable.NewRow();
        //    for (int j = 0; j < dt.Columns.Count; j++)
        //    {
        //        dr[dt.Columns[j].ColumnName] = dt.Rows[i][j];
        //    }
        //    tempTable.Rows.Add(dr);
        //}
        //rptList.DataSource = tempTable;
        rptList.DataSource = dt;
        rptList.DataBind();

        HyCommon HyCommon = new HyCommon();
        string pageUrl = HyCommon.CombUrlTxt("list_content.aspx", "page={0}&rnd={1}&cid={2}",
            "__id__", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtcid_url.Text + "");
        PageContent.InnerHtml = HyCommon.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
    }
    #endregion

    //关健字查询
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //HyCommon HyCommon = new HyCommon();
        //string pageUrl = JpCommon.CombUrlTxt("list_content.aspx", "page={0}&rnd={1}&keyword_s={2}&keyword_e={3}",
        //    "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtdate_s.Text + "", "" + this.txtdate_e.Text + "");
        //Response.Redirect(pageUrl);
    }

    //转到第几页
    protected void btnGoto_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        string pageUrl = HyCommon.CombUrlTxt("list_content.aspx", "page={0}&rnd={1}&cid={2}",
            this.txtGotoPage.Text, System.Guid.NewGuid().ToString(), this.txtcid_url.Text);
        Response.Redirect(pageUrl);
    }

    //批量删除
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        HyContent HyContent = new HyContent();
        string ls_tip = "删除成功！";
        for (int i = 0; i < rptList.Items.Count; i++)
        {
            //int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
            string id = ((HiddenField)rptList.Items[i].FindControl("hidId")).Value;
            CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
            if (cb.Checked)
            {
                //删除记录
                HyContent.ID = int.Parse(id);
                HyContent.Delete();

            }            
        }
        string pageUrl = HyCommon.CombUrlTxt("list_content.aspx", "page={0}&rnd={1}&cid={2}",
            "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtcid_url.Text + "");

        //写系统日志
        HyCommon.WriteLog("删除", "批量删除文章记录", Session["uid"].ToString(), Session["uname"].ToString());
        Response.Write("<script>alert('" + ls_tip + "');window.location='" + pageUrl + "';</script>");
    }

    
}


