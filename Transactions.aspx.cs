using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Banking_System.Objects;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
namespace Banking_System
{
    public partial class Transactions : System.Web.UI.Page
    {

        public DatabaseManager Db = new DatabaseManager();

        public int CustomerID
        {
            get { return (int)ViewState["CustomerID"]; }
            set { ViewState["CustomerID"] = value; }
        }

        public int AccountID
        {
            get { return (int)ViewState["AccountID"]; }
            set { ViewState["AccountID"] = value; }
        }

       
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


                CustomerID = Convert.ToInt32(Request.QueryString["CustomerID"]);






                        GVaccount.DataSource = GetCustomerAccounts();
                        GVaccount.DataBind();

                        ddlFrom.DataSource = GetCustomerAccounts();
                        ddlFrom.DataBind();

                        ddlTo.DataSource = GetCustomerAccounts();
                        ddlTo.DataBind();


                    Clear();
            }

        }

        protected void lnkDeposit_Command(object sender, CommandEventArgs e)
        {

            

            CustomerID = Convert.ToInt32(e.CommandName);
            AccountID = Convert.ToInt32(e.CommandArgument);
          
  

            DataTable dt = Db.GetCustomerAccountById(CustomerID);

            foreach (DataRow row in dt.Rows)
            {
                txtCustomerNameDeposit.Value = row["FirstName"].ToString() + " " + row["LastName"].ToString();
                ddlAccountTypeDeposit.Value = row["AccountType"].ToString();
                txtBankBalanceDeposit.Value = row["Balance"].ToString();
                ModalPopupDepositcash.Show();
              
            }
            GVaccount.DataSource = dt;
            GVaccount.DataBind();
            Clear();
        }



        protected void lnkWithdraw_Command(object sender, CommandEventArgs e)
        {



            CustomerID = Convert.ToInt32(e.CommandName);
            AccountID = Convert.ToInt32(e.CommandArgument);



            DataTable dt = Db.GetCustomerAccountById(CustomerID);

            foreach (DataRow row in dt.Rows)
            {
              
                txtCustomerNameWithdraw.Value = row["FirstName"].ToString() +" "+ row["LastName"].ToString();
                ddlAccountTypeWithdraw.Value = row["AccountType"].ToString();
                txtBankBalanceWithdraw.Value = row["Balance"].ToString();
                ModalPopupWithdrawcash.Show();

            }

            GVaccount.DataSource = dt;
            GVaccount.DataBind();
            Clear();
        }

        protected void btnWithdrawcash_Click(object sender, EventArgs e)
        {

           
      
            Decimal Amount = Convert.ToDecimal(txtAmontWithdraw.Value);

            try
            {

                string message =Db.WithdrawCashWithRealTimeUpdate(AccountID, Amount);

                if(message != string.Empty)
                {
                    divWarning.Visible = true;
                    lblWarning.Text = message;
                }
               
               
            }
            catch(SqlException ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
               

            }
            GVaccount.DataSource = GetCustomerAccounts();
            GVaccount.DataBind();

        }

        protected void btnDepositCash_Click(object sender, EventArgs e)
        {
            



            Decimal Amount = Convert.ToDecimal(txtAmountDeposit.Value);

            Db.DepositCashWithReceipt(AccountID, Amount);

            GVaccount.DataSource = GetCustomerAccounts();
            GVaccount.DataBind();
          
        }



       public void Clear()
        {
            divWarning.Visible = false;
            lblWarning.Text = "";
            DivError.Visible = false;
            Divsuccess.Visible = false;

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
           

            DateTime Startdate = Convert.ToDateTime(txtStartDate.Text);
            DateTime Endtdate = Convert.ToDateTime(txtEndDate.Text);
            Decimal Amount = Convert.ToDecimal(txtSearchAmount.Value);
            string TransactionsType = ddlTransactiontype.Value;

            GVTransaction.DataSource = Db.GetTransactionHistoryWithFilters(Startdate, Endtdate, TransactionsType, Amount, Amount);
            GVTransaction.DataBind();



        }

        protected void btnTransfere_Click(object sender, EventArgs e)
        {
            int AccountFrom = Convert.ToInt32(ddlFrom.SelectedValue);
            int AccountTo = Convert.ToInt32(ddlTo.SelectedValue);
            decimal AmountFunds = Convert.ToDecimal(txtAmountFund.Value);
            string message = "";
            try
            {

                message= Db.TransferFundsWithinSameBank(AccountFrom, AccountTo, AmountFunds);
               

                if (message== "Funds transferred successfully.")
                {  Divsuccess.Visible = true;
                    DivError.Visible = false;
                    lblSuccess.Text = message;
                }

                else
                {
                    Divsuccess.Visible = false;
                    lblError.Text = message;
                    DivError.Visible = true;
                }


            }
            catch (SqlException ex)
            {
                message = ex.Message;
                Divsuccess.Visible = false;
                lblError.Text = message;
                DivError.Visible = true;
            }

            GVaccount.DataSource = GetCustomerAccounts();
            GVaccount.DataBind();

        }

        protected void GVaccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVaccount.PageIndex = e.NewPageIndex;
            GVaccount.DataSource = GetCustomerAccounts();
            GVaccount.DataBind();
        }

        protected void GVTransaction_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVTransaction.PageIndex = e.NewPageIndex;
            DateTime Startdate = Convert.ToDateTime(txtStartDate.Text);
            DateTime Endtdate = Convert.ToDateTime(txtEndDate.Text);
            Decimal Amount = Convert.ToDecimal(txtSearchAmount.Value);
            string TransactionsType = ddlTransactiontype.Value;

            GVTransaction.DataSource = Db.GetTransactionHistoryWithFilters(Startdate, Endtdate, TransactionsType, Amount, Amount);
            GVTransaction.DataBind();
        }
    }
}