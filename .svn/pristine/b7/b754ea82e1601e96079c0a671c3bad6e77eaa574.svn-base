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

public partial class ContentManage_main_content : System.Web.UI.Page
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
                //this.txturl.Value = this.Request.QueryString["url"].ToString();     //返回URL
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
        //TPortalClass.HySysroleuser HySysroleuser = new TPortalClass.HySysroleuser();
        //if (HySysroleuser.isHaveRole(Roleid, this.Session["uid"].ToString()) == true || HySysroleuser.isHaveRole("Role9999", this.Session["uid"].ToString()) == true)
        //{
        //    btnSubmit.Visible = true;
        //}
        //else
        //{
        //    btnSubmit.Visible = false;
        //}
    }
    #endregion

    private void DataPlay()
    {
        if (this.Request.QueryString["op"] != null)
        {
            this.txtop.Value = this.Request.QueryString["op"].ToString();           //新增还是修改
        }
        if (this.Request.QueryString["cid"] != null)
        {
            this.txtcid.Value = this.Request.QueryString["cid"].ToString();     //类别ID
            TPortalClass.HyCategory HyCategory = new TPortalClass.HyCategory();
            DataTable cdt = HyCategory.Getdocbyid(this.txtcid.Value);
            if (cdt.Rows.Count > 0)
            {
                this.lbltype.Text = cdt.Rows[0]["hy_cname"].ToString();

            }
        }
        if (this.Request.QueryString["id"] != null)
        {
            this.txtid.Value = this.Request.QueryString["id"].ToString();     //文档ID
        }
        TPortalClass.HyContent HyContent = new TPortalClass.HyContent();
        //新文档
        if (this.txtop.Value == "add")
        {
            this.txtpubtime.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
        }
        //旧文档
        if (this.txtop.Value == "modify")
        {
            DataTable dt = HyContent.Getdocbyid(int.Parse(this.txtid.Value));
            if (dt.Rows.Count > 0)
            {
                this.txttitle.Text = dt.Rows[0]["hy_title"].ToString();
                this.content1.Value = dt.Rows[0]["hy_contentcol"].ToString();
                this.txtpubtime.Text = DateTime.Parse(dt.Rows[0]["hy_addTime"].ToString()).ToString("yyyy-MM-dd");
            }
        }
    }

    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null || this.Session["uid"].ToString() == "")
        {
            this.Response.Redirect("../login.aspx");
        }

        string ls_tip = "保存成功！";

        TPortalClass.HyContent HyContent = new TPortalClass.HyContent();
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();

        HyContent.hy_typeid = this.txtcid.Value;
        HyContent.hy_addTime = this.txtpubtime.Text;
        HyContent.hy_title = this.txttitle.Text;
        HyContent.hy_contentcol = this.content1.Value;

        if (this.txtop.Value == "modify")
        {
            HyContent.ID = System.Int32.Parse(this.txtid.Value);
            //写系统日志
            HyCommon.WriteLog("修改", "修改文章记录[id:" + this.txtid.Value + "]", Session["uid"].ToString(), Session["uname"].ToString());

            HyContent.Update();
        }
        else
        {
            //for (int i = 0; i < 1000; i++)
            //{
            //    HyContent.hy_title = this.txttitle.Text + i;
            //    HyContent.Insert();
            //}

            //检查文章是否重复
            if (!HyContent.IsExist())
            {
                //写系统日志
                HyCommon.WriteLog("新增", "新增文章记录[id:" + this.txtid.Value + "]", Session["uid"].ToString(), Session["uname"].ToString());

                HyContent.Insert();
            }
            else
            {
                this.Response.Write("<script>alert('您添加的标题重复了，请重试！');window.location.href = window.location.href;</script>");
                return;
            }
        }
        Response.Write("<script>alert('" + ls_tip + "');window.location='" + this.txturl.Value + "'</script>");
        return;
    }

}


