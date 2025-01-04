using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    internal class Person
    {
        public string Name;
        public int Age;
        public Person(string name, int age)
        {
            Name = name;
            Age = age;
            Console.WriteLine("");
        }
        public virtual void DisplayDetails()
        {
            Console.WriteLine("Name : "+Name);
            Console.WriteLine("Age : "+Age);
        }
    }

    class Employee1 : Person
    {
        public int Empid;
        public float Sal;
        public Employee1(string name, int age, int eid, float sal) : base(name, age)
        {
            Name = name;
            Age = age;
            Empid = eid;
            Sal = sal;
        }
        public override void DisplayDetails()
        {
            base.DisplayDetails();
            Console.WriteLine("Employee_id : " + Empid);
            Console.WriteLine("Salary : "+Sal);
        }
    }

    class Manager : Person
    {
        public string Dept;
        public Manager(string name, int age, string dept):base(name,age)
        {
            Name = name;
            Age = age;
            Dept = dept;
        }

        public override void DisplayDetails()
        {
            base.DisplayDetails();
            Console.WriteLine("Department : "+Dept);
        }
    }
}
