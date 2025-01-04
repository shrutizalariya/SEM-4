using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
    {
        internal class Vehicle
        {
            public string Model;
            public string Brand;
            public float Speed;

            public Vehicle(string m, string b, float s)
            {
                Model = m;
                Brand = b;
                Speed = s;
                Console.WriteLine("");
            }

            public virtual void DisplayDetails()
            {
                Console.WriteLine("Model of car : "+Model);
                Console.WriteLine("Brand of car : "+Brand);
                Console.WriteLine("Speed : "+Speed);
            }

        }

        class Car : Vehicle
        {
            public string FuelType;
            public string WheelType;

            public Car(string m, string b, float s, string fuelType, string wheelType) : base(m, b, s)
            {
                Model = m;
                Brand = b;
                Speed = s;
                FuelType = fuelType;
                WheelType = wheelType;
            }

            public override void DisplayDetails()
            {
                base.DisplayDetails();
                Console.WriteLine("FuelType : "+FuelType);
                Console.WriteLine("WheelType : "+WheelType);

            }
        }

        class Bike : Car
        {
            public Bike(string m, string b, float s, string fuelType, string wheelType) : base(m, b, s, fuelType, wheelType)
            {
                Model = m;
                Brand = b;
                Speed = s;
                FuelType = fuelType;
                WheelType = wheelType;
            }

            public override void DisplayDetails()
            {
                base.DisplayDetails();

            }
        }
    }

