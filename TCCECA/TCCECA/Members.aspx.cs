using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace TCCECA
{
    public partial class Members : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        SqlDataAdapter da;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        SqlConnection con;

        public void BindData()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MembershipConnection"].ConnectionString);
            cmd.CommandText = "Select UserId, UserName, Firstname, LastName from Users";
            cmd.Connection = con;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Open();
            cmd.ExecuteNonQuery();
            Grid.DataSource = ds;
            Grid.DataBind();
            con.Close();
        }
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            Grid.EditItemIndex = e.Item.ItemIndex;
            BindData();
        }

        protected void Grid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
              SqlConnection con;
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["MembershipConnection"].ConnectionString);
            SqlCommand cmd;
            cmd = new SqlCommand("Update Users Set UserName = '" + ((TextBox)e.Item.Cells[1].Controls[0]).Text + "', Firstname = '" +
                ((TextBox)e.Item.Cells[2].Controls[0]).Text + "', Lastname = '" + ((TextBox)e.Item.Cells[3].Controls[0]).Text +
                "' where UserId='" + ((TextBox)e.Item.Cells[0].Controls[0]).Text + "';");
            cmd.Connection = con;
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            Grid.EditItemIndex = -1;
            BindData();
        }
    }
}