﻿using System;
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

public partial class SysManage_main_xgmm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (this.Request.QueryString["userid"] != null)
            {
                this.txtUid.Text = this.Request.QueryString["userid"].ToString();
                HyUser HyUser = new HyUser();
                DataTable dt = HyUser.Getuserbyuserid(this.txtUid.Text);
                if (dt.Rows.Count > 0)
                {
                    this.txtUname.Text = dt.Rows[0]["hy_username"].ToString();
                }
            }
        }
    }

    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        HyUser Users = new HyUser();
        String password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtoldpwd.Text, "MD5");
        if (!Users.Login(this.txtUid.Text, password))
        {
            this.Response.Write("<script language=javascript>alert('输入旧密码不正确！')</script>");
            return;
        }
        
        String newpwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtnewpwd.Text, "MD5");
        
        if (Users.DoChPwd(this.txtUid.Text, newpwd))
        {
            //写系统日志
            HyCommon HyCommon = new HyCommon();
            HyCommon.WriteLog("修改密码", "修改密码", this.txtUid.Text, this.txtUname.Text);
            this.Response.Write("<script language=javascript>alert('修改密码成功！');window.location='main_xgmm.aspx?rnd=" + System.Guid.NewGuid().ToString() + "';</script>");
        }
        else
        {
            this.Response.Write("<script language=javascript>alert('修改密码失败！');window.location='main_xgmm.aspx?rnd=" + System.Guid.NewGuid().ToString() + "';</script>");
        }
    }

}


