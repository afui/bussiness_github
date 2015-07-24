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

public partial class ggdy_Hy_SetRoleByRole : System.Web.UI.Page
{
    public string pis_roleid()
    {
        string ls_retrun = "";
        if (this.Request.QueryString["roleid"] != null)
        {
            ls_retrun = this.Request.QueryString["roleid"].ToString();
        }
        return ls_retrun;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["uid"].ToString() == "")
            this.Response.Redirect("../login.aspx");

        if (!this.IsPostBack)
        {
            if (this.Request.QueryString["roleid"] != null)
            {
                this.txtroleid.Value = this.Request.QueryString["roleid"].ToString();
            }
        }
    }

    //保存
    protected void Button_Save_Click(object sender, EventArgs e)
    {
        //先删除当前权限ID下边所有的用户
        HyRoleuser HyRoleuser = new HyRoleuser();
        HyRoleuser.DeleteAllbyroleid(this.txtroleid.Value);

        //添加选中的用户
        string[] v_uids = this.txtuserids.Value.Split('+');
        for (int i = 0; i < v_uids.Length; i++)
        {
            if (v_uids[i] != "")
            {
                HyRoleuser.ID = System.Guid.NewGuid().ToString();
                HyRoleuser.hy_roleid = this.txtroleid.Value;
                HyRoleuser.hy_userid = v_uids[i];
                HyRoleuser.Insert();
            }
        }
        Response.Write("<script>alert('保存成功！');self.close();</script>");
    }
}
