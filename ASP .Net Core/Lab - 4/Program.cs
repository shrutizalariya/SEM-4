using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Lab___4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program_1
            //int ans1 = addition(5, 6);
            //Console.WriteLine("5 + 6 = "+ans1);

            //double ans2 = addition(4.2, 6.3);
            //Console.WriteLine("4.2 + 6.3 = "+ans2);

            //Program_2
            //Console.WriteLine("Enter a length of square : ");
            //double l = Convert.ToDouble(Console.ReadLine());
            //area(l);
            //Console.WriteLine("Enter a length of rectangle : ");
            //double L = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Enter a breagth of rectangle : ");
            //double B = Convert.ToDouble(Console.ReadLine());
            //area(L, B);

            //Program_3
            //Console.WriteLine("This is for RBI");
            //RBI rBI = new RBI();
            //Console.WriteLine("Enter P : ");
            //float p = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter R : ");
            //float r = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter N : ");
            //float n = Convert.ToSingle(Console.ReadLine());
            //rBI.calculateInterest(p, r, n);

            //Console.WriteLine("This is for HDFC");
            //HDFC hDFC = new HDFC();
            //Console.WriteLine("Enter P : ");
            //float p1 = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter R : ");
            //float r1 = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter N : ");
            //float n1 = Convert.ToSingle(Console.ReadLine());
            //hDFC.calculateInterest(p1, r1, n1);

            //Console.WriteLine("This is for SBI");
            //SBI sBI = new SBI();
            //Console.WriteLine("Enter P : ");
            //float p2 = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter R : ");
            //float r2 = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter N : ");
            //float n2 = Convert.ToSingle(Console.ReadLine());
            //sBI.calculateInterest(p2, r2, n2);

            //Console.WriteLine("This is for ICICI");
            //ICICI iCICI = new ICICI();
            //Console.WriteLine("Enter P : ");
            //float p3 = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter R : ");
            //float r3 = Convert.ToSingle(Console.ReadLine());
            //Console.WriteLine("Enter N : ");
            //float n3 = Convert.ToSingle(Console.ReadLine());
            //iCICI.calculateInterest(p3, r3, n3);

            //Program_4
            //Hospital hospital = new Hospital();
            //hospital.HospitalDetails();

            //Apollo apollo = new Apollo();
            //apollo.HospitalDetails();

            //Wockhardt wockhardt = new Wockhardt();
            //wockhardt.HospitalDetails();

            //Gokul_Superspeciality gokul_sup = new Gokul_Superspeciality();
            //gokul_sup.HospitalDetails();

            //Program_5
            //area(10);
            //area(2.5, 6.4);
            //area(5f);

            //Program_6
            BankAccount bank = new BankAccount(25000,"xyz");
            bank.Deposite("Cash");
            bank.Deposite();
            bank.Withdraw("Cheque");
            bank.Withdraw();
        }

        //Program_1
        //1. Write a program using method overloading by changing datatype of
        //arguments to perform addition of two integer numbers and two float
        //numbers.

        public static int addition(int a, int b)
        {
            return a + b;
        }

        public static double addition(double a, double b) 
        {
            return a + b;
        }

        //Program_2
        //2. Write a program using method overloading by changing number of
        //arguments to calculate area of square and rectangle.
        public static void area(double l)
        {
            Console.WriteLine("Area of Square = "+(l*l));
        }

        public static void area(double L, double B)
        {
            Console.WriteLine("Area of Rectangle = " + (L * B));
        }

        //Program_5
        //5. Write a programs to Find Area of Square, Rectangle and Circle using 
        //Method Overloading.
        public static void area(int l)
        {
            Console.WriteLine("Area of square = " + (l*l));
        }

        public static void area(float  l,float b)
        {
            Console.WriteLine("Area of rectangle = " + (l*b));
        }

        public static void area(float r)
        {
            Console.WriteLine("Area of Circle = "+(3.14*r*r));
        }
}
}
