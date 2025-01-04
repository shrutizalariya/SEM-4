using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace Lab_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program_1
            //1. Write a program to print your name, address, contact number & city.

            //Console.WriteLine("Shruti");
            //Console.WriteLine("Manshi Palace");
            //Console.WriteLine(98298390754);
            //Console.WriteLine("Morbi");


            //Program_2
            //2. Write a program to get two numbers from user and print those two numbers.

            //Console.WriteLine("Enter First Number:");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Number 1 = "+a);
            //Console.WriteLine("Enter Second Number:");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Number 2 = "+b);


            //Program_3
            //3. Write program to prompt a user to input his/her name and country name and then output will be shown as given: Hello<yourname> from country <countryname>

            //Console.WriteLine("Enter Your Name:");
            //String n = Convert.ToString(Console.ReadLine());
            //Console.WriteLine("Enter your Country:");
            //String m = Convert.ToString(Console.ReadLine());
            //Console.WriteLine("Hello "+ n +" from country "+ m);


            //Program_4
            //4. Write a program to calculate the size of the area in square-feet based on Specified length and width.

            //Console.WriteLine("Enter a length:");
            //double l = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Enter a width:");
            //double w = Convert.ToDouble(Console.ReadLine());
            //double Area = l * w;
            //Console.WriteLine("Area = "+ Area);


            //Program_5
            //5. Write a program to calculate area of Square, Rectangle and Circle.

            //Console.WriteLine("Enter a length of Square:");
            //double l = Convert.ToDouble(Console.ReadLine());
            //double Area = l * l;

            //Console.WriteLine("Enter a length of Rectangle:");
            //double n = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Enter a width of Rectangle:");
            //double m = Convert.ToDouble(Console.ReadLine());
            //double Area_R = n * m;

            //Console.WriteLine("Enter a radius of Circle:");
            //double r = Convert.ToDouble(Console.ReadLine());
            //double Area_C = 3.14 * r * r;

            //Console.WriteLine("1. Area Of Square = " + Area);
            //Console.WriteLine("2. Area Of Rectangle = " + Area_R);
            //Console.WriteLine("3. Area Of Circle = "+Area_C);


            //Program_8
            //8. Write a program to create a Simple Calculator for two numbers (Addition,Multiplication, Subtraction, Division) [Also using if…else &Switch Case]

            //Console.WriteLine("Enter first number:");
            //double a = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Enter second number:");
            //double b = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Enter 1 for addition, 2 for subtraction, 3 for multiplication, 4 for division:");
            //int c = Convert.ToInt32(Console.ReadLine());

            //if (c == 1)
            //{
            //    Console.WriteLine(a + " + " + b + " = " + (a + b));

            //}
            //else if (c == 2)
            //{
            //    Console.WriteLine(a + " - " + b + " = " + (a - b));
            //}
            //else if (c == 3)
            //{
            //    Console.WriteLine(a + " * " + b + " = " + (a * b));
            //}
            //else if (c == 4)
            //{
            //    Console.WriteLine(a + " / " + b + " = " + (a / b));
            //}
            //else
            //{
            //    Console.WriteLine("Please an enter valid operation!");
            //}

            //switch (c)
            //{
            //    case 1:
            //        Console.WriteLine(a + " + " + b + " = " + (a + b));
            //        break;
            //    case 2:
            //        Console.WriteLine(a + " - " + b + " = " + (a - b));
            //        break;
            //    case 3:
            //        Console.WriteLine(a + " * " + b + " = " + (a * b));
            //        break;
            //    case 4:
            //        Console.WriteLine(a + " / " + b + " = " + (a / b));
            //        break;
            //    default:
            //        Console.WriteLine("Please an enter valid operation!");
            //        break;
            //}


            //Program_9
            //9. Write a program to Swapping without using third variable.

            //Console.WriteLine("Enter first number a:");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter second number b:");
            //int b = Convert.ToInt32(Console.ReadLine());
            //a = a + b;
            //b = a - b; 
            //a = a - b;
            //Console.WriteLine("a = "+a);
            //Console.WriteLine("b = "+b);

            //Program_10
            //10.Write a program to find maximum numbers from given 3 numbers using ternary operator.

            //Console.WriteLine("Enter first number a:");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter second number b:");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter third number c:");
            //int c = Convert.ToInt32(Console.ReadLine());

            //int max = ((a>b) ? ((a>c) ? a : c ) : ((b>c) ? b : c));
            //Console.WriteLine("Maximum number is = " + max);


            //Program_6
            //6. Write a program to calculate Celsius to Fahrenheit and vice-versa using function.

            //Console.WriteLine("Enter Celsius:");
            //double c = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Temp in fahrenheit is = " + fahrenheit(c));
            //Console.WriteLine("Enter Fahrenheit:");
            //double f = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Temp in celsius is = " + celsius(f));

            //Program_7
            Console.WriteLine("Enter P:");
            double p = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter R:");
            double r = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter N:");
            double n = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Simple Interest = "+Interest(p,r,n ));
        }
        //static double fahrenheit(double c)
        //{
        //    return (9 / 5 * c + 32);
        //}
        //static double celsius(double f)
        //{
        //    return ((f - 32) * 5/9);
        //}

        //7. Write a program to find out Simple Interest using function. (I = PRN/100)
        static double Interest(double p, double r, double n)
        {
            return ((p * r * n) / 100);
        }
    }

}