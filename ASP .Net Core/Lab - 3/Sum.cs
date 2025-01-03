using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_3
{
    abstract class Sum
    {
        public int a;
        public int b;
        public int c;

        public abstract void SumOfTwo(int a, int b);

        public abstract void SumOfThree(int a, int b,int c);  
        
    }

    class Calculate : Sum
    {
        public override void SumOfThree(int a, int b, int c)
        {
            int sum = a + b + c;
            Console.WriteLine("Sum of " + a + " + " + b +" + "+c+" = " + sum);
        }

        public override void SumOfTwo(int a, int b)
        {
            int sum = a + b;
            Console.WriteLine("Sum of " + a + " + " + b + " = " + sum);
        }
    }
}
