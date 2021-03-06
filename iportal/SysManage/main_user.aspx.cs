﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TPortalClass;

public partial class Admin_Organ_main_user : System.Web.UI.Page
{
    HyDept HyDept = new HyDept();
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断session
        if (this.Session["uid"] != null)
        {
            if (this.Session["uid"].ToString() == "")
            {
                this.Response.Redirect("../login.aspx");
            }
        }
        else
        {
            this.Response.Redirect("../login.aspx");
        }
        if (!this.IsPostBack)
        {
            RptBind();
        }
    }
    // 检查权限
    private void ChkRole(string Roleid)
    {
    }
    // 数据绑定
    private void RptBind()
    {
        if (this.Request.QueryString["op"] != null)
        {
            this.txtop.Value = this.Request.QueryString["op"].ToString();           //新增还是修改
            //新文档
            if (this.txtop.Value == "add")
            {
                //根据部门ID得到部门名称
                HyDept Hyoa_dept = new HyDept();
                DataTable dtdept = Hyoa_dept.Getdept(this.hy_deptid.Text);
                if (dtdept.Rows.Count > 0)
                {
                    this.hy_deptname.Text = dtdept.Rows[0]["hy_deptname"].ToString();
                    dtdept.Clear();
                    //自动获取最大排序号，然后+2
                    HyUser Hyoa_user = new HyUser();
                    DataTable dt_maxsort = Hyoa_user.GetMaxusersortbydept(this.hy_deptid.Text);
                    if (dt_maxsort.Rows.Count > 0)
                    {
                        this.txtuserno.Value = (int.Parse(dt_maxsort.Rows[0]["hy_sort"].ToString()) + 2).ToString();
                    }
                    else
                    {
                        this.txtuserno.Value = "1";
                    }
                }
            }
            //旧文档
            if (this.txtop.Value == "modify")
            {
                if (this.Request.QueryString["id"] != null)
                {
                    //根据用户ID得到信息
                    this.txtid.Text = this.Request.QueryString["id"].ToString();
                    TPortalClass.HyUser Hyoa_user = new TPortalClass.HyUser();
                    DataTable dtuser = Hyoa_user.Getuserallinfobyid(this.txtid.Text);
                    if (dtuser.Rows.Count > 0)
                    {
                        this.txtuserid.Text = dtuser.Rows[0]["hy_userid"].ToString();
                        this.txtusername.Value = dtuser.Rows[0]["hy_username"].ToString();
                        this.hy_deptid.Text = dtuser.Rows[0]["hy_deptid"].ToString();
                        this.hy_deptname.Text = dtuser.Rows[0]["hy_deptname"].ToString();
                        this.txtposition.Value = dtuser.Rows[0]["hy_post"].ToString();
                        this.txtofficetel.Value = dtuser.Rows[0]["hy_officetel"].ToString();
                        this.txtmobile.Value = dtuser.Rows[0]["hy_mobile"].ToString();
                        this.txtvirtualtel.Value = dtuser.Rows[0]["hy_virtualnumber"].ToString();
                        this.txtuserno.Value = dtuser.Rows[0]["hy_sort"].ToString();
                        this.ddlisenabled.SelectedValue = dtuser.Rows[0]["hy_isenabled"].ToString();
                        if (dtuser.Rows[0]["hy_birthday"] != null)
                        {
                            if (dtuser.Rows[0]["hy_birthday"].ToString() != "" && System.DateTime.Parse(dtuser.Rows[0]["hy_birthday"].ToString()).ToString("yyyy-MM-dd") != "1900-01-01")
                                this.txtbirthday.Value = System.DateTime.Parse(dtuser.Rows[0]["hy_birthday"].ToString()).ToString("yyyy-MM-dd");
                        }
                        this.txtfjh.Value = dtuser.Rows[0]["hy_fjh"].ToString();
                        this.ddlxb.SelectedValue = dtuser.Rows[0]["hy_xb"].ToString();
                        this.txtzzmm.Value = dtuser.Rows[0]["hy_zzmm"].ToString();
                        this.txtxl.Value = dtuser.Rows[0]["hy_xl"].ToString();
                        this.txtbyyx.Value = dtuser.Rows[0]["hy_byyx"].ToString();
                        if (dtuser.Rows[0]["hy_jdwsj"] != null)
                        {
                            if (dtuser.Rows[0]["hy_jdwsj"].ToString() != "" && System.DateTime.Parse(dtuser.Rows[0]["hy_jdwsj"].ToString()).ToString("yyyy-MM-dd") != "1900-01-01")
                                this.txtjdwsj.Value = System.DateTime.Parse(dtuser.Rows[0]["hy_jdwsj"].ToString()).ToString("yyyy-MM-dd");
                        }
                        this.txtjtzz.Value = dtuser.Rows[0]["hy_jtzz"].ToString();
                        this.txtsfzhm.Value = dtuser.Rows[0]["hy_sfzhm"].ToString();
                        this.txtjsids2.Text = dtuser.Rows[0]["hy_jsids"].ToString();
                        this.txtjsnames2.Text = dtuser.Rows[0]["hy_jsnames"].ToString();
                    }
                    dtuser.Clear();
                    this.txtuserid.Enabled = false;
                }
            }
        }
    }
    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ls_tip = "保存成功！";
        //新文档时        
        HyUser Hyoa_user = new HyUser();
        if (this.txtop.Value == "add")
        {
            //先判断这个用户是否已经存在
            DataTable dtjudge = Hyoa_user.Getuserbyuserid(this.txtuserid.Text);
            if (dtjudge.Rows.Count > 0)
            {
                Response.Write("<script>alert('该用户名已注册，请重新注册！');history.back();</script>");
                return;
            }
            else
            {
                Hyoa_user.id = System.Guid.NewGuid().ToString();
                Hyoa_user.hy_loginuid = this.txtuserid.Text;
                Hyoa_user.hy_userid = this.txtuserid.Text;
                Hyoa_user.hy_deptid = this.hy_deptid.Text;
                Hyoa_user.hy_username = this.txtusername.Value;
                Hyoa_user.hy_post = this.txtposition.Value;
                Hyoa_user.hy_ifleader = "";
                Hyoa_user.hy_officetel = this.txtofficetel.Value;
                Hyoa_user.hy_hometel = "";
                Hyoa_user.hy_mobile = this.txtmobile.Value;
                Hyoa_user.hy_virtualnumber = this.txtvirtualtel.Value;
                Hyoa_user.hy_sort = float.Parse(this.txtuserno.Value);
                Hyoa_user.hy_isenabled = this.ddlisenabled.SelectedValue.ToString();
                Hyoa_user.hy_createtime = System.DateTime.Now.ToString();
                Hyoa_user.hy_edittime = System.DateTime.Now.ToString();
                Hyoa_user.hy_birthday = this.txtbirthday.Value;
                Hyoa_user.hy_ifsrtx = "";
                Hyoa_user.hy_fjh = this.txtfjh.Value;
                Hyoa_user.hy_xb = this.ddlxb.SelectedValue;
                Hyoa_user.hy_zzmm = this.txtzzmm.Value;
                Hyoa_user.hy_xl = this.txtxl.Value;
                Hyoa_user.hy_byyx = this.txtbyyx.Value;
                Hyoa_user.hy_jdwsj = this.txtjdwsj.Value;
                Hyoa_user.hy_jtzz = this.txtjtzz.Value;
                Hyoa_user.hy_sfzhm = this.txtsfzhm.Value;
                Hyoa_user.hy_bz = "";
                Hyoa_user.hy_jsids = "";
                Hyoa_user.hy_jsnames = "";
                Hyoa_user.hy_field1 = "";
                Hyoa_user.hy_field2 = "";
                Hyoa_user.hy_field3 = "";
                Hyoa_user.hy_field4 = "";
                Hyoa_user.hy_field5 = "";
                //处理完成后的提示及跳转
                if (Hyoa_user.Insert())
                {
                    Response.Write("<script>alert('保存成功！');window.location='list_user.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
                }
                else
                {
                    Response.Write("<script>alert('保存失败，请联系管理员！');window.location='list_user.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
                }
                //写新增人员系统日志start
                TPortalClass.HySyslogs Hyoa_log = new TPortalClass.HySyslogs();
                Hyoa_log.ID = System.Guid.NewGuid().ToString();
                Hyoa_log.hy_createtime = System.DateTime.Now.ToString();
                string userip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (userip == null || userip == "")
                {
                    userip = Request.ServerVariables["REMOTE_ADDR"];
                }
                Hyoa_log.hy_oppip = userip;
                Hyoa_log.hy_opptype = "新增";
                Hyoa_log.hy_oppcontent = "新增用户：" + this.txtusername.Value;
                Hyoa_log.hy_oppuserid = this.Session["uid"].ToString();
                Hyoa_log.hy_oppusername = this.Session["uname"].ToString();
                Hyoa_log.Insert();
            }
        }
        else if (this.txtop.Value == "modify")
        {
            Hyoa_user.id = this.txtid.Text;
            Hyoa_user.hy_loginuid = this.txtuserid.Text;
            Hyoa_user.hy_userid = this.txtuserid.Text;
            Hyoa_user.hy_deptid = this.hy_deptid.Text;
            Hyoa_user.hy_username = this.txtusername.Value;
            Hyoa_user.hy_post = this.txtposition.Value;
            Hyoa_user.hy_ifleader = "";
            Hyoa_user.hy_officetel = this.txtofficetel.Value;
            Hyoa_user.hy_hometel = "";
            Hyoa_user.hy_mobile = this.txtmobile.Value;
            Hyoa_user.hy_virtualnumber = this.txtvirtualtel.Value;
            Hyoa_user.hy_sort = float.Parse(this.txtuserno.Value);
            Hyoa_user.hy_isenabled = this.ddlisenabled.SelectedValue.ToString();
            Hyoa_user.hy_edittime = System.DateTime.Now.ToString();
            Hyoa_user.hy_birthday = this.txtbirthday.Value;
            Hyoa_user.hy_ifsrtx = "";
            Hyoa_user.hy_fjh = this.txtfjh.Value;
            Hyoa_user.hy_xb = this.ddlxb.SelectedValue;
            Hyoa_user.hy_zzmm = this.txtzzmm.Value;
            Hyoa_user.hy_xl = this.txtxl.Value;
            Hyoa_user.hy_byyx = this.txtbyyx.Value;
            Hyoa_user.hy_jdwsj = this.txtjdwsj.Value;
            Hyoa_user.hy_jtzz = this.txtjtzz.Value;
            Hyoa_user.hy_sfzhm = this.txtsfzhm.Value;
            Hyoa_user.hy_bz = "";
            Hyoa_user.hy_jsids = "";
            Hyoa_user.hy_jsnames = "";
            Hyoa_user.hy_field1 = "";
            Hyoa_user.hy_field2 = "";
            Hyoa_user.hy_field3 = "";
            Hyoa_user.hy_field4 = "";
            Hyoa_user.hy_field5 = "";
            //处理完成后的提示及跳转
            if (Hyoa_user.Update())
            {
                Response.Write("<script>alert('保存成功！');window.location='list_user.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
            }
            else
            {
                Response.Write("<script>alert('保存失败，请联系管理员！');window.location='list_user.aspx?rend=" + System.Guid.NewGuid().ToString() + "';</script>");
            }

            //写新增人员系统日志start
            TPortalClass.HySyslogs Hyoa_log = new TPortalClass.HySyslogs();
            Hyoa_log.ID = System.Guid.NewGuid().ToString();
            Hyoa_log.hy_createtime = System.DateTime.Now.ToString();
            string userip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (userip == null || userip == "")
            {
                userip = Request.ServerVariables["REMOTE_ADDR"];
            }
            Hyoa_log.hy_oppip = userip;
            Hyoa_log.hy_opptype = "修改";
            Hyoa_log.hy_oppcontent = "修改用户：" + this.txtusername.Value;
            Hyoa_log.hy_oppuserid = this.Session["uid"].ToString();
            Hyoa_log.hy_oppusername = this.Session["uname"].ToString();
            Hyoa_log.Insert();

        }
    }
}