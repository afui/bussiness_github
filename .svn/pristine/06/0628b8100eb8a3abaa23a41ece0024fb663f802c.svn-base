using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using TPortalClass;

public partial class sqltest : System.Web.UI.Page
{
    private string strCon = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //对连接串赋值
        if (this.Session["constr"] != null)
        {
            this.txt_con.Value = this.Session["constr"].ToString();
        }
        if (!this.IsPostBack)
        {
            
            //连接数据库
            DAO db = new DAO();
            //找到库名
            string sqlSelect = " SELECT Name from Master..SysDatabases ORDER BY Name ";
            DataTable dt = new DataTable();
            try
            {
                dt = db.GetDataTable(sqlSelect);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('对不起，连接串输入有错误，sql生成器急将重置！');</script>");
                this.txt_con.Value = "";
                if (this.Session["constr"] != null)
                {
                    this.Session["constr"] = null;
                }
                Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
            }
            this.ddl_database.DataSource = dt;
            this.ddl_database.DataTextField = "name";
            this.ddl_database.DataValueField = "name";
            this.ddl_database.DataBind();
            this.ddl_database.Items.Insert(0, new ListItem("--请选择--", ""));
            this.ddl_tableid.Items.Insert(0, new ListItem("--请选择--", ""));

        }
    }
    //得到insert语句
    protected void btn_insert_Click(object sender, EventArgs e)
    {
        //显示出来
        this.lb_showsql.Text = getInsert("1");
    }
    //得到sqlparam
    protected void btn_sqlparam_Click(object sender, EventArgs e)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        DAO db = new DAO();
        //得到字段和字段类型
        string sqlSelect = "  select a.name as [name],b.name as type from syscolumns a,systypes b where a.id=object_id('" + this.ddl_tableid.SelectedValue + "') and a.xtype=b.xtype";
        if (this.txt_sql.Value != "")
        {
            //过滤条件
            string[] arrySql = txt_sql.Value.Split('#');
            string sqlWhere = "";
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
            sqlSelect += " and a.name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //开始构造
        string strInsert = " SqlParameter[] sqlparam = {";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == dt.Rows.Count - 1)
                {
                    strInsert += " <br/>  db.MakeInParam(\"@" + dt.Rows[i]["name"].ToString() + "\",SqlDbType." + getDateType(dt.Rows[i]["type"].ToString()) + "," + dt.Rows[i]["name"].ToString() + ")";
                }
                else
                {
                    strInsert += "db.MakeInParam(\"@" + dt.Rows[i]["name"].ToString() + "\",SqlDbType." + getDateType(dt.Rows[i]["type"].ToString()) + "," + dt.Rows[i]["name"].ToString() + "),<br/>";
                }
            }
            strInsert += "};";
        }
        //前台显示出来
        this.lb_showsql.Text = strInsert;
    }
    //得到update语句
    protected void btn_update_Click(object sender, EventArgs e)
    {
        string sqlWhere = "";
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段名
        string sqlSelect = " select name from syscolumns where id=object_id('" + this.ddl_tableid.SelectedValue + "') ";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
        }
        if (this.txt_where.Value != "")
        {
            string[] arrySql = txt_where.Value.Split('#');
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == 0 && sqlWhere != "")
                {
                    sqlWhere += ",'" + arrySql[i] + "',";
                }
                else if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
        }
        if (this.txt_sql.Value != "" || this.txt_where.Value != "")
        {
            sqlSelect += " and name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //开始构造update语句
        string strUpdate = "sqlUpdate=\"  update  " + this.ddl_tableid.SelectedValue + " set  ";
        if (dt.Rows.Count > 0)
        {
            int j = 1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    strUpdate += dt.Rows[0]["name"].ToString() + "=@" + dt.Rows[0]["name"].ToString();
                }
                else
                {
                    strUpdate += "," + dt.Rows[i]["name"].ToString() + "=@" + dt.Rows[i]["name"].ToString();
                }
                if (strUpdate.Length > (100 * j))
                {
                    strUpdate += "\";</br>sqlUpdate+=\"";
                    j++;
                }
            }
        }
        if (this.txt_where.Value != "")
        {
            strUpdate += " where 1=1";
            string[] arryWhere = this.txt_where.Value.Split('#');
            for (int n = 0; n < arryWhere.Length; n++)
            {
                strUpdate += " and " + arryWhere[n] + "=@" + arryWhere[n] + "";
            }
        }
        //前台显示出来
        this.lb_showsql.Text = strUpdate + "\";";
    }
    //得到分页sql
    protected void btn_fy_Click(object sender, EventArgs e)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        //构造sql语句
        string strUpdate = "  select top \"+this.PageSize.Text+\" * from  " + this.ddl_tableid.SelectedValue + " where docid not in ( select top \" + System.Int32.Parse(this.PageSize.Text) * (PageNo - 1) + \" docid from  " + this.ddl_tableid.SelectedValue + " order by hy_djsj ) order by hy_djsj ";
        this.lb_showsql.Text = strUpdate;
    }
    //得到sql的执行速度
    protected void btn_speed_Click(object sender, EventArgs e)
    {
        if (this.txt_sql.Value == "")
        {
            Response.Write("<script>alert('对不起，请输入sql语句!!!');</script>");
            return;
        }
        return;
        string sqlActive = " Declare @d Datetime Set @d=GetDate() " + this.txt_sql.Value + " Select [datetime]=DateDiff(ms,@d,GetDate()) ";
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        DataTable dt = db.GetDataTable(sqlActive);
        if (dt.Rows.Count > 0)
        {
            this.lb_showsql.Text = "SQL的执行速度为：" + dt.Rows[0]["datetime"].ToString();
        }
    }
    //得到类属性
    protected void btn_class_Click(object sender, EventArgs e)
    {
        this.lb_showsql.Text = getClass("1");
    }
    //得到赋值语句
    protected void btn_voluation_Click(object sender, EventArgs e)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段名
        string sqlSelect = "  select a.name as [name],b.name as type from syscolumns a,systypes b where a.id=object_id('" + this.ddl_tableid.SelectedValue + "') and a.xtype=b.xtype";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            string sqlWhere = "";
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
            sqlSelect += " and a.name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        string strInsert = " ";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strInsert += this.ddl_tableid.SelectedValue + "." + dt.Rows[i]["name"].ToString() + "=\"\"; <br/>";
            }
        }
        this.lb_showsql.Text = strInsert;
    }
    //得到select语句
    protected void btn_select_Click(object sender, EventArgs e)
    {
        string strSql = "";
        string sqlWhere = "";
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段名
        string sqlSelect = "  select a.name as [name],b.name as type from syscolumns a,systypes b where a.id=object_id('" + this.ddl_tableid.SelectedValue + "') and a.xtype=b.xtype";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
        }
        if (this.txt_where.Value != "")
        {
            string[] arrySql = txt_where.Value.Split('#');
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == 0 && sqlWhere != "")
                {
                    sqlWhere += ",'" + arrySql[i] + "',";
                }
                else if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
        }
        if (this.txt_sql.Value != "" || this.txt_where.Value != "")
        {
            sqlSelect += " and a.name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //构造sql语句
        string strSelect = " select  ";
        if (dt.Rows.Count > 0)
        {
            int j = 1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == dt.Rows.Count - 1)
                {
                    strSelect += dt.Rows[i]["name"].ToString();
                }
                else
                {
                    strSelect += dt.Rows[i]["name"].ToString() + ",";
                }
                if (strSelect.Length > (100 * j))
                {
                    strSelect += "</br>";
                    j++;
                }
            }
            strSelect += " from " + this.ddl_tableid.SelectedValue + " ";
            if (this.txt_where.Value != "")
            {
                strSelect += " where 1=1";
                string[] arryWhere = this.txt_where.Value.Split('#');
                for (int n = 0; n < arryWhere.Length; n++)
                {
                    strSelect += " and " + arryWhere[n] + "=@" + arryWhere[n] + "";
                }
            }
        }
        this.lb_showsql.Text = strSelect;
    }
    //依据sql中的数据类型返回c#中的sqltype
    public string getDateType(string strDateType)
    {
        string resulte = "";
        switch (strDateType)
        {
            case "int":
                resulte = "Int";
                break;
            case "varchar":
                resulte = "VarChar";
                break;
            case "bit":
                resulte = "Bit";
                break;
            case "datetime":
                resulte = "DateTime";
                break;
            case "decimal":
                resulte = "Decimal";
                break;
            case "float":
                resulte = "Float";
                break;
            case "image":
                resulte = "Image";
                break;
            case "money":
                resulte = "Money";
                break;
            case "ntext":
                resulte = "NText";
                break;
            case "nvarchar":
                resulte = "NVarChar";
                break;
            case "smalldatetime":
                resulte = "SmallDateTime";
                break;
            case "smallint":
                resulte = "SmallInt";
                break;
            case "text":
                resulte = "Text";
                break;
            case "bigint":
                resulte = "BigInt";
                break;
            case "binary":
                resulte = "Binary";
                break;
            case "char":
                resulte = "Char";
                break;
            case "nchar":
                resulte = "NChar";
                break;
            case "numeric":
                resulte = "Decimal";
                break;
            case "real":
                resulte = "Real";
                break;
            case "smallmoney":
                resulte = "SmallMoney";
                break;
            case "sql_variant":
                resulte = "Variant";
                break;
            case "timestamp":
                resulte = "Timestamp";
                break;
            case "tinyint":
                resulte = "TinyInt";
                break;
            case "uniqueidentifier":
                resulte = "UniqueIdentifier";
                break;
            case "varbinary":
                resulte = "VarBinary";
                break;
            case "xml":
                resulte = "Xml";
                break;
        }
        return resulte;
    }
    //依据sql中的数据类型返回c#中的数据类型
    public string getClassType(string strDateType)
    {
        string resulte = "";
        switch (strDateType)
        {
            case "int":
                resulte = "Int32";
                break;
            case "text":
                resulte = "string";
                break;
            case "bigint":
                resulte = "Int64";
                break;
            case "binary":
                resulte = "Byte[]";
                break;
            case "bit":
                resulte = "Boolean";
                break;
            case "char":
                resulte = "string";
                break;
            case "datetime":
                resulte = "string";
                break;
            case "decimal":
                resulte = "Decimal";
                break;
            case "float":
                resulte = "Double";
                break;
            case "image":
                resulte = "system.byte[]";
                break;
            case "money":
                resulte = "Decimal";
                break;
            case "nchar":
                resulte = "string";
                break;
            case "ntext":
                resulte = "string";
                break;
            case "numeric":
                resulte = "Decimal";
                break;
            case "nvarchar":
                resulte = "string";
                break;
            case "real":
                resulte = "Single";
                break;
            case "smalldatetime":
                resulte = "Datetime";
                break;
            case "smallint":
                resulte = "Int16";
                break;
            case "smallmoney":
                resulte = "Decimal";
                break;
            case "timestamp":
                resulte = "DateTime";
                break;
            case "tinyint":
                resulte = "Byte";
                break;
            case "uniqueidentifier":
                resulte = "Guid";
                break;
            case "varbinary":
                resulte = "Byte[]";
                break;
            case "varchar":
                resulte = "string";
                break;
            case "variant":
                resulte = "Object";
                break;
        }
        return resulte;
    }
    protected void btn_update2_Click(object sender, EventArgs e)
    {
        string sqlWhere = "";
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段名
        string sqlSelect = " select name from syscolumns where id=object_id('" + this.ddl_tableid.SelectedValue + "') ";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
        }
        if (this.txt_where.Value != "")
        {
            string[] arrySql = txt_where.Value.Split('#');
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == 0 && sqlWhere != "")
                {
                    sqlWhere += ",'" + arrySql[i] + "',";
                }
                else if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
        }
        if (this.txt_sql.Value != "" || this.txt_where.Value != "")
        {
            sqlSelect += " and name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //开始构造update语句
        string strUpdate = "  update  " + this.ddl_tableid.SelectedValue + " set  ";
        string flowid = "";
        if (dt.Rows.Count > 0)
        {
            int j = 1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                flowid = dt.Rows[i]["name"].ToString();
                if (flowid.IndexOf("hyc") != -1)
                {
                    flowid = flowid.Substring(4);
                }
                if (flowid.IndexOf("hy_") != -1)
                {
                    flowid = flowid.Substring(3);
                }
                if (i == 0)
                {
                    strUpdate += dt.Rows[0]["name"].ToString() + "='\"+this." + flowid + ".Value+\"'";
                }
                else
                {
                    strUpdate += "," + dt.Rows[i]["name"].ToString() + "='\"+this." + flowid + ".Value+\"'";
                }
                if (strUpdate.Length > (100 * j))
                {
                    strUpdate += "</br>";
                    j++;
                }
            }
        }
        if (this.txt_where.Value != "")
        {
            strUpdate += " where 1=1";
            string[] arryWhere = this.txt_where.Value.Split('#');
            for (int n = 0; n < arryWhere.Length; n++)
            {
                flowid = arryWhere[n];
                if (flowid.IndexOf("hyc") != -1)
                {
                    flowid = flowid.Substring(4);
                }
                if (flowid.IndexOf("hy_") != -1)
                {
                    flowid = flowid.Substring(3);
                }
                strUpdate += " and " + arryWhere[n] + "='\"+this." + flowid + ".Value+\"'";
            }
        }
        //前台显示出来
        this.lb_showsql.Text = strUpdate;
    }
    protected void btn_insert2_Click(object sender, EventArgs e)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return;
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段
        string sqlSelect = " select name from syscolumns where id=object_id('" + this.ddl_tableid.SelectedValue + "') ";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            string sqlWhere = "";
            //构造where条件句
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
            sqlSelect += " and name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //开始构造insert
        string strInsert = " insert into " + this.ddl_tableid.SelectedValue + "( ";
        int j = 1;
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    strInsert += dt.Rows[0]["name"].ToString();
                }
                else
                {
                    strInsert += "," + dt.Rows[i]["name"].ToString();
                }
                //对sql进行格式化
                if (strInsert.Length > (100 * j))
                {
                    strInsert += "</br>";
                    j++;
                }
            }
            strInsert += ") values ( ";
            string flowid = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                flowid = dt.Rows[i]["name"].ToString();
                if (flowid.IndexOf("hyc") != -1)
                {
                    flowid = flowid.Substring(4);
                }
                if (flowid.IndexOf("hy_") != -1)
                {
                    flowid = flowid.Substring(3);
                }
                if (i == 0)
                {
                    strInsert += "'\"+this." + flowid + ".Value+\"'";
                }
                else
                {
                    strInsert += ",'\"+this." + flowid + ".Value+\"'";
                }
                //对sql进行格式化
                if (strInsert.Length > (100 * j))
                {
                    strInsert += "</br>";
                    j++;
                }
            }
        }
        strInsert += ")";
        //显示出来
        this.lb_showsql.Text = strInsert;
    }
    protected void ddl_database_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_database.SelectedValue != "")
        {
            DAO db = new DAO();
            string sqlSelect = " SELECT Name FROM " + ddl_database.SelectedValue + "..SysObjects Where XType='U' ORDER BY Name ";
            DataTable dt = new DataTable();
            try
            {
                dt = db.GetDataTable(sqlSelect);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
                this.txt_con.Value = "";
                if (this.Session["constr"] != null)
                {
                    this.Session["constr"] = null;
                }
                Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
            }
            this.ddl_tableid.DataSource = dt;
            this.ddl_tableid.DataTextField = "name";
            this.ddl_tableid.DataValueField = "name";
            this.ddl_tableid.DataBind();
            this.ddl_tableid.Items.Insert(0, new ListItem("--请选择--", ""));
        }
        this.lb_showsql.Text = "&nbsp;";
    }
    protected void btn_cler_Click(object sender, EventArgs e)
    {
        this.txt_con.Value = "";
        if (this.Session["constr"] != null)
        {
            this.Session["constr"] = null;
        }
        Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
    }
    protected void btn_con_Click(object sender, EventArgs e)
    {
        //对session赋值
        if (this.txt_con.Value != "")
        {
            this.Session["constr"] = this.txt_con.Value;
        }
        Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
    }
    private string getClass(string strType)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return "";
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段
        string sqlSelect = "  select a.name as [name],b.name as type from syscolumns a,systypes b where a.id=object_id('" + this.ddl_tableid.SelectedValue + "') and a.xtype=b.xtype";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            string sqlWhere = "";
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
            sqlSelect += " and a.name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            throw ex;
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        string strInsert = " ";
        //构造类属性
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (strType == "1")
                {
                    strInsert += "public  " + getClassType(dt.Rows[i]["type"].ToString()) + " " + dt.Rows[i]["name"].ToString() + "; <br/>";
                }
                else
                {
                    strInsert += "public  " + getClassType(dt.Rows[i]["type"].ToString()) + " " + dt.Rows[i]["name"].ToString() + ";\r\n";
                }

            }
        }
        return strInsert;
    }
    private string getInsert(string strType)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return "";
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段
        string sqlSelect = " select name from syscolumns where id=object_id('" + this.ddl_tableid.SelectedValue + "') ";
        if (this.txt_sql.Value != "")
        {
            string[] arrySql = txt_sql.Value.Split('#');
            string sqlWhere = "";
            //构造where条件句
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
            sqlSelect += " and name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //开始构造insert
        string strInsert = " sqlInsert =\" insert into " + this.ddl_tableid.SelectedValue + "( ";
        int j = 1;
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    strInsert += dt.Rows[0]["name"].ToString();
                }
                else
                {
                    strInsert += "," + dt.Rows[i]["name"].ToString();
                }
                //对sql进行格式化
                if (strInsert.Length > (100 * j))
                {
                    if (strType == "1")
                    {
                        strInsert += "\";</br> sqlInsert +=\" ";
                    }
                    else
                    {
                        strInsert += "\";\r\nsqlInsert +=\" ";
                    }

                    j++;
                }
            }
            strInsert += ") values ( ";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    strInsert += "@" + dt.Rows[0]["name"].ToString();
                }
                else
                {
                    strInsert += ",@" + dt.Rows[i]["name"].ToString();
                }
                //对sql进行格式化
                if (strInsert.Length > (100 * j))
                {
                    if (strType == "1")
                    {
                        strInsert += "\";</br> sqlInsert +=\" ";
                    }
                    else
                    {
                        strInsert += "\";\r\nsqlInsert +=\" ";
                    }
                    j++;
                }
            }
        }
        strInsert += ") \"; ";
        return strInsert;
    }
    private string getSqlparam(string strType)
    {
        if (this.ddl_tableid.SelectedValue == "")
        {
            Response.Write("<script>alert('对不起，请输入表名!!!');</script>");
            this.lb_showsql.Text = "&nbsp;";
            return "";
        }
        if (this.txt_con.Value != "")
        {
            strCon = this.txt_con.Value;
        }
        else
        {
            strCon = "server=(local);database=" + this.ddl_database.SelectedValue + ";uid=sa;pwd=sa!@#$%^*(sa;";
        }
        DAO db = new DAO();
        //得到字段和字段类型
        string sqlSelect = "  select a.name as [name],b.name as type from syscolumns a,systypes b where a.id=object_id('" + this.ddl_tableid.SelectedValue + "') and a.xtype=b.xtype";
        if (this.txt_sql.Value != "")
        {
            //过滤条件
            string[] arrySql = txt_sql.Value.Split('#');
            string sqlWhere = "";
            for (int i = 0; i < arrySql.Length; i++)
            {
                if (i == arrySql.Length - 1)
                {
                    sqlWhere += "'" + arrySql[i] + "'";
                }
                else
                {
                    sqlWhere += "'" + arrySql[i] + "',";
                }
            }
            sqlSelect += " and a.name not in(" + sqlWhere + ") ";
        }
        DataTable dt = new DataTable();
        try
        {
            dt = db.GetDataTable(sqlSelect);
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('对不起，连接串输入有错误，系统将重置！');</script>");
            this.txt_con.Value = "";
            if (this.Session["constr"] != null)
            {
                this.Session["constr"] = null;
            }
            Response.Write("<script>window.location='" + this.Request.Url.ToString() + "';</script>");
        }
        //开始构造
        string strInsert = " SqlParameter[] sqlparam = {";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == dt.Rows.Count - 1)
                {
                    if (strType == "1")
                    {
                        strInsert += " <br/>  db.MakeInParam(\"@" + dt.Rows[i]["name"].ToString() + "\",SqlDbType." + getDateType(dt.Rows[i]["type"].ToString()) + "," + dt.Rows[i]["name"].ToString() + ")";
                    }
                    else
                    {
                        strInsert += "\r\n  db.MakeInParam(\"@" + dt.Rows[i]["name"].ToString() + "\",SqlDbType." + getDateType(dt.Rows[i]["type"].ToString()) + "," + dt.Rows[i]["name"].ToString() + ")";
                    }
                }
                else
                {
                    if (strType == "1")
                    {
                        strInsert += "db.MakeInParam(\"@" + dt.Rows[i]["name"].ToString() + "\",SqlDbType." + getDateType(dt.Rows[i]["type"].ToString()) + "," + dt.Rows[i]["name"].ToString() + "),<br/>";
                    }
                    else
                    {
                        strInsert += "db.MakeInParam(\"@" + dt.Rows[i]["name"].ToString() + "\",SqlDbType." + getDateType(dt.Rows[i]["type"].ToString()) + "," + dt.Rows[i]["name"].ToString() + "),\r\n";
                    }
                    
                }
            }
            strInsert += "};";
        }
        return strInsert;
    }
    //创建类
    public void CreateFile()
    {
        Response.Write("hello");
        string path = @"D:\MyTest.cs";

        try
        {
            if (File.Exists(path))
            {
                File.Delete(path);
            }
            // Create the file.
            using (FileStream fs = File.Create(path))
            {
                using (StreamWriter sw = new StreamWriter(fs, Encoding.UTF8))
                {
                    StringBuilder tb = new StringBuilder();
                    tb.AppendLine("using System;");
                    tb.AppendLine("using System.Collections.Generic;");
                    tb.AppendLine("using System.Text;");
                    tb.AppendLine("using System.Data;");
                    tb.AppendLine("using System.Data.SqlClient;");
                    tb.AppendLine("using System.Security.Cryptography;");
                    tb.AppendLine("using HyoaClass_conn;");
                    tb.AppendLine("using System.Data.OracleClient;");
                    //tb.AppendLine("using System;");
                    //tb.AppendLine("using System.Collections.Generic;\r\nusing System.IO;");
                    //tb.AppendLine("namespace ConsoleApplication1\r\n{\r\n}\r\n");
                    tb.AppendLine("namespace HyoaPro\r\n{");
                    tb.AppendLine("\r\npublic class hyc_Tableqqxm\r\n{");
                    //得到类属性
                    tb.AppendLine(getClass("2"));
                    //得到第一个  插入的方法
                    tb.AppendLine(" /// <summary>\r");
                    tb.AppendLine("/// 新增\r");
                    tb.AppendLine(" /// </summary>\r");
                    tb.AppendLine("/// <returns>ture or false</returns>\r");
                    tb.AppendLine("/// <returns>ture or false</returns>\r");
                    tb.AppendLine("public bool insert()\r\n{");
                    //定义状态位和写插入语句的字符串
                    tb.AppendLine("bool ret = false;\r\nstring sqlInsert = \"\";\r\n");
                    tb.AppendLine(getInsert("2"));
                    //得到连接串
                    tb.AppendLine("DAO_sql db = new DAO_sql(System.Configuration.ConfigurationManager.AppSettings[\"HYOA_SQL_PRO\"].ToString());");
                    tb.AppendLine(getSqlparam("2"));

                    sw.WriteLine(tb);
                }
            }
        }
        catch (Exception Ex)
        {
            Console.WriteLine(Ex.ToString());
        }
    }
    protected void btn_getClass_Click(object sender, EventArgs e)
    {
        CreateFile();
    }
}