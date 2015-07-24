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

public partial class ifr_rentpic : System.Web.UI.Page
{
    protected string ls_fatherid, ls_userid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["docid"] != null)
        {
            this.txtdocid.Value = this.Request.QueryString["docid"].ToString();   //修改时ID
        }
        if (this.Request.QueryString["uid"] != null)
        {
            ls_userid = this.Request.QueryString["uid"].ToString();
        }
        if (!this.IsPostBack)
        {
            ls_fatherid = this.txtdocid.Value;
            //加载图片
            LoadingPictures();
        }
        
    }

    //加载图片
    protected string LoadingPictures()
    {
        string ls_return = "";
        //预览图片
        TPortalClass.HyFileatt HyFileatt = new TPortalClass.HyFileatt();
        DataTable dt = HyFileatt.Getdocs(this.txtdocid.Value,8);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ls_id = dt.Rows[i]["id"].ToString();
                string ls_name = dt.Rows[i]["hy_filename"].ToString();
                string ls_url = dt.Rows[i]["hy_filepath"].ToString();
                //string ls_url2 = dt.Rows[i]["hy_filepath"].ToString().Replace("thumbnail", "original");

                ls_return += "<table width=\"130\" border=\"0\" cellpadding=\"0\" cellspacing=\"2\" bgcolor=\"#FFFFFF\"";
                ls_return += "style=\"float: left; margin: 2px 2px 2px 2px;font-size: 12px;\">";
                ls_return += "<tr><td align=\"left\" height=\"140\" valign=\"top\">";

                //ls_return += "<div class=\"pic01\"><a href='" + ls_url2 + "' onclick=\"szfm('" + ls_id + "');\" target='_blank'>";
                ls_return += "<div class=\"pic01\"><a href='#' onclick=\"szfm('" + ls_id + "');\" >";
                ls_return += "<img src=\"" + ls_url + "\" border=\"0\" width=\"126\" height=\"126\" alt=\"" + ls_name + "(点击设置封面)\" /></a></div>";
                ls_return += "<div class=\"photo_fm\">";
                if (HyFileatt.IsExistByID(ls_id))
                {
                    ls_return += "<img src=\"/images/fm.png\" alt='' />";
                }
                ls_return += "</div>";
                ls_return += "<div class=\"option01\"><span style='float:left;text-align:left;'>";
                if (ls_name.Length > 6)
                {
                    ls_return += "&nbsp;" + ls_name.Substring(0, 6) + "...";
                }
                else
                {
                    ls_return += "&nbsp;" + ls_name;
                }
                ls_return += "</span>";
                ls_return += "<span style='float:right;text-align:right;'><a href='#' onclick=\"DelInfo('" + ls_id + "');\">【删除】</a></span>";
                ls_return += "</div>";
                
                ls_return += "</td>";
                ls_return += "</tr>";
                ls_return += "</table>";
            }
        }
        return ls_return;
    }

    //删除图片
    protected void btndelinfo_Click(object sender, EventArgs e)
    {
        string ls_filepath1 = "", ls_filepath2 = "";
        TPortalClass.HyFileatt HyFileatt = new TPortalClass.HyFileatt();
        DataTable dt = HyFileatt.Getdocbyid(this.txtuids.Value);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["hy_fm"].ToString() == "1")
            {
                Response.Write("<script>alert('封面图片不能删除');window.location.href=window.location.href;</script>");
                return;
            }

            //删除文件夹里的图片
            ls_filepath1 = Server.MapPath("~/") + dt.Rows[0]["hy_filepath"].ToString();
            ls_filepath2 = Server.MapPath("~/") + dt.Rows[0]["hy_filepath"].ToString().Replace("thumbnail", "original");
            if (System.IO.File.Exists(ls_filepath1))
            {
                System.IO.File.Delete(ls_filepath1);
            }
            if (System.IO.File.Exists(ls_filepath2))
            {
                System.IO.File.Delete(ls_filepath2);
            }
        }

        //删除数据库记录
        HyFileatt.Delete(this.txtuids.Value);
        //操作日志
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        HyCommon.WriteLog("删除图片", "删除图片ID：" + this.txtuids.Value, this.Session["hy_id"].ToString(), this.Session["hy_name"].ToString());
        LoadingPictures();
    }

    //设置封面
    protected void btnSzfm_Click(object sender, EventArgs e)
    {
        TPortalClass.HyFileatt HyFileatt = new TPortalClass.HyFileatt();
        DataTable dt = HyFileatt.Getdocsfm(this.txtdocid.Value);
        if (dt.Rows.Count > 0)
        {
            HyFileatt.id = dt.Rows[0]["id"].ToString();
            HyFileatt.hy_fm = 0;
            HyFileatt.UpdateFM();
        }

        HyFileatt.id = this.txtfmid.Value;
        HyFileatt.hy_fm = 1;
        HyFileatt.UpdateFM();
        
        //操作日志
        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();
        HyCommon.WriteLog("设置封面", "设置封面图片ID：" + this.txtdocid.Value, this.Session["hy_id"].ToString(), this.Session["hy_name"].ToString());
        LoadingPictures();
    }

}
