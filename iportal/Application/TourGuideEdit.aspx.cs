using System;
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

public partial class TourGuideEdit : System.Web.UI.Page
{
    ZJ_TourGuide ZJ_TourGuide = new ZJ_TourGuide();
    protected void Page_Load(object sender, EventArgs e)
    {
        ////判断session
        //if (this.Session["uid"] != null)
        //{
        //    if (this.Session["uid"].ToString() == "")
        //    {
        //        this.Response.Redirect("../login.aspx");
        //    }
        //}
        //else
        //{
        //    this.Response.Redirect("../login.aspx");
        //}
        //得到操作类型
        if (this.Request.QueryString["op"] != null)
        {
            this.txtop.Value = this.Request.QueryString["op"].ToString();
        }
        //得到文档ID
        if (this.Request.QueryString["docid"] != null)
        {
            this.txtDocid.Value = this.Request.QueryString["docid"].ToString();
        }
        //修改时数据展示
        if (!this.IsPostBack)
        {
            RptBind();
        }

    }
    // 数据绑定
    private void RptBind()
    {
        //旧文档
        if (this.txtop.Value == "modify")
        {
            try
            {
                ZJ_TourGuide.Id = Convert.ToInt32(this.txtDocid.Value);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>fail('表单ID数据类型转换失败，请联系管理员！');</script>");
            }
            DataTable dt = ZJ_TourGuide.GetDataTableByDocid();
            if (dt.Rows.Count > 0)
            {
                //数据类型转换
                try
                {
                    this.txtAnnual.Value = Convert.ToDateTime(dt.Rows[0]["YearAuditDate"].ToString()).ToString("yyyy-MM-dd");
                }
                catch (Exception)
                {
                }
                try
                {
                    this.txtCardDate.Value = Convert.ToDateTime(dt.Rows[0]["HairpinDate"].ToString()).ToString("yyyy-MM-dd");
                }
                catch (Exception)
                {
                }
                try
                {
                    this.txtBirthday.Value = Convert.ToDateTime(dt.Rows[0]["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");
                }
                catch (Exception)
                {
                }
                //数据绑定
                this.txtCardid.Value = dt.Rows[0]["CardNumber"].ToString();
                this.txtNumber.Value = dt.Rows[0]["CardID"].ToString();
                this.txtNmae.Text = dt.Rows[0]["Name"].ToString();
                this.st_sex.Value = dt.Rows[0]["Gender"].ToString();
                this.txtIdendity.Value = dt.Rows[0]["IdentityCertificate"].ToString();
                this.txtQualification.Value = dt.Rows[0]["QualificationNO"].ToString();
                this.st_wordType.Value = dt.Rows[0]["NatureOfWork"].ToString();
                this.st_recommend.Value = dt.Rows[0]["rep1"].ToString();
                this.txtSummary.Value = dt.Rows[0]["TravelAgencyName"].ToString();
                this.txtNation.Value = dt.Rows[0]["DYNational"].ToString();
                this.st_record.Value = dt.Rows[0]["Degree"].ToString();
                this.txtCardType.Value = dt.Rows[0]["CertificateType"].ToString();
                this.txtTel.Value = dt.Rows[0]["phone"].ToString();
                this.txtEmail.Value = dt.Rows[0]["Email"].ToString();
                this.txtRegister.Value = dt.Rows[0]["LevelNO"].ToString();
                this.txtArea.Value = dt.Rows[0]["Area"].ToString();
                this.txtLanguage.Value = dt.Rows[0]["Language"].ToString();
                this.txtPhone.Value = dt.Rows[0]["Tel"].ToString();
                this.st_grade.Value = dt.Rows[0]["DYLevel"].ToString();
                this.txtPermit.Value = dt.Rows[0]["TravelAgencyNO"].ToString();
                this.txtScore.Value = dt.Rows[0]["Score"].ToString();
            }
        }
    }
    //保存
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //新文档时        
        bool flag = false;
        //数据类型转换
        ZJ_TourGuide.Remark = this.txtRemarks.Value;
        try
        {
            ZJ_TourGuide.Score = Convert.ToInt32(this.txtScore.Value);
        }
        catch (Exception)
        {
            ZJ_TourGuide.Score = 0;
        }
        ZJ_TourGuide.YearAuditDate = this.txtAnnual.Value;
        ZJ_TourGuide.HairpinDate = this.txtCardDate.Value;
        ZJ_TourGuide.DateOfBirth = this.txtBirthday.Value;
        ZJ_TourGuide.AddDate = DateTime.Now.ToString();
        ZJ_TourGuide.CardNumber = this.txtCardid.Value;
        ZJ_TourGuide.CardID = this.txtNumber.Value;
        ZJ_TourGuide.Name = this.txtNmae.Text;
        ZJ_TourGuide.Gender = this.st_sex.Value;
        ZJ_TourGuide.IdentityCertificate = this.txtIdendity.Value;
        ZJ_TourGuide.QualificationNO = this.txtQualification.Value;
        ZJ_TourGuide.NatureOfWork = this.st_wordType.Value;
        ZJ_TourGuide.rep1 = this.st_recommend.Value;
        ZJ_TourGuide.rpt2 = "";
        ZJ_TourGuide.AddUserId = "";
        ZJ_TourGuide.TravelAgencyName = this.txtSummary.Value;
        ZJ_TourGuide.DYNational = this.txtNation.Value;
        ZJ_TourGuide.Degree = this.st_record.Value;
        ZJ_TourGuide.CertificateType = this.txtCardType.Value;
        ZJ_TourGuide.phone = this.txtTel.Value;
        ZJ_TourGuide.Email = this.txtEmail.Value;
        ZJ_TourGuide.LevelNO = this.txtRegister.Value;
        ZJ_TourGuide.Area = this.txtArea.Value;
        ZJ_TourGuide.Language = this.txtLanguage.Value;
        ZJ_TourGuide.Tel = this.txtPhone.Value;
        ZJ_TourGuide.DYLevel = this.st_grade.Value;
        ZJ_TourGuide.TravelAgencyNO = this.txtPermit.Value;
        //更新
        if (this.txtop.Value == "add")
        {
            flag = ZJ_TourGuide.insert();
        }
        //修改
        else if (this.txtop.Value == "modify")
        {
            try
            {
                ZJ_TourGuide.Id = Convert.ToInt32(this.txtDocid.Value);
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>fail('文档ID数据类型转换错误，请联系管理员！');</script>");
            }
            flag = ZJ_TourGuide.Update();
        }
        if (flag)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>success();</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>fail('数据保存失败，请联系管理员！');</script>");
            return;
        }
    }
}