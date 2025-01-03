using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Lab___4
{

    //Program_6
    //6. Create a BankAccount class having constructor accepting initialBalance and
    //accountHolderName.Also create Deposite() and withdraw() overloaded
    //methods by which user can deposit/withdraw amount using different types
    //of parameters(ex.cash, check). 
    internal class BankAccount
    {
        public double initialBalance;
        public string accountHolderName;
        public BankAccount(double i,string a)
        {
            initialBalance = i;
            accountHolderName = a;
        }

        public void Deposite(string type)
        {
            if(type == "Cash")
            {
                Console.WriteLine("Deposited in cash!");
                Console.WriteLine("Balance = "+initialBalance);
                Console.WriteLine("Holder Name = "+accountHolderName);
            }
            else
            {
                Console.WriteLine("Deposited in cheque!");
            }
        }

        public void Deposite()
        {
            Console.WriteLine("This is deposite method!");
        }

        public void Withdraw(string type)
        {
            if (type == "Cash")
            {
                Console.WriteLine("Withdrawd in cash!");
                Console.WriteLine("Balance = " + initialBalance);
                Console.WriteLine("Holder Name = " + accountHolderName);
            }
            else
            {
                Console.WriteLine("Withdrawd in cheque!");
            }
        }

        public void Withdraw()
        {
            Console.WriteLine("This is withdraw method!");
        }
    }
}
