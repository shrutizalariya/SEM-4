using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Lab_3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program_1
            //1. Write a program to Create a divide by zero exception and handle it. 
            //try
            //{
            //    Console.WriteLine("Enter Num 1 and 2 :");
            //    int num1 = Convert.ToInt32(Console.ReadLine());
            //    int num2 = Convert.ToInt32(Console.ReadLine());
            //    int Div = num1 / num2;
            //}
            //catch (DivideByZeroException)
            //{
            //    Console.WriteLine("Exception Occured : DivideByZeroException");
            //}

            //Program_2
            //2. Write a program that reads 5 numbers from user. Demonstrate concept of IndexOutOfRange Exception. 
            //try
            //{
            //    int[] arr = new int[5];
            //    for (int i = 0; i < 10; i++)
            //    {
            //        Console.WriteLine("arr[" + i + "] = ");
            //        arr[i] = Convert.ToInt32(Console.ReadLine());
            //    }
            //}
            //catch (Exception e)
            //{
            //    Console.WriteLine("Exception Occured : ArrayIndexOutOfBoundException");
            //}

            //Program_3
            //Calculate calculate = new Calculate();
            //calculate.SumOfTwo(10, 20);
            //calculate.SumOfThree(10, 20, 30);

            //Program_4
            //Result result = new Result();
            //result.addition(10, 20);
            //result.subtraction(20, 30);

            //Program_5
            //5. Write program showing use of common methods of String class. 

            //string str1 = Console.ReadLine();
            //string str2 = Console.ReadLine();

            ////length
            //int len = str1.Length;
            //Console.WriteLine("Length of str1 : "+len);

            ////join two string
            //string joinedString = string.Concat(str1, str2);
            //Console.WriteLine("Joined string is "+joinedString);

            ////compare string
            //Boolean result = str1.Equals(str2);
            //Console.WriteLine(result);

            ////Upper
            //string str3 = str1.ToUpper();
            //Console.WriteLine("Upper Case : "+str3);

            ////Lower
            //string str4 = str2.ToLower();
            //Console.WriteLine("Lower Case : "+str4);        

            ////Replace
            //string str5 = str1.Replace('a', 'i');
            //Console.WriteLine(str5);

            ////IndexOf
            //int i = str1.IndexOf('e');
            //Console.WriteLine(i);

            ////Substring
            //string str6 = str2.Substring(3);
            //Console.WriteLine("Substring : "+str6);

            //Program_6
            //6. Write a program to Replace lower case characters to upper case and Vice - versa.

            //Console.Write("Enter a String : ");
            //string str = Console.ReadLine();
            //string str1 = "";

            //for (int i = 0; i < str.Length; i++)
            //{
            //    if (char.IsLower(str[i]))
            //    {
            //        str1 += char.ToUpper(str[i]);
            //    }
            //    else if (char.IsUpper(str[i]))
            //    {
            //        str1 += char.ToLower(str[i]);
            //    }
            //}
            //Console.WriteLine(str1);

            //Program_7
            //Area a = new Area();

            //Console.Write("Enter radius of a circle : ");
            //double r = Convert.ToDouble(Console.ReadLine());
            //Console.Write("Enter length of a square : ");
            //double l = Convert.ToDouble(Console.ReadLine());
            //Console.Write("Enter height of a triangle : ");
            //double h = Convert.ToDouble(Console.ReadLine());
            //Console.Write("Enter width of a triangle : ");
            //double w = Convert.ToDouble(Console.ReadLine());

            //double ans = a.circle(r);
            //Console.WriteLine("Area of a circle = " + ans);
            //double ans1 = a.square(l);
            //Console.WriteLine("Area of a square = " + ans1);
            //double ans2 = a.triangle(h,w);
            //Console.WriteLine("Area of a triangle = " + ans2);

            //Program_8
            //8.Write a program to accept a number from the user and throw an exception
            //if the number is not an even number.

            //Console.WriteLine("Enter a number : ");
            //int n = Convert.ToInt32(Console.ReadLine());
            //if (n % 2 != 0)
            //{
            //    throw new Exception("Number is not even!");
            //}
            //else
            //{
            //    Console.WriteLine("Number is valid!");
            //}

            //Program_9
            //9.Write a program to find the longest word in a string.

            //Console.WriteLine("Enter a  string : ");
            //string str = Console.ReadLine();

            //string longestword = "";

            //foreach (string word in str.Split(' '))
            //{
            //    if (word.Length > longestword.Length)
            //    {
            //        longestword = word;
            //    }
            //}
            //Console.WriteLine("Longest Word in this string = "+longestword);

            //Program_10
            //10. Write a program to change the case of entered character.

            //Console.Write("Enter a character : ");
            //char c = Convert.ToChar(Console.ReadLine());
            //if (char.IsLower(c))
            //{
            //    Console.WriteLine(char.ToUpper(c));
            //}
            //else if (char.IsUpper(c))
            //{
            //    char C = char.ToLower(c);
            //    Console.WriteLine(C);
            //}
            //else
            //{
            //    Console.WriteLine("Entered character is special character please enter alphabets only!");
            //}
        }
    }
}
