using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace Banking_System.Objects
{
   
    // Base class for Bank entity
    public class Bank
    {
        public int BankID { get; set; }
        public string BankName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
    }

    // Base class for Customer entity
    public class Customer
    {
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }

    // Base class for Account entity
    public class Account
    {
        public Account()
        {
            AccountHoldersList = new List<Customer>(); // Initialize the List in the constructor
        }
        public int AccountID { get; set; }
        public Customer AccountHolder { get; set; }
        public List<Customer> AccountHoldersList { get; set; } // List of AccountHolders
        public Bank Bank { get; set; }
        public string AccountType { get; set; }
        public decimal Balance { get; set; }

        public Account(decimal initialBalance)
            {
                Balance = initialBalance;
            }

            public void Deposit(decimal amount)
            {
                if (amount <= 0)
                {
                    throw new ArgumentException("Deposit amount must be positive.");
                }
                Balance += amount;
            }

            public void Withdraw(decimal amount)
            {
                if (amount <= 0)
                {
                    throw new ArgumentException("Withdrawal amount must be positive.");
                }
                if (Balance < amount)
                {
                    throw new InvalidOperationException("Insufficient funds.");
    }
                Balance -= amount;
            }

    

    }

    /// Derived class for Savings Account
    public class SavingsAccount : Account
    {
        public decimal InterestRate { get; set; }

        // Method to calculate interest
        public decimal CalculateInterest()
        {
            // Implement interest calculation logic
            return Balance * InterestRate;
        }
    }

    // Derived class for Checking Account
    public class CheckingAccount : Account
    {
        public decimal OverdraftLimit { get; set; }

        // Method to perform overdraft check
        public bool IsOverdraft(decimal amount)
        {
            return (Balance - amount) < (-1 * OverdraftLimit);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Example usage
            Customer customer = new Customer()
            {
                CustomerID = 1,
                FirstName = "John",
                LastName = "Doe",
                Address = "123 Main St",
                PhoneNumber = "555-1234"
            };

            Bank bank = new Bank
            {
                BankID = 1,
                BankName = "Example Bank",
                Address = "456 Elm St",
                PhoneNumber = "555-5678"
            };

            // Creating a Savings Account
            SavingsAccount savingsAccount = new SavingsAccount
            {
                AccountID = 1,
                AccountHolder = customer,
                Bank = bank,
                AccountType = "Savings",
                Balance = 1000,
                InterestRate = 0.05m // 5%
            };

            // Creating a Checking Account
            CheckingAccount checkingAccount = new CheckingAccount
            {
                AccountID = 2,
                AccountHolder = customer,
                Bank = bank,
                AccountType = "Checking",
                Balance = 2000,
                OverdraftLimit = 500
            };

            // Example usage of polymorphism
            List<Account> accounts = new List<Account>();
            accounts.Add(savingsAccount);
            accounts.Add(checkingAccount);

            // Display account details
            foreach (var account in accounts)
            {
                Console.WriteLine($"Account ID: {account.AccountID}");
                Console.WriteLine($"Account Holder: {account.AccountHolder.FirstName} {account.AccountHolder.LastName}");
                Console.WriteLine($"Bank: {account.Bank.BankName}");
                Console.WriteLine($"Account Type: {account.AccountType}");
                Console.WriteLine($"Balance: {account.Balance:C}");
                Console.WriteLine();
            }

            // Calculate interest for savings account
            if (savingsAccount is SavingsAccount)
            {
                decimal interest = ((SavingsAccount)savingsAccount).CalculateInterest();
                Console.WriteLine($"Interest earned: {interest:C}");
            }

            // Perform overdraft check for checking account
            if (checkingAccount is CheckingAccount)
            {
                bool isOverdraft = ((CheckingAccount)checkingAccount).IsOverdraft(2500);
                Console.WriteLine($"Overdraft occurred: {isOverdraft}");
            }
        }
    }
}