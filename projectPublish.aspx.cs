using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class projectPublish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        project project = new project();
        project.id = System.Guid.NewGuid().ToString();
        project.projectNmae = this.txtName.Value;
        project.investorID = "";
        project.inveestorNmae = "";
        project.publishID = "";
        project.publishName = "";
        project.publishTime = DateTime.Now;
        project.projectAdress = this.txtPath.Value;
        project.projcetSummary = this.txtDetail.Value;
        project.projcetKeyword = this.txtKeyWords.Value;
        string strCheckValue = "";
        if (getCheckBox(this.ck_net) != "")
        {
            strCheckValue += getCheckBox(this.ck_net) + "#";
        }
        if (getCheckBox(this.ck_move) != "")
        {
            strCheckValue += getCheckBox(this.ck_move) + "#";
        }
        if (getCheckBox(this.ck_medicene) != "")
        {
            strCheckValue += getCheckBox(this.ck_medicene) + "#";
        }
        if (getCheckBox(this.ck_finance) != "")
        {
            strCheckValue += getCheckBox(this.ck_finance) + "#";
        }
        if (getCheckBox(this.ck_education) != "")
        {
            strCheckValue += getCheckBox(this.ck_education) + "#";
        }
        if (getCheckBox(this.ck_equipment) != "")
        {
            strCheckValue += getCheckBox(this.ck_equipment) + "#";
        }
        if (getCheckBox(this.ck_furniture) != "")
        {
            strCheckValue += getCheckBox(this.ck_furniture) + "#";
        }
        if (getCheckBox(this.ck_energy) != "")
        {
            strCheckValue += getCheckBox(this.ck_energy) + "#";
        }
        if (getCheckBox(this.ck_agriculture) != "")
        {
            strCheckValue += getCheckBox(this.ck_agriculture) + "#";
        }
        if (getCheckBox(this.ck_others) != "")
        {
            strCheckValue += getCheckBox(this.ck_others) + "#";
        }

        project.industry = strCheckValue;
        project.projectDetail = this.txtProjectDetail.Value;
        project.financing = Convert.ToDecimal(this.txtAmount.Value);
        project.phoneNumber = this.txtPhone.Value;
        project.eamil = this.txtEmail.Value;
        project.video = this.txtMoviePath.Value;
        project.teamDetail = this.txtdt_summary.Value;
        project.ifHot = false;
        project.projectState = "发布";
        project.Add();
        Response.Write("<script>alert('发布项目成功！');</script>");
    }

    private string getCheckBox(HtmlInputCheckBox check)
    {
        string strValue = "";
        if (check.Checked)
        {
            strValue = check.Value;
        }
        return strValue;
    }
}