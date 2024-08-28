using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem.Model
{
    public class FlightDeparture
    {
        public int FlightDepartureId;
        public int FlightID { get; set; }
        public int AirportId { get; set; }
        public  int ScheduleId {  get; set; }
        public Flight flight;
        public Airport airport;
        public Schedule schedule;
    }
}
