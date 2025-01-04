using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    internal class Employee
    {
        public string Name;
        public int Id;
        public string Position;
        public float Salary;

        public void GetEmployeeDetails()
        {
            Console.WriteLine("Enter Name : ");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Id : ");
            Id = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Position : ");
            Position = Console.ReadLine();
            Console.WriteLine("Enter salary : ");
            Salary = Convert.ToSingle(Console.ReadLine());
        }

        public void DisplayEmployeeDetails()
        {
            Console.WriteLine("Name : " + Name);
            Console.WriteLine("Id : " + Id);
            Console.WriteLine("Position : " + Position);
            Console.WriteLine("Salary : " + Salary);
        }
    }
}
