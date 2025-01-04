using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //Program_1

            //Console.WriteLine("Enter 1 for km to miles,2 for pound to kg,3 for liters to gallons:");
            //int a = Convert.ToInt32(Console.ReadLine());

            //switch (a)
            //{
            //    case 1:
            //        Console.WriteLine("Enter Kilometers:");
            //        double km = Convert.ToDouble(Console.ReadLine());
            //        double miles = km * 0.621371;
            //        Console.WriteLine(km + " Kilometers = " + miles + " Miles");
            //        break;
            //    case 2:
            //        Console.WriteLine("Enter Pounds:");
            //        double p = Convert.ToDouble(Console.ReadLine());
            //        double kg = p * 0.453592;
            //        Console.WriteLine(p + " Pounds = " + kg + " Kilograms");
            //        break;
            //    case 3:
            //        Console.WriteLine("Enter liters:");
            //        double l = Convert.ToDouble(Console.ReadLine());
            //        double g = l * 0.264172;
            //        Console.WriteLine(l + " Liters = " + g + " Gallons");
            //        break;
            //    default:
            //        Console.WriteLine("Please enter valid conversion!");
            //        break;


            //Program_2

            //Console.WriteLine("Enter str1 = ");
            //string str1 = Console.ReadLine();
            //Console.WriteLine("Enter str2 = ");
            //string str2 = Console.ReadLine();

            //if (str1 == "@" || str2 =="@")
            //{
            //    throw new Exception("Input is Invalid!");
            //}

            //else
            //{
            //    //Equals()
            //    bool ans = string.Equals(str1, str2);
            //    Console.WriteLine("Are two string equals? -> " + ans);

            //    //Concat()
            //    string str3 = string.Concat(str1, " ", str2);
            //    Console.WriteLine("Concatanation of " + str1 + " and " + str2 + " = " + str3);

            //    //ToUpper()
            //    string str4 = str1.ToUpper();
            //    Console.WriteLine(str1 + " in uppercase : " + str4);
            //}


            //Program_3

            //Calculator calculator = new Calculator();
            //calculator.Multiply(10,20);
            //calculator.Multiply(50.3,60.3);
            //calculator.Multiply(40f,3f);

            //Program_4

            //Employee employee = new Employee();
            //employee.GetEmployeeDetails();
            //employee.DisplayEmployeeDetails();

            //Program_5

            //Person p = new Person("Xyz", 19);
            //p.DisplayDetails();
            //Employee1 emp = new Employee1(p.Name, p.Age, 123, 25000);
            //emp.DisplayDetails();
            //Manager m = new Manager(p.Name, p.Age, "CSE");
            //m.DisplayDetails();

            //Program_6

            //Vehicle v = new Vehicle("Fortuner", "Toyota", 80);
            //v.DisplayDetails();

            //Car c = new Car(v.Model, v.Brand, v.Speed, "Diesel", "MRF");
            //c.DisplayDetails();

            //Bike b = new Bike(c.Model, c.Brand, c.Speed, c.FuelType, c.WheelType);
            //b.DisplayDetails();

            //Program_7

            FullTimeEmployee emp2 = new FullTimeEmployee();
            emp2.CalculateSalary();
            emp2.DisplayEmployeeDetails();

        }

    }
}


