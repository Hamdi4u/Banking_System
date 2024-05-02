//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System;
//namespace Banking_System.Objects
//{
   
//    class Account
//    {
//        private int accountNumber;
//        private double balance;

//        public Account(int accountNumber)
//        {
//            this.accountNumber = accountNumber;
//            balance = 0.0;
//        }

//        public int GetAccountNumber()
//        {
//            return accountNumber;
//        }

//        public double GetBalance()
//        {
//            return balance;
//        }

//        public void Deposit(double amount)
//        {
//            balance += amount;
//        }

//        public void Withdraw(double amount)
//        {
//            balance -= amount;
//        }
//    }

//    class Customer
//    {
//        private string name;
//        private Account account;

//        public Customer(string name, int accountNumber)
//        {
//            this.name = name;
//            account = new Account(accountNumber);
//        }

//        public string GetName()
//        {
//            return name;
//        }

//        public int GetAccountNumber()
//        {
//            return account.GetAccountNumber();
//        }

//        public double GetAccountBalance()
//        {
//            return account.GetBalance();
//        }

//        public void Deposit(double amount)
//        {
//            account.Deposit(amount);
//        }

//        public void Withdraw(double amount)
//        {
//            account.Withdraw(amount);
//        }
//    }

//    class Bank
//    {
//        private string bankName;
//        private List<Customer> customers;

//        public Bank(string name)
//        {
//            bankName = name;
//            customers = new List<Customer>();
//        }

//        public void AddCustomer(Customer customer)
//        {
//            customers.Add(customer);
//        }

//        public void DisplayCustomerInfo(int accountNumber)
//        {
//            foreach (Customer customer in customers)
//            {
//                if (customer.GetAccountNumber() == accountNumber)
//                {
//                    Console.WriteLine("Name: " + customer.GetName());
//                    Console.WriteLine("Account Number: " + customer.GetAccountNumber());
//                    Console.WriteLine("Account Balance: " + customer.GetAccountBalance());
//                }
//            }
//        }
//    }

//    class Program
//    {
//        static void Main()
//        {
//            Bank bank = new Bank("XYZ Bank");

//            Customer alice = new Customer("Alice", 12345);
//            Customer bob = new Customer("Bob", 67890);
//            Console.WriteLine("Customer 1: Alice");
//            bank.AddCustomer(alice);
//            Console.WriteLine("Customer 2: Bob");
//            bank.AddCustomer(bob);
//            Console.WriteLine("Depositing $1000 into Alice's Account");
//            alice.Deposit(1000);
//            bob.Deposit(1000);
//            Console.WriteLine("Withdrawing $300 from Bob's Account");
//            bob.Withdraw(300);
//            Console.WriteLine("Customer Information");
//            bank.DisplayCustomerInfo(12345);
//            bank.DisplayCustomerInfo(67890);
//        }
//    }
//}


////Create EXEC CreateNewAccount @CustomerID = 1234, @BankID = 5678, @AccountType = 'Savings', @InitialBalance = 1000.00;











