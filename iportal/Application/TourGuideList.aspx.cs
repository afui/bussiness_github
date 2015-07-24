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

public partial class TourGuideList : System.Web.UI.Page
{
    protected int totalCount;
    protected int page = 1;
    protected int pageSize;
    protected string ls_url = "TourGuideList.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断session
        //if (this.Session["uid"] != null)
        //{
        //    if (this.Session["uid"].ToString() == "")
        //    {
        //        this.Response.Redirect("../login.aspx");
        //    }
        //}
        //else
        //{
        //    this.Response.Redirect("../login.aspx");
        //}
        pageSize = GetPageSize(10); //每页数量
        if (!Page.IsPostBack)
        {
            //从url中获取值
            if (this.Request.QueryString["txtname"] != null)
            {
                this.txtName.Text = this.Request.QueryString["txtname"].ToString();
            }
            if (this.Request.QueryString["ddl_sex"] != null)
            {
                this.ddl_sex.SelectedValue = this.Request.QueryString["ddl_sex"].ToString();
            }
            if (this.Request.QueryString["ddl_grade"] != null)
            {
                this.ddl_grade.SelectedValue = this.Request.QueryString["ddl_grade"].ToString();
            }
            if (this.Request.QueryString["ddl_properties"] != null)
            {
                this.ddl_properties.SelectedValue = this.Request.QueryString["ddl_properties"].ToString();
            }
            if (this.Request.QueryString["ddl_recommend"] != null)
            {
                this.ddl_recommend.SelectedValue = this.Request.QueryString["ddl_recommend"].ToString();
            }
            if (this.Request.QueryString["txt_nonumber"] != null)
            {
                this.txt_nonumber.Text = this.Request.QueryString["txt_nonumber"].ToString();
            }
            if (this.Request.QueryString["txttx_guideNo"] != null)
            {
                this.txttx_guideNo.Text = this.Request.QueryString["txttx_guideNo"].ToString();
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
        ZJ_TourGuide ZJ_TourGuide = new ZJ_TourGuide();
        //对类字段进行赋值
        ZJ_TourGuide.Name = this.txtName.Text;
        ZJ_TourGuide.Gender = this.ddl_sex.SelectedValue;
        ZJ_TourGuide.DYLevel = this.ddl_grade.SelectedValue;
        ZJ_TourGuide.NatureOfWork = this.ddl_properties.SelectedValue;
        ZJ_TourGuide.rep1 = this.ddl_recommend.SelectedValue;
        ZJ_TourGuide.IdentityCertificate = this.txt_nonumber.Text;
        ZJ_TourGuide.CardID = this.txttx_guideNo.Text;
        //获取数据
        DataTable dt = ZJ_TourGuide.getDataPage(pageSize, page);
        this.totalCount = ZJ_TourGuide.getDataCount();
        this.lblcount.Text = totalCount.ToString();
        rptList.DataSource = dt;
        rptList.DataBind();
        //地址传递数据
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}&txtname={2}&ddl_sex={3}&ddl_grade={4}&ddl_properties={5}&ddl_recommend={6}&txt_nonumber={7}&txttx_guideNo={8}", "__id__", System.Guid.NewGuid().ToString(), this.txtName.Text, this.ddl_sex.SelectedValue, this.ddl_grade.SelectedValue, this.ddl_properties.SelectedValue, this.ddl_recommend.SelectedValue, this.txt_nonumber.Text, this.txttx_guideNo.Text);
        PageContent.InnerHtml = HyCommon.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
    }
    //关健字查询
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        string pageUrl = HyCommon.CombUrlTxt(ls_url, "page={0}&rnd={1}&txtname={2}&ddl_sex={3}&ddl_grade={4}&ddl_properties={5}&ddl_recommend={6}&txt_nonumber={7}&txttx_guideNo={8}", this.page.ToString(), System.Guid.NewGuid().ToString(), this.txtName.Text, this.ddl_sex.SelectedValue, this.ddl_grade.SelectedValue, this.ddl_properties.SelectedValue, this.ddl_recommend.SelectedValue, this.txt_nonumber.Text, this.txttx_guideNo.Text);
        Response.Redirect(pageUrl);
    }
    //批量删除
    protected void btndelinfo_Click(object sender, EventArgs e)
    {
        HyCommon HyCommon = new HyCommon();
        ZJ_TourGuide ZJ_TourGuide = new ZJ_TourGuide();
        String[] v_uids = this.txtuids.Value.Split(',');
        for (int i = 0; i < v_uids.Length; i++)
        {
            ZJ_TourGuide.Id = Convert.ToInt32(v_uids[i]);
            ZJ_TourGuide.delete();
        }
        string pageUrl = HyCommon.CombUrlTxt("TourGuideList.aspx", "page={0}&rnd={1}", "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "");
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
        Response.Redirect(HyCommon.CombUrlTxt(ls_url, "rnd={1}&txtname={2}&ddl_sex={3}&ddl_grade={4}&ddl_properties={5}&ddl_recommend={6}&txt_nonumber={7}&txttx_guideNo={8}", System.Guid.NewGuid().ToString(), this.txtName.Text, this.ddl_sex.SelectedValue, this.ddl_grade.SelectedValue, this.ddl_properties.SelectedValue, this.ddl_recommend.SelectedValue, this.txt_nonumber.Text, this.txttx_guideNo.Text));
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


