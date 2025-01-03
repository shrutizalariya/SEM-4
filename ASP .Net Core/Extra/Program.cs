using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Extra_Lab
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program_1
            // 1.   Write a program to find and display all prime numbers within a given range. The user should input the starting and
            // ending values of the range, and the program should output all the prime numbers in that range.

            //Console.WriteLine("Enter Starting value : ");
            //int n = Convert.ToInt32(Console.ReadLine());

            //Console.WriteLine("Enter ending value : ");
            //int m = Convert.ToInt32(Console.ReadLine());
            //int count = 0;
            //for(int j = n; j <= m; j++)
            //{
            //    for (int i = 2; i <= j / 2; i++)
            //    {
            //        if (j % i == 0)
            //        {
            //            count++;
            //        }
            //    }
            //    if (count == 0)
            //    {
            //        Console.WriteLine(j);
            //    }
            //    count = 0;
            //}

            //----------2nd Method------------
            //int max = 0;
            //int min = 0;
            //if (n > m)
            //{
            //    min = m;
            //    max = n;
            //}
            //else
            //{
            //    min = n;
            //    max = m;
            //}

            //for (int j = min; j <= max; j++)
            //{
            //    for (int i = 2; i <= j / 2; i++)
            //    {
            //        if (j % i == 0)
            //        {
            //            count++;
            //        }
            //    }
            //    if (count == 0)
            //    {
            //        Console.WriteLine(j);
            //    }
            //    count = 0;
            //}

            //Program_7
            //Time t1 = new Time(2, 50, 50);
            //Console.WriteLine("Original Time t1:");
            //t1.Display();

            //Console.WriteLine("");

            //Time t2 = new Time(t1);
            //Console.WriteLine("Copied Time t2:");
            //t2.Display();

            //Console.WriteLine("");

            //Time t3 = new Time(5, 20, 40);
            //Console.WriteLine("Another Time t3:");
            //t3.Display();

            //Console.WriteLine("");

            //t1.AddTime(t3);
            //Console.WriteLine("After Adding t3 to t1:");
            //t1.Display();


            //Program : WAP to print two strings are anagram or not.
            Console.Write("Enter str1 : ");
            String str1 = Console.ReadLine();
            Console.Write("Enter str2 : ");
            String str2 = Console.ReadLine();
            int Count = 0;

            char[] arr1 = str1.ToLower().ToCharArray();
            char[] arr2 = str2.ToLower().ToCharArray();
            Array.Sort(arr1);
            Array.Sort(arr2);

            while (arr1.Length==arr2.Length) {
                for (int i = 0; i < arr1.Length; i++)
                {
                    if (arr2[i]!=arr1[i])
                    {
                        Console.WriteLine("Strings are not anagram!");
                        return;
                    }
                    else
                    {
                        Count++;
                    }
                }
                if (Count == arr1.Length)
                {
                    Console.WriteLine("Strigs are anagram!");
                }
            }
        }
    }
}
