using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TPortalClass;

public partial class center : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"].ToString() == "")
        {
            this.Response.Redirect("login.aspx?url=" + this.Request.RawUrl.ToString());
        }
        else
        {
            HyUser HyUser = new HyUser();
            DataTable dt = HyUser.Getuserbyuserid(this.Session["uid"].ToString());
            if (dt.Rows.Count > 0)
            {
                lbluserinfo.Text = dt.Rows[0]["hy_username"].ToString();
            }
            webname.Text = "";
            weburl.Text = "";
            webcompany.Text = "宁波合益信息科技有限公司";
            dbname.Text = "";
            versions.Text = "";
            //读取登录信息
            //HySyslogs HySyslogs = new HySyslogs();
            //DataTable dt_log = HySyslogs.Getlogs();
            //if (dt_log.Rows.Count > 0)
            //{
            //    litIP.Text = dt_log.Rows[0]["hy_oppip"].ToString();
            //}
            //if (dt_log.Rows.Count > 1)
            //{
            //    litBackIP.Text = dt_log.Rows[1]["hy_oppip"].ToString();
            //    litBackTime.Text = dt_log.Rows[1]["hy_createtime"].ToString();
            //}
        }
       
    }
}