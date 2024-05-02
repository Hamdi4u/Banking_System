using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Banking_System.Objects;
using System.Data;
using System.Web.Security;
namespace Banking_System
{
    public partial class CreateAccount : System.Web.UI.Page
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
        public DataTable DbCustomersAccounts
        {
            get { return (DataTable)ViewState["CustomersAccounts"]; }
            set { ViewState["CustomersAccounts"] = value; }
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
        protected void Page_Load(object sender, EventArgs e)
        {

          
          

            if (!Page.IsPostBack)
            {
               
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                CustomerID = Convert.ToInt32(Request.QueryString["CustomerID"]);
                DatabaseManager Db = new DatabaseManager();

                if (Session["Username"] != null)
                { txtUserName.Value = Session["Username"].ToString();

         
                        GVaccount.DataSource = GetCustomerAccounts();
                        GVaccount.DataBind();
                  
              


                }
                if (CustomerID > 0)
                {
                  

                    DataTable dt = Db.GetCustomerAccountById(CustomerID);

                    foreach (DataRow row in dt.Rows)
                    {
                        txtFirstName.Value = row["FirstName"].ToString();
                        txtLastName.Value = row["LastName"].ToString();
                        txtEmail.Value = row["Email"].ToString();
                        txtUserName.Value = row["UserName"].ToString();
                        txtPhoneNumber.Value = row["PhoneNumber"].ToString();
                        txtAddress.Value = row["Address"].ToString();
                        ddlAccountType.Value = row["AccountType"].ToString();
                        txtInitialBalance.Value = row["Balance"].ToString();

                    }

                    //ddlAccountType.DataSource = Db.GetCustomerAccountById(CustomerID);
                    //ddlAccountType.DataTextField = "AccountType";
                    //ddlAccountType.DataValueField = "AccountID";
                    //ddlAccountType.DataBind();

                }

             

            }




        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {

            Account BankAccountInfo = new Account();

          


            BankAccountInfo.AccountHolder = new Customer();
            BankAccountInfo.Bank = new Bank();
            BankAccountInfo.Bank.BankID = 1;
            BankAccountInfo.AccountHolder.Email = txtEmail.Value;
            BankAccountInfo.AccountHolder.UserName = txtUserName.Value;
            BankAccountInfo.AccountHolder.FirstName = txtFirstName.Value;
            BankAccountInfo.AccountHolder.LastName = txtLastName.Value;
            BankAccountInfo.AccountHolder.PhoneNumber = txtPhoneNumber.Value;
            BankAccountInfo.AccountHolder.Address = txtAddress.Value;
            BankAccountInfo.Balance = Convert.ToDecimal(txtInitialBalance.Value);
            BankAccountInfo.AccountType = ddlAccountType.Value;
            BankAccountInfo.AccountHolder.Password = "12345678";


            if (CustomerID > 0)

            {
                //Update Customer and Account type Info.
                BankAccountInfo.AccountID = AccountID;
                BankAccountInfo.AccountHolder.CustomerID = CustomerID;

                Db.EditAccountDetails(BankAccountInfo);
                GVaccount.DataSource = GetCustomerAccounts();
                GVaccount.DataBind();


            }

            else
            {

              
            
                    BankAccountInfo.AccountHolder.CustomerID = Db.InsertCustomer(BankAccountInfo);
                   // Db.Insert_User(BankAccountInfo);
                     
                    Db.CreateNewAccount(BankAccountInfo);
                    GVaccount.DataSource = GetCustomerAccounts();
                    GVaccount.DataBind();
              

            }
          
           

        }

       

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {

            CustomerID = Convert.ToInt32(e.CommandName);
            AccountID = Convert.ToInt32(e.CommandArgument);
            btnCreate.Text = "Save";
            txtInitialBalance.Disabled = true;
    

            DataTable dt = Db.GetCustomerAccountById(CustomerID);

            foreach (DataRow row in dt.Rows)
            {
                txtFirstName.Value = row["FirstName"].ToString();
                txtLastName.Value = row["LastName"].ToString();
                txtEmail.Value = row["Email"].ToString();
                txtUserName.Value = row["UserName"].ToString();
                txtPhoneNumber.Value = row["PhoneNumber"].ToString();
                txtAddress.Value = row["Address"].ToString();
                ddlAccountType.Value = row["AccountType"].ToString();
                txtInitialBalance.Value = row["Balance"].ToString();
                //Response.Redirect("~/AccountManagement.aspx?" + e.CommandName);
            }
        }


        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {

           
            AccountID = Convert.ToInt32(e.CommandName);
          
         
           string message= Db.CloseAccount(AccountID);
            if (message != string.Empty)
            {
                divWarning.Visible = true;
                lblWarning.Text = message;
            }

        }

        protected void GVaccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVaccount.PageIndex = e.NewPageIndex;
            GVaccount.DataSource = GetCustomerAccounts();
            GVaccount.DataBind();
        }

        protected void GVaccount_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //Checking the RowType of the Row  
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkDelete = e.Row.FindControl("lnkDelete") as LinkButton;
                string Username = Session["Username"].ToString();

                    if (Username == "Admin".ToLower())
                    {
                    lnkDelete.Visible = true;
                    }
                    else
                    {
                    lnkDelete.Visible = false;
                    }
                   


            }

        }
    }
    
}