using ConsoleAppAirlineManagementSystem.Model;
using ConsoleAppAirlineManagementSystem.Repository;
using ConsoleAppAirlineManagementSystem.Service;
using ConsoleAppAirlineManagementSystem.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem
{
    public class AMSv2024
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("#####################################");
            Console.WriteLine("#                                    #");
            Console.WriteLine("#                                    #");
            Console.WriteLine("#  AIRLINE MANAGEMENT SYSTEM         #");
            Console.WriteLine("#                                    #");
            Console.WriteLine("#                                    #");
            Console.WriteLine("#####################################");

lblUsername:
            Console.Write("Enter the Username:");
            string username = Console.ReadLine();
            //checking the username is valid
            bool isValidUser = CustomValidation.IsValidation(username);
            if ((!isValidUser))
            {
                Console.WriteLine("Invalid Username.Try again");
                goto lblUsername;
            }
lblPassword:
            Console.Write("Enter the Password:");
            //making the password unreadable
            string password = CustomValidation.ReadPassword();


            bool isValidPassword = CustomValidation.IsValidPassword(password);
            if (!isValidPassword)
            {

                Console.WriteLine("Invalid password,Try Again");
                goto lblPassword;
            }
            //if username and password valid then checks the matching property
            if (isValidUser && isValidPassword)

            {
                IAirlineService service = new AirlineServiceImplementaion(new AirlineRepositoryImplementaion());
                int roleId = await service.AuthenticateUserAsync(username, password);
                if (roleId == 1)
                {
                    switch (roleId)
                    {
                        case 1:
                            //Administrator module
                            Console.WriteLine("Welcome Admin");
                            while (true)
                            {
                                //menu
                                Console.WriteLine("Admin Dashboard");
                                Console.WriteLine("1.Add Flight Details");
                                Console.WriteLine("2.Search Flight by Id");
                                Console.WriteLine("3.Edit/Update Flight Details");
                                Console.WriteLine("4.ListAll Flight Detils");

                                Console.Write("Enter the choice:  ");
                                int choice;
                                if (!int.TryParse(Console.ReadLine(), out choice))
                                {
                                    Console.WriteLine("Enter the choice again!");
                                    return;
                                }
                                else
                                {


                                    switch (choice)
                                    {
                                        case 1:
                                            await AddFlightAsync();
                                            break;
                                        case 2:
                                            await SearchByIdAsync();
                                            break;
                                        case 3:
                                            await UpdateFlightAsync();
                                            break;
                                        case 4:
                                            await  GetAllFlightAsync();
                                            break;
                                        default:
                                            Console.WriteLine("Wrong choice!please enter again");
                                            break;

                                    }
                                }

                            }
                            break;
                        
                        default:
                            Console.WriteLine("Invalid menu.Access denied");
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid credentials please enter correct one!");
                    goto lblUsername;
                }
            }




            Console.ReadKey();

        }

        private static async Task GetAllFlightAsync()
        {
            IAirlineService service = new AirlineServiceImplementaion(new AirlineRepositoryImplementaion());
          
        }

        private static async Task UpdateFlightAsync()
        {
            throw new NotImplementedException();
        }

        private static async Task SearchByIdAsync()
        {
            throw new NotImplementedException();
        }

        private static async Task AddFlightAsync()

        {
            IAirlineService service = new AirlineServiceImplementaion(new AirlineRepositoryImplementaion());
           // var flight = new Flight();
            var flightDept = new FlightDeparture();
            var FlightArr = new FlightArrival();

            Console.WriteLine("Enter the flight details");
            List<Flight> flightdetails = new List<Flight>();
            flightdetails = await service.FlightShow();
            Console.WriteLine("List of flightid and flights");
            foreach (Flight flight in flightdetails)
            {
                Console.WriteLine($"Flight id :{flight.FlightID}    || Flight Name :{flight.FlightName}");
            }
            
            Console.WriteLine("Enter the flight ID");
            int flightId = int.Parse(Console.ReadLine());
            //CustomValidation.isInteger(int flightId);
            Console.WriteLine("List of airport Details");
            List <Airport> airportDetails = new List<Airport>();

             airportDetails = await service.AirportShow();
            foreach (Airport airport in airportDetails)
            {

                Console.WriteLine($"Airport ID :{airport.AirportId} || Airport Name :{airport.AirportName} || City name:{airport.CityName}");
            }
            Console.WriteLine("Enter the Departure  Airport Id");
            flightDept.AirportId = int.Parse(Console.ReadLine());
            List<Schedule> schedules = new List<Schedule>();
            Console.WriteLine("Showing the Available schedules");
             schedules = await service.ListSchedule();
            foreach (Schedule schedule in schedules)
            {
                Console.WriteLine($"Schedule id:{schedule.ScheduleId} || schedule DATE: {schedule.dateOfTravel} || Scheduel TIME :{schedule.TimeOfTravel}");
            }

            Console.WriteLine("Enter the Departure Schedule id");
            flightDept.ScheduleId = int.Parse(Console.ReadLine());
            Console.WriteLine("List of airport Details");

            foreach (Airport airport in airportDetails)
            {

                Console.WriteLine($"Airport ID :{airport.AirportId} || Airport Name :{airport.AirportName} || City name:{airport.CityName}");
            }

            // var airportDetailss = await service.AirportShow();
            // Console.WriteLine($"Airport ID :{airportDetailsAirportId} || Airport Name :{airportDetailss.AirportName} || City name:{airportDetailss.CityName}");

            Console.WriteLine("Enter the Arrival Airport Id");
            FlightArr.AirportId = int.Parse(Console.ReadLine());
            Console.WriteLine("Showing the Available schedules");
            foreach (Schedule schedule in schedules)
            {
                Console.WriteLine($"Schedule id:{schedule.ScheduleId} || schedule DATE: {schedule.dateOfTravel} || Scheduel TIME :{schedule.TimeOfTravel}");
            }
            //  var schedulesS = await service.ListSchedule();
            //Console.WriteLine($"Schedule id:{schedulesS.ScheduleId} || schedule DATE: {schedulesS.dateOfTravel} || Scheduel TIME :{schedulesS.TimeOfTravel}");
            Console.WriteLine("Enter the Arrival Schedule id");
            FlightArr.ScheduleId = int.Parse(Console.ReadLine());
            await service.AddDepartureDetailsAsync(flightDept);
            await service.AddArrivalDetailsAsync(FlightArr);




        }
    }
}
