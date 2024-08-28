using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem.Utilities
{
    public class CustomValidation
    {
        //username should be validated
        public static bool IsValidation(string userName)
        {
            return !string.IsNullOrEmpty(userName) &&
                Regex.IsMatch(userName, @"^[a-zA-Z0-9_.]+$");
        }
       //password also should be validated using caps,small and the special characters
        public static bool IsValidPassword(string password)
        {
            return !string.IsNullOrWhiteSpace(password) &&
                Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{4,}$");
        }
        //replace Alphabets with * symbol for password
        public static string ReadPassword()
        {
            string password = "";
            ConsoleKeyInfo key;

            do
            {
                key = Console.ReadKey(true);

                //1-each keystrokes from the user replaces it
                //with an asterik (*)
                //and add it to the password string
                //until the user presses the enter key
                if (key.Key != ConsoleKey.Backspace && key.Key != ConsoleKey.Enter)
                {
                    password += key.KeyChar;

                    Console.Write("*");
                }
                else if (key.Key == ConsoleKey.Backspace && password.Length > 0)
                {
                    password.Substring(0, password.Length - 1);
                    Console.Write("\b \b");
                }

            } while (key.Key != ConsoleKey.Enter);
            Console.WriteLine();
            return password;


        }
        public static bool isString(string str)
        {
            if(string.IsNullOrEmpty(str) || str.Length == 0)
            {
                return false;
            }
            return true;
        }
        public static bool isInteger(int value)
        {
            if(int.TryParse(Console.ReadLine(), out value))
            {
               // Console.WriteLine("Enter  correct integer");
                return true;
            }
            return false;
        }
    }
}
