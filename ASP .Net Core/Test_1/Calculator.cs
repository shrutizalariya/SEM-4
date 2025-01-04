using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
internal class Calculator
{
       public void Multiply(int a , int b)
       {
            Console.WriteLine( a * b);
       }

        public void Multiply(double a , double b) 
        {
            Console.WriteLine(a * b);
        }

        public void Multiply(float a , float b) 
        {
            Console.WriteLine(a * b);
        }
        
    }
}
