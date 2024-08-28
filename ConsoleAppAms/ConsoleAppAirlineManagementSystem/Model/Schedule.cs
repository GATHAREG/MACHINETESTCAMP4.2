using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem.Model
{
    public class Schedule
    {
        public int ScheduleId { get; set; }
        public  DateTime dateOfTravel { get; set; }
        public DateTime TimeOfTravel { get; set; }
    }
}
