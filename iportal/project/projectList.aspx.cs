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
using Maticsoft;
using TPortalClass;

public partial class projectList : System.Web.UI.Page
{
    protected int totalCount;
    protected int page = 1;
    protected int pageSize;
    protected string ls_url = "projectList.aspx";
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
        pageSize = GetPageSize(10); //每页数量
        if (!Page.IsPostBack)
        {
            if (this.Request.QueryString["txtNmae"] != null)
            {
                this.txtNmae.Text = this.Request.QueryString["txtNmae"].ToString();
            }
            //获取数据
            RptBind();
        }
    }
    // 数据绑定
    private void RptBind()
    {
        HyCommon HyCommon = new HyCommon();
        //获取当前页数
        if (this.Request.QueryString["page"] != null)
        {
            this.page = int.Parse(HyCommon.Filter(this.Request.QueryString["page"].ToString()));
        }
        this.txtPageNum.Text = this.pageSize.ToString();
        project dtExpert = new project();
        string strWhere = "";
        if (this.txtNmae.Text.Trim() != "")
        {
            strWhere += "  and projectNmae like '%" + this.txtNmae.Text.Trim() + "%'";
        }
        //获取数据
        DataSet dt = dtExpert.GetDataPage(this.pageSize, this.page, strWhere);
        //获取数据条数
        this.totalCount = dtExpert.GetList(strWhere).Tables[0].Rows.Count;
        this.lblcount.Text = totalCount.ToString();
        rptList.DataSource = dt;
        rptList.DataBind();
        //地址传递数据
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}&txtNmae={2}", "__id__", System.Guid.NewGuid().ToString(), this.txtNmae.Text);
        PageContent.InnerHtml = HyCommon.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
    }
    //关健字查询
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}&txtNmae={2}", this.page.ToString(), System.Guid.NewGuid().ToString(), this.txtNmae.Text);
        Response.Redirect(pageUrl);
    }
    //批量删除
    protected void btndelinfo_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        project project = new project();
        String[] v_uids = this.txtuids.Value.Split(',');
        for (int i = 0; i < v_uids.Length; i++)
        {
            project.id = v_uids[i];
            project.Delete();
        }
        string pageUrl = HyCommon.CombUrlTxt("exportList.aspx", "page={0}&rnd={1}", "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "");
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>tip('数据已经被成功删除！','" + pageUrl + "');</script>");
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
        Response.Redirect(HyCommon.CombUrlTxt(ls_url, "rnd={1}&txtNmae={2}", System.Guid.NewGuid().ToString(), this.txtNmae.Text));
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
}


