using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using System.Data;
using System.Data.SqlClient;
using Banking_System.Objects;
namespace Banking_System.Objects
{
    public class DatabaseManager
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.
    ConnectionStrings["connectionString"].ConnectionString;


        public DatabaseManager()
        {
            this.connectionString = this.connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        }

        public int InsertCustomer(Account BankAccountInfo)
        {
            int CustomerId = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("InsertCustomer", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserName", BankAccountInfo.AccountHolder.UserName);
                    command.Parameters.AddWithValue("@FirstName", BankAccountInfo.AccountHolder.FirstName);
                    command.Parameters.AddWithValue("@LastName", BankAccountInfo.AccountHolder.LastName);
                    command.Parameters.AddWithValue("@Address", BankAccountInfo.AccountHolder.Address);
                    command.Parameters.AddWithValue("@Email", BankAccountInfo.AccountHolder.Email);
                    command.Parameters.AddWithValue("@PhoneNumber", BankAccountInfo.AccountHolder.PhoneNumber);
                    command.Parameters.Add("@CustomerID", SqlDbType.Int).Direction = ParameterDirection.Output;
                    // Define the CustomerID parameter as Output

                    connection.Open();
                    command.ExecuteNonQuery();

                    CustomerId = Convert.ToInt32(command.Parameters["@CustomerID"].Value.ToString());

                }

            }
            return CustomerId;
        }

        public int Insert_User(Account BankAccountInfo)
        {
            int CustomerId = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Insert_User", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@UserName", BankAccountInfo.AccountHolder.UserName);
                    command.Parameters.AddWithValue("@Password", BankAccountInfo.AccountHolder.Address);
                    command.Parameters.AddWithValue("@Email", BankAccountInfo.AccountHolder.Email);
                 
                    // Define the CustomerID parameter as Output

                    connection.Open();
                    command.ExecuteNonQuery();

                  

                }

            }
            return CustomerId;
        }




        public void EditAccountDetails(Account BankAccountInfo)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                   
                    // Update customer information if provided
                    if (!string.IsNullOrEmpty(BankAccountInfo.AccountHolder.FirstName) && !string.IsNullOrEmpty(BankAccountInfo.AccountHolder.LastName) && !string.IsNullOrEmpty(BankAccountInfo.AccountHolder.Address) && !string.IsNullOrEmpty(BankAccountInfo.AccountHolder.PhoneNumber))
                    {
                        using (SqlCommand command = new SqlCommand("EditAccountDetails", connection, transaction))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@AccountID", BankAccountInfo.AccountID);
                            command.Parameters.AddWithValue("@NewAccountType", BankAccountInfo.AccountType);
                            command.Parameters.AddWithValue("@NewFirstName", BankAccountInfo.AccountHolder.FirstName);
                            command.Parameters.AddWithValue("@NewLastName", BankAccountInfo.AccountHolder.LastName);
                            command.Parameters.AddWithValue("@NewAddress", BankAccountInfo.AccountHolder.Address);
                            command.Parameters.AddWithValue("@NewEmail", BankAccountInfo.AccountHolder.Email);
                            command.Parameters.AddWithValue("@NewPhoneNumber", BankAccountInfo.AccountHolder.PhoneNumber);
                            command.ExecuteNonQuery();
                        }
                    }

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"An error occurred: {ex.Message}");
                    transaction.Rollback();
                }
            }
        }

        public void CreateNewAccount(Account BankAccountInfo)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Add account details
                    using (SqlCommand command = new SqlCommand("CreateNewAccount", connection, transaction))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@CustomerID", BankAccountInfo.AccountHolder.CustomerID);
                        command.Parameters.AddWithValue("@BankID", BankAccountInfo.Bank.BankID);
                        command.Parameters.AddWithValue("@AccountType", BankAccountInfo.AccountType);
                        command.Parameters.AddWithValue("@InitialBalance", BankAccountInfo.Balance);
                        command.ExecuteNonQuery();
                    }

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"An error occurred: {ex.Message}");
                    transaction.Rollback();
                }
            }
        }

        public string CloseAccount(int accountID)
        {
            string ErrorMessage = "";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("CloseAccount", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    command.Parameters.Add("@ErrorMessage", SqlDbType.VarChar, 255);
                    command.Parameters["@ErrorMessage"].Direction = ParameterDirection.Output;

                    connection.Open();
                    command.ExecuteNonQuery();
                    ErrorMessage = command.Parameters["@ErrorMessage"].Value.ToString();
                }
            }

            return ErrorMessage;
        }


        public void DepositCashWithReceipt(int accountID, decimal amount)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("DepositCashWithReceipt", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    command.Parameters.AddWithValue("@Amount", amount);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }


        public DataTable GetTransactionHistoryWithFilters(DateTime? startDate, DateTime? endDate, string transactionType, decimal? minAmount, decimal? maxAmount)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("GetTransactionHistoryWithFilters", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                  
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@EndDate", endDate);
                    command.Parameters.AddWithValue("@TransactionType", transactionType);
                    command.Parameters.AddWithValue("@MinAmount", minAmount);
                    command.Parameters.AddWithValue("@MaxAmount", maxAmount);

                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }


        public string TransferFundsWithinSameBank(int sourceAccountID, int destinationAccountID, decimal amount)
        {
            string ErrorMessage = "";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("TransferFundsWithinSameBank", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@SourceAccountID", sourceAccountID);
                    command.Parameters.AddWithValue("@DestinationAccountID", destinationAccountID);
                    command.Parameters.AddWithValue("@Amount", amount);
                    command.Parameters.Add("@ErrorMessage", SqlDbType.VarChar, 255);
                    command.Parameters["@ErrorMessage"].Direction = ParameterDirection.Output;
                    connection.Open();
                    command.ExecuteNonQuery();
                    ErrorMessage = command.Parameters["@ErrorMessage"].Value.ToString();
                }
            }

            return ErrorMessage;
        }

        public string WithdrawCashWithRealTimeUpdate(int accountID, decimal amount)
        {
            string ErrorMessage = "";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("WithdrawCashWithRealTimeUpdate", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    command.Parameters.AddWithValue("@Amount", amount);
                    command.Parameters.Add("@ErrorMessage", SqlDbType.VarChar, 255);
                    command.Parameters["@ErrorMessage"].Direction = ParameterDirection.Output;

                    connection.Open();
                    command.ExecuteNonQuery();
                    ErrorMessage=command.Parameters["@ErrorMessage"].Value.ToString();
                }
            }

            return ErrorMessage;
        }


       


        public DataTable GetCustomerAccount(string Username)
        {
            
         

            // Create a connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a command to execute the stored procedure
                using (SqlCommand command = new SqlCommand("GetCustomerAccount", connection))
                {
                    command.Parameters.AddWithValue("@Username", Username);
                    command.CommandType = CommandType.StoredProcedure;

                   

                    // Open the connection
                    connection.Open();

                    // Execute the command
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Create a DataTable to hold the data
                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader); // Load data from SqlDataReader to DataTable

                        // Close the SqlDataReader
                        reader.Close();

                        // Bind the DataTable to the GridView
                        return dataTable;
                    }
                }
            }
        }

        public DataTable GetCustomerAccountByManagers()
        {



            // Create a connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a command to execute the stored procedure
                using (SqlCommand command = new SqlCommand("GetCustomerAccountByManagers", connection))
                {

                    command.CommandType = CommandType.StoredProcedure;



                    // Open the connection
                    connection.Open();

                    // Execute the command
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Create a DataTable to hold the data
                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader); // Load data from SqlDataReader to DataTable

                        // Close the SqlDataReader
                        reader.Close();

                        // Bind the DataTable to the GridView
                        return dataTable;
                    }
                }
            }
        }

        public DataTable GetCustomerAccountById(int CustomerId)
        {



            // Create a connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a command to execute the stored procedure
                using (SqlCommand command = new SqlCommand("GetCustomerAccountById", connection))
                {

                 //Add parameter for CustomerID
                command.Parameters.AddWithValue("@CustomerID", CustomerId);
                    command.CommandType = CommandType.StoredProcedure;



                    // Open the connection
                    connection.Open();

                    // Execute the command
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Create a DataTable to hold the data
                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader); // Load data from SqlDataReader to DataTable

                        if(dataTable.Rows.Count > 0)
                        {


                        }
                        // Close the SqlDataReader
                        reader.Close();

                        // Bind the DataTable to the GridView
                        return dataTable;
                    }
                }
            }
        }




   






    }


    }











