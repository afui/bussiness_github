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

public partial class CategoryManage_main_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null || this.Session["uid"].ToString() == "")
        {
            this.Response.Redirect("../login.aspx");
        }
        if (!Page.IsPostBack)
        {
            if (this.Request.QueryString["url"] != null)
            {
                string ls_url = this.Request.Url.ToString();
                this.txturl.Value = ls_url.Substring(ls_url.LastIndexOf("url=") + 4, ls_url.Length - ls_url.LastIndexOf("url=") - 4);     //返回URL
            }

            DataPlay();
            ChkRole("Role0008");    //检查权限
        }
    }

    #region 检查权限=================================
    private void ChkRole(string Roleid)
    {
    }
    #endregion

    private void DataPlay()
    {
        if (this.Request.QueryString["op"] != null)
        {
            this.txtop.Value = this.Request.QueryString["op"].ToString();           //新增还是修改
        }
        if (this.Request.QueryString["id"] != null)
        {
            this.txtcid.Text = this.Request.QueryString["id"].ToString();     //部门ID
        }
        if (this.Request.QueryString["lastid"] != null)
        {
            this.txtlastcid.Value = this.Request.QueryString["lastid"].ToString();     //上级部门ID
        }
        HyCategory HyCategory = new HyCategory();
        
        //新文档
        if (this.txtop.Value == "add")
        {
            this.txtcid.Text = HyCategory.GetMaxCid(txtlastcid.Value,"0");
            this.txtcid.Enabled = false;

            //自动获得排序号
            this.txtcsort.Text = HyCategory.GetMaxSort(txtlastcid.Value, "0");

        }
        //旧文档
        if (this.txtop.Value == "modify")
        {
            DataTable dt = HyCategory.Getdocbyid(this.txtcid.Text);
            if (dt.Rows.Count > 0)
            {
                this.txtcname.Text = dt.Rows[0]["hy_cname"].ToString();
                this.txtcsort.Text = dt.Rows[0]["hy_csort"].ToString();
            }
        }
    }

    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null)
            this.Response.Redirect("../login.aspx");

        string ls_tip = "保存成功！";

        HyCategory HyCategory = new HyCategory();
        HyCommon HyCommon = new HyCommon();

        HyCategory.CID = this.txtcid.Text;
        HyCategory.hy_cname = this.txtcname.Text;
        HyCategory.hy_csort = System.Int32.Parse(this.txtcsort.Text);
        HyCategory.hy_ctype = "0";
        HyCategory.hy_byzd1 = "";
        HyCategory.hy_byzd2 = "";
        HyCategory.hy_byzd3 = "";
        HyCategory.hy_byzd4 = "";
        if (this.txtop.Value == "add")
        {
            //写系统日志
            HyCommon.WriteLog("新增", "新增类别记录[id:" + this.txtcid.Text + "]", Session["uid"].ToString(), Session["uname"].ToString());

            HyCategory.Insert();
        }
        else
        {
            //写系统日志
            HyCommon.WriteLog("修改", "修改类别记录[id:" + this.txtcid.Text + "]", Session["uid"].ToString(), Session["uname"].ToString());

            HyCategory.Update();
        }
        Response.Write("<script>alert('" + ls_tip + "');window.location='" + this.txturl.Value + "'</script>");
    }

}


