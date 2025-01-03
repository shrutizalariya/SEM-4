using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace Lab___5
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //Program_1
            //1.Create an ArrayList for StudentName and perform following operations: 
            //a.Add() - To Add new student in list
            //b.Remove() - To Remove Student with specified index
            //c.RemoveRange() - To Remove student with specified range.
            //d.Clear() - To clear all the student from the list

            //ArrayList StudentName = new ArrayList();

            //Add()
            //Console.WriteLine("Add Method!");
            //StudentName.Add("abc");
            //StudentName.Add("xyz");
            //StudentName.Add("def");
            //StudentName.Add("que");
            //foreach (object obj in StudentName)
            //{
            //    Console.WriteLine(obj);
            //}

            //Remove()
            //Console.WriteLine("Remove Method!");
            //StudentName.Remove("xyz");
            //foreach (object obj in StudentName)
            //{
            //    Console.WriteLine(obj);
            //}

            //RemoveRange()
            //Console.WriteLine("Remove Range Method!");
            //StudentName.RemoveRange(0, 2);//2 is not included
            //foreach (object obj in StudentName)
            //{
            //    Console.WriteLine(obj);
            //}

            //Clear()
            //Console.WriteLine("Clear Method!");
            //StudentName.Clear();
            //foreach (object obj in StudentName)
            //{
            //    Console.WriteLine(obj);
            //}

            //Program_2
            //2.Create a List for StudentName and perform following operations: 
            //a.Add() - To Add new student in list
            //b.Remove() - To Remove Student with specified index
            //c.RemoveRange() - To Remove student with specified range.
            //d.Clear() - To clear all the student from the list.

            //List<string> list = new List<string>();

            //Add()
            //Console.WriteLine("Add Method!");
            //list.Add("xyz");
            //list.Add("abc");
            //list.Add("def");
            //list.Add("hij");
            //list.Add("que");
            //foreach(object obj in list)
            //{
            //    Console.WriteLine(obj);
            //}

            ////Remove()
            //Console.WriteLine("Remove Method!");
            //list.Remove("xyz");
            //foreach (object obj in list)
            //{
            //    Console.WriteLine(obj);
            //}

            ////RemoveRange()
            //Console.WriteLine("Remove Range Method!");
            //list.RemoveRange(1,3);
            //foreach (object obj in list)
            //{
            //    Console.WriteLine(obj);
            //}

            ////CLear()
            //Console.WriteLine("Clear Method!");
            //list.Clear();
            //foreach (object obj in list)
            //{
            //    Console.WriteLine(obj);
            //}

            //Program_3
            //3. Create a Stack which takes integer values and perform following operations:
            //a.Push() - To Add new item in stack
            //b.Pop() - To Remove item from the stack
            //c.Peek() – To Return the top item from the stack. 
            //d.Contains() - To Checks whether an item exists in the stack or not. 
            //e.Clear() - To clear items from stack

            //Stack<int> stack = new Stack<int>();

            ////Push()
            //Console.WriteLine("Push Method!");
            //stack.Push(1);
            //stack.Push(2);
            //stack.Push(3);
            //stack.Push(4);
            //stack.Push(5);
            //foreach (int i in stack) 
            //{
            //    Console.WriteLine(i);
            //}

            ////Pop()
            //Console.WriteLine("Pop Method!");
            //stack.Pop();
            //foreach (int i in stack)
            //{
            //    Console.WriteLine(i);
            //}

            ////Peek()
            //Console.WriteLine("Peek Method!");
            //int a = stack.Peek();
            //Console.WriteLine(a);

            ////Contains()
            //Console.WriteLine("Contains Method!");
            //bool b = stack.Contains(4);
            //bool c = stack.Contains(10);
            //Console.WriteLine(b);
            //Console.WriteLine(c);

            ////Clear()
            //Console.WriteLine("Clear Method!");
            //stack.Clear();
            //foreach (int i in stack)
            //{
            //    Console.WriteLine(i);
            //}

            //Program_4
            //4. Create a Queue which takes integer values and perform following operations:
            //a.Enqueue() - Adds an item into the queue.
            //b.Dequeue() - Returns an item from the beginning of the queue and removes it from the queue. 
            //c.Peek() - Returns an first item from the queue without removing it.
            //d.Contains() - Checks whether an item is in the queue or not
            //e.Clear() - Removes all the items from the queue

            //Queue<int> queue = new Queue<int>();

            ////Enqueue()
            //Console.WriteLine("Enqueue Method!");
            //queue.Enqueue(1);
            //queue.Enqueue(2);
            //queue.Enqueue(3);
            //queue.Enqueue(4);
            //queue.Enqueue(5);
            //foreach (int i in queue)
            //{
            //    Console.WriteLine(i);
            //}

            ////Dequeue()
            //Console.WriteLine("Dequeue Method!");
            //queue.Dequeue();
            //foreach (int i in queue)
            //{
            //    Console.WriteLine(i);
            //}

            ////Peek()
            //Console.WriteLine("Peek Method!");
            //int a = queue.Peek();
            //Console.WriteLine(a);

            ////Contains()
            //Console.WriteLine("Contains Method!");
            //bool b = queue.Contains(1);
            //bool c = queue.Contains(8);
            //bool d = queue.Contains(3);
            //Console.WriteLine(b);
            //Console.WriteLine(c);
            //Console.WriteLine(d);

            ////Clear()
            //Console.WriteLine("Clear Method!");
            //queue.Clear();

            //Program_5
            //5.Create a Dictionary collection class object and preform following operations: 
            //a.Add: Adds a key-value pair.
            //b.Remove: Removes a key-value pair by key. 
            //c.ContainsKey: Checks if a key exists in the hashtable. 
            //d.ContainsValue: Checks if a value exists in the hashtable. 
            //e.Clear: Removes all key-value pairs. 

            //Dictionary<string, object> keyValues = new Dictionary<string, object>();

            ////Add()
            //Console.WriteLine("Add Method!");
            //keyValues.Add("Name","abc");
            //keyValues.Add("Roll_No",15);
            //keyValues.Add("Enrollment_No",123654);
            //keyValues.Add("Contact_No",1236547890);

            //foreach (KeyValuePair<string, object> key in keyValues)
            //{
            //    Console.WriteLine(key.Key+":"+key.Value);
            //}

            ////Remove()
            //Console.WriteLine("Remove Method!");
            //keyValues.Remove("Name");

            //foreach (KeyValuePair<string, object> key in keyValues)
            //{
            //    Console.WriteLine(key.Key + ":" + key.Value);
            //}

            ////ContainsKey()
            //Console.WriteLine("ContainsKey Method!");
            //bool a = keyValues.ContainsKey("Enrollment_No");
            //Console.WriteLine("Is dicstionary contain enrollment no. ? : "+a);

            ////ContainsValue()
            //Console.WriteLine("ContainsValue Method!");
            //bool b = keyValues.ContainsValue(123654);
            //Console.WriteLine("Is dicstionary contain enrollment no. 123654 ? : " + b);

            ////Clear()
            //Console.WriteLine("Clear Method!");
            //keyValues.Clear();

            //6.Create a Hashtable collection class object and preform following operations: 
            //a.Add: Adds a key-value pair.
            //b.Remove: Removes a key-value pair by key. 
            //c.ContainsKey: Checks if a key exists in the hashtable. 
            //d.ContainsValue: Checks if a value exists in the hashtable. 
            //e.Clear: Removes all key-value pairs. 

            Hashtable hashtable = new Hashtable();

            //Add()
            Console.WriteLine("Add Method!");
            hashtable.Add("Name","abcd");
            hashtable.Add("SPI",3.5);
            hashtable.Add("Roll_No",25);
            hashtable.Add("Age",19);
            foreach (DictionaryEntry obj in hashtable)
            {
                Console.WriteLine($"{obj.Key} : {obj.Value}");
            }

            //Remove()
            Console.WriteLine("Remove Method!");
            hashtable.Remove("Name");
            foreach (DictionaryEntry obj in hashtable)
            {
                Console.WriteLine($"{obj.Key} : {obj.Value}");
            }

            //ContainsKey()
            Console.WriteLine("ContainsKey Method!");
            bool c = hashtable.ContainsKey("Age");
            Console.WriteLine("Does Hashtable contains age? : "+c);

            //ContainsValue()
            Console.WriteLine("ContainsValue Method!");
            bool d = hashtable.ContainsKey("abcd");
            Console.WriteLine("Does Hashtable contains name abcd? : " + d);

            //Clear()
            Console.WriteLine("Clear Method!");
            hashtable.Clear();
        }
    }
}
