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

public partial class CategoryManage_list_category : System.Web.UI.Page
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
        //TPortalClass.HySysroleuser HySysroleuser = new TPortalClass.HySysroleuser();
        //if (HySysroleuser.isHaveRole(Roleid, this.Session["uid"].ToString()) == true || HySysroleuser.isHaveRole("Role9999", this.Session["uid"].ToString()) == true)
        //{
        //    tdnewdoc.Visible = true;
        //    //btnSave.Visible = true;
        //    btnDelete.Visible = true;
        //}
        //else
        //{
        //    tdnewdoc.Visible = false;
        //    //btnSave.Visible = false;
        //    btnDelete.Visible = false;
        //}
    }
    #endregion

    ////美化列表
    //protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
    //    {
    //        Literal LitFirst = (Literal)e.Item.FindControl("LitFirst");
    //        HiddenField hidLayer = (HiddenField)e.Item.FindControl("hidId");
    //        //string LitStyle = "<span style=width:{0}px;text-align:right;display:inline-block;>{1}{2}</span>";
    //        string LitImg1 = "<img src=../images/index/images/folder_open.gif align=absmiddle />";
    //        string LitImg2 = "<img src=../images/index/images/t.gif align=absmiddle />";

    //        int classLayer = Convert.ToInt32(hidLayer.Value.Length / 3);
    //        if (classLayer == 1)
    //        {
    //            LitFirst.Text = LitImg1;
    //        }
    //        else
    //        {
    //            LitFirst.Text = "";
    //            for (int i = 0; i < (classLayer - 1); i++)
    //            {
    //                LitFirst.Text += LitImg2;
    //            }                
    //            LitFirst.Text += LitImg1;
    //        }
    //    }
    //}

    #region 数据绑定=================================
    private void RptBind()
    {
        if (this.Request.QueryString["page"] != null)
            this.page = int.Parse(this.Request.QueryString["page"].ToString());
        else
            this.page = 1;

        if (this.Request.QueryString["cid"] != null)
            this.txtcid_url.Text = this.Request.QueryString["cid"].ToString();

        //如果depid等于空，则返回按钮隐藏
        if (this.Request.QueryString["cid"] == null || this.Request.QueryString["cid"] == "")
        {
            this.fhsjlb.Visible = false;
        }

        //this.txtKeywords.Text = this.keywords;
        txtPageNum.Text = this.pageSize.ToString();
        txtPage.Text = this.page.ToString();

        TPortalClass.HyCategory HyCategory = new TPortalClass.HyCategory();
        DataTable dt = new DataTable();

        if (this.txtcid_url.Text == "")
        {
            //列出一级类别 0001
            dt = HyCategory.GetFirstlevCategory("0", page, pageSize); 
            this.totalCount = HyCategory.GetFirstlevCategoryNum("0");
        }
        else
        {
            //列出子级类别 00010001....
            dt = HyCategory.GetSubCategory(this.txtcid_url.Text, "0", page, pageSize);
            this.totalCount = HyCategory.GetSubCategoryNum(this.txtcid_url.Text, "0");
        }

        rptList.DataSource = dt;
        rptList.DataBind();

        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        string pageUrl = HyCommon.CombUrlTxt("list_category.aspx", "page={0}&rnd={1}&cid={2}",
            "__id__", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtcid_url.Text + "");
        PageContent.InnerHtml = HyCommon.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
    }
    #endregion

    //关健字查询
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //TPortalClass.JpCommon JpCommon = new TPortalClass.JpCommon();
        //string pageUrl = JpCommon.CombUrlTxt("list_log.aspx", "page={0}&rnd={1}&keyword_s={2}&keyword_e={3}",
        //    "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtdate_s.Text + "", "" + this.txtdate_e.Text + "");
        //Response.Redirect(pageUrl);
    }

    //转到第几页
    protected void btnGoto_Click(object sender, EventArgs e)
    {
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        string pageUrl = HyCommon.CombUrlTxt("list_category.aspx", "page={0}&rnd={1}&cid={2}",
            this.txtGotoPage.Text, System.Guid.NewGuid().ToString(), this.txtcid_url.Text);
        Response.Redirect(pageUrl);
    }

    ////保存排序
    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
    //    TPortalClass.HyCategory HyCategory = new TPortalClass.HyCategory();
    //    for (int i = 0; i < rptList.Items.Count; i++)
    //    {
    //        //int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
    //        string id = ((HiddenField)rptList.Items[i].FindControl("hidId")).Value;
    //        int sortId;
    //        if (!int.TryParse(((TextBox)rptList.Items[i].FindControl("txtSortId")).Text.Trim(), out sortId))
    //        {
    //            sortId = 99;
    //        }
    //        HyCategory.UpdateSort(id, sortId);
    //    }
    //    string pageUrl = HyCommon.CombUrlTxt("list_category.aspx", "page={0}&rnd={1}&cid={2}",
    //        "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtcid_url.Text + "");

    //    //写系统日志
    //    HyCommon.WriteLog("保存排序", "批量保存类别排序号", Session["uid"].ToString(), Session["uname"].ToString());

    //    Response.Write("<script>alert('保存排序成功！');window.location='" + pageUrl + "';</script>");
    //}

    //批量删除
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        TPortalClass.HyCategory HyCategory = new TPortalClass.HyCategory();
        string ls_tip = "删除成功！";
        for (int i = 0; i < rptList.Items.Count; i++)
        {
            //int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
            string id = ((HiddenField)rptList.Items[i].FindControl("hidId")).Value;
            CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
            if (cb.Checked)
            {
                //判断是否还有子类别，如果有子类别不能删除
                DataTable dt_sub = HyCategory.GetAllSubColumns(id,"0");
                if (dt_sub.Rows.Count > 0)
                {
                    ls_tip = "有下一级类别的信息无法删除，请先删除下一级类别！";
                }
                else
                {
                    HyCategory.CID = id;
                    HyCategory.Delete();
                }                
            }            
        }
        string pageUrl = HyCommon.CombUrlTxt("list_category.aspx", "page={0}&rnd={1}&cid={2}",
            "" + this.txtPage.Text + "", "" + System.Guid.NewGuid().ToString() + "", "" + this.txtcid_url.Text + "");

        //写系统日志

        HyCommon.WriteLog("删除", "批量删除类别记录", Session["uid"].ToString(), Session["uname"].ToString());
        Response.Write("<script>alert('" + ls_tip + "');window.location='" + pageUrl + "';</script>");
    }

    
}


