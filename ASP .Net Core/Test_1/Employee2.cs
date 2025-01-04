using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    abstract internal class Employee2
    {
            abstract public void CalculateSalary();
            abstract public void DisplayEmployeeDetails();

        }
        internal class FullTimeEmployee : Employee2
        {
            int hours;
            string Name;
            int ID;
            string Position;
            int salary;

            public FullTimeEmployee()
            {
                Console.WriteLine("Enter youe Hours : ");
                hours = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Your Name :");
                Name = Console.ReadLine();
                Console.WriteLine("Enter Your ID :");
                ID = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter Your Position :");
                Position = Console.ReadLine();
            }
            public override void CalculateSalary()
            {
                salary = hours * 3000;
                Console.WriteLine("Salary is " + salary);
            }

            public override void DisplayEmployeeDetails()
            {
                Console.WriteLine("Your Name: " + Name);

                Console.WriteLine("Your ID: " + ID);

                Console.WriteLine("Your Position: " + Position);

                Console.WriteLine("Your Salary:" + salary);
            }
        }
    }
