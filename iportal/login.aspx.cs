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

public partial class login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["uid"] = "";
            Session["uname"] = "";
            Session["deptid"] = "";
            Session["deptname"] = "";
            Session["ip"] = "";
            Session["isadmin"] = "";
            Session["pwd"] = "";
            int pos = Request.RawUrl.IndexOf("?url=");
            if (pos > 0)
                //跳转到的页面
                lblurl.Text = Request.RawUrl.Substring(Request.RawUrl.IndexOf("?url=") + 5);
            else
                lblurl.Text = "index.aspx";
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        String pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(this.pwd.Text, "MD5");
        HyUser HyUser = new HyUser();
        HyCommon HyCommon = new HyCommon();
        if (Session["SESSION_CODE"].ToString().ToLower().Equals(this.txtCode.Text.ToLower()))
        {
            if (HyUser.Login(this.user.Text, pwd))
            {
                DataTable dt = HyUser.Getuserbyuserid(this.user.Text);
                if (dt.Rows.Count > 0)
                {
                    Session["uid"] = dt.Rows[0]["hy_userid"].ToString();
                    Session["uname"] = dt.Rows[0]["hy_username"].ToString();
                    Session["deptid"] = dt.Rows[0]["hy_deptid"].ToString();
                }
                //写系统日志
                string userip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (userip == null || userip == "")
                {
                    userip = Request.ServerVariables["REMOTE_ADDR"];
                }
                //写系统日志
                HyCommon.WriteLog("登录", "系统登录", Session["uid"].ToString(), Session["uname"].ToString());
                //跳转到首页
                Response.Redirect(lblurl.Text);
            }
            else
            {
                Response.Write("<script>alert('输入的用户名或者密码不正确！');window.location.href = window.location.href;</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('输入的验证码不正确！');window.location.href = window.location.href;</script>");
        }
    }
}