using ConsoleAppAirlineManagementSystem.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem.Service
{
    public interface IAirlineService
    {
        Task <int> AuthenticateUserAsync(string username, string password);
        Task<List<Flight>> FlightShow();
        Task<List<Airport>> AirportShow();
        Task<List<Schedule>> ListSchedule();
        Task AddDepartureDetailsAsync(FlightDeparture flightDept);
        Task AddArrivalDetailsAsync(FlightArrival FlightArr);
    }
}
