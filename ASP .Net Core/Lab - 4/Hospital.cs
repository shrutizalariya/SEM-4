using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab___4
{

    //Program_4
    //4. Create a class Hospital with HospitalDetails() method.Create another
    //classes Apollo, Wockhardt, Gokul_Superspeciality which overrides HospitalDetails() method.
    internal class Hospital
    {
        public virtual void HospitalDetails() 
        {
            Console.WriteLine("This is Hospital!");
        }
    }

    class Apollo : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("This is an Appolo Hospital!");
        }
    }

    class Wockhardt : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("This is a Wockhardt Hospital!");
        }
    }

    class Gokul_Superspeciality : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("This is a Gokul_Superspeciality Hospital!");
        }
    }
}
