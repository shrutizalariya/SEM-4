using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Extra_Lab
{
    //Create a program that demonstrates the use of a copy constructor with a Time object. The Time class should store time in hours,
    //minutes, and seconds, and provide functionality for adding times.
    internal class Time
    {
            public int hours;
            public int minutes;
            public int seconds;

            public Time()
            {
                hours = 0;
                minutes = 0;
                seconds = 0;
            }

            public Time(int hours, int minutes, int seconds)
            {
                this.hours = hours;
                this.minutes = minutes;
                this.seconds = seconds;
                NormalizeTime();
            }

            public Time(Time other)
            {
                hours = other.hours;
                minutes = other.minutes;
                seconds = other.seconds;
            }

            public void AddTime(Time other)
            {
                hours += other.hours;
                minutes += other.minutes;
                seconds += other.seconds;
                NormalizeTime();
            }

            public void NormalizeTime()
            {
                minutes += seconds / 60;
                seconds %= 60;

                hours += minutes / 60;
                minutes %= 60;

                hours %= 24;
            }

            public void Display()
            {
                Console.WriteLine("Time: " + hours + ":" + minutes + ":" + seconds);
            }

        }
    }

