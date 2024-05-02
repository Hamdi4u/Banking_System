using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using Banking_System.Objects;

namespace Banking_System
{
    public partial class AccountServices : System.Web.UI.Page
    {

        public DatabaseManager Db = new DatabaseManager();

        public DataTable GetCustomerAccounts()
        {
            if (Session["Username"] != null)
            {


                string Username = Session["Username"].ToString();
                if (Username != "Admin".ToLower())
                {

                    DbCustomersAccounts = Db.GetCustomerAccount(Username);

                }

                else
                {
                    DbCustomersAccounts = Db.GetCustomerAccountByManagers();

                }


            }


            return DbCustomersAccounts;
        }

        public DataTable DbCustomersAccounts
        {
            get { return (DataTable)ViewState["CustomersAccounts"]; }
            set { ViewState["CustomersAccounts"] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                DataTable dt = GetCustomerAccounts();
                GVaccount.DataSource = dt;
                GVaccount.DataBind();

              if(dt !=null)

                foreach (DataRow row in dt.Rows)
                {
                        lblCustomerName.Text = row["FirstName"].ToString() + " " + row["LastName"].ToString();


                }

            }
        }

        protected void GVaccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {GVaccount.PageIndex = e.NewPageIndex;
         GVaccount.DataSource = GetCustomerAccounts();
         GVaccount.DataBind();


         

        }

        protected void chkbox_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}