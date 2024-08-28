using ConsoleAppAirlineManagementSystem.Model;
using ConsoleAppAirlineManagementSystem.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem.Service
{
   
    public class AirlineServiceImplementaion : IAirlineService
    {
        //taking repositiry
        private  readonly IAirlineRepository _airlineRepository;
        public AirlineServiceImplementaion(IAirlineRepository airlineRepository)
        {
            _airlineRepository = airlineRepository;
        }

        public async Task AddArrivalDetailsAsync(FlightArrival FlightArr)
        {
            await _airlineRepository.AddArrivalDetailsAsync(FlightArr);

        }

        public async Task AddDepartureDetailsAsync(FlightDeparture flightDept)
        {
             await _airlineRepository.AddDepartureDetailsAsync(flightDept);
            
        }

        public async Task<List<Airport>> AirportShow()
        {
            return await _airlineRepository.AirportShow();
            
        }

        public async Task<int> AuthenticateUserAsync(string username, string password)
        {
            return await _airlineRepository. AuthenticateUserAsync(username, password);
        }
     /*   public async Task <Flight> FlightAsync()
        {
            return await _airlineRepository.FlightAsync();
        } */
        public async Task<List<Flight>> FlightShow()
        {
            return await _airlineRepository.FlightAsync();
        }

        public  async Task<List<Schedule>> ListSchedule()
        {
            return await _airlineRepository.ListSchedule();
        }
    }
}
