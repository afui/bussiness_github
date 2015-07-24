using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Text.RegularExpressions;

public partial class net_uploadPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["uploadmessage"] = "";

        Response.CacheControl = "no-cache";

        string lspath = "";
        string ls_fatherid = Request.Params["docid"].ToString();
        string ls_userid = Request.Params["userid"].ToString();

        TPortalClass.HyCommon HyCommon = new TPortalClass.HyCommon();

        if (this.Page.Request.Files.Count > 0)
        {
            int k = 0;
            if (this.Page.Request.Files.Count > 8)
            {
                k = 8;
            }
            else
            {
                k = this.Page.Request.Files.Count;
            }
            try
            {
                for (int j = 0; j < k; j++)
                {
                    HttpPostedFile uploadFile = this.Page.Request.Files[j];

                    if (uploadFile.ContentLength > 0)
                    {
                        string ls_ny = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString();
                        string ls_name = uploadFile.FileName;
                        string filename = DateTime.Now.ToString("mmddhhMMss_") + uploadFile.FileName;

                        //将附件上传到服务器目录下
                        lspath = Server.MapPath("~/");  //虚拟目录的位置
                        string lsurl1 = "/upload/original/" + ls_ny;  //原图存放的文件夹
                        string lsurl2 = "/upload/thumbnail/" + ls_ny;    //缩略图存放的文件夹
                        Directory.CreateDirectory(lspath + "/" + lsurl1);
                        Directory.CreateDirectory(lspath + "/" + lsurl2);
                        string str_path1 = lspath + "/" + lsurl1 + "/" + filename;
                        string str_path2 = lspath + "/" + lsurl2 + "/" + filename;
                        uploadFile.SaveAs(str_path1);
                        //压缩图片处理
                        HyCommon.MakeThumbnail(str_path1, str_path2, 290, 290, "WH");

                        //保存数据
                        TPortalClass.HyFileatt HyFileatt = new TPortalClass.HyFileatt();
                        HyFileatt.id = System.Guid.NewGuid().ToString();
                        HyFileatt.hy_addtime = System.DateTime.Now.ToString("yyyy-MM-dd");
                        HyFileatt.hy_fatherid = ls_fatherid;
                        HyFileatt.hy_userid = ls_userid;
                        HyFileatt.hy_filepath = lsurl2 + "/" + filename;
                        HyFileatt.hy_filesize = "";
                        if (HyFileatt.IsExist(ls_fatherid))
                        {
                            HyFileatt.hy_fm = 0;
                        }
                        else
                        {
                            HyFileatt.hy_fm = 1;
                        }
                        if (ls_name.IndexOf(".") >= 0)
                        {
                            HyFileatt.hy_filename = ls_name.Substring(0, ls_name.LastIndexOf("."));
                        }
                        else
                        {
                            HyFileatt.hy_filename = "";
                        }
                        HyFileatt.Insert();
                        //操作日志
                        
                        HyCommon.WriteLog("上传图片", "上传图片", ls_userid, ls_userid);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Message" + ex.ToString());
            }
            finally
            {
            }
        }
    }

}
