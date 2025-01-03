using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Lab___4
{
    //Program_3
    //3. Create a class named RBI with calculateInterest() method.Create another
    //classes HDFC, SBI, ICICI which overrides calculateInterest() method.
    internal class RBI
    {
        public virtual void calculateInterest(float p,float r,float n)
        {
            Console.WriteLine("Simple Interest of RBI = " + ((p * r * n) / 100));
        }
    }

    class HDFC : RBI
    {
        public override void calculateInterest(float p1, float r1, float n1)
        {
            Console.WriteLine("Simple Interest of HDFC = " + ((p1 * r1 * n1) / 100));
        }
    }

    class SBI : RBI
    {
        public override void calculateInterest(float p2, float r2, float n2)
        {
            Console.WriteLine("Simple Interest of SBI = " + ((p2 * r2 * n2) / 100));
        }
    }

    class ICICI : RBI
    {
        public override void calculateInterest(float p3, float r3, float n3)
        {
            Console.WriteLine("Simple Interest of ICICI = " + ((p3 * r3 * n3) / 100));
        }
    }
}
