using ConsoleAppAirlineManagementSystem.Model;
using SqlServerConnectionLibrary;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAirlineManagementSystem.Repository
{
    public class AirlineRepositoryImplementaion : IAirlineRepository
    {

        //ConnectionString
        string connString = ConfigurationManager.ConnectionStrings["CswinThree"].ConnectionString;

        public  async Task AddArrivalDetailsAsync(FlightArrival FlightArr)
        {
            using (SqlConnection con = SQlServerConnectionManager.OpenConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("AddFlightArr", con))

                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FlightID", FlightArr.FlightID);
                    command.Parameters.AddWithValue("@AirportId", FlightArr.AirportId);
                    command.Parameters.AddWithValue("@ScheduleId", FlightArr.ScheduleId);
                    command.Parameters.AddWithValue("@FlightDepartureId",FlightArr.FlightDepartureId);
                    await command.ExecuteNonQueryAsync();


                }
            }
        }

        public async Task AddDepartureDetailsAsync(FlightDeparture flightDept)
        {
            using (SqlConnection con = SQlServerConnectionManager.OpenConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("AddFlightDept", con))

                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FlightID", flightDept.FlightID);
                    command.Parameters.AddWithValue("@AirportId",flightDept.AirportId);
                    command.Parameters.AddWithValue("@ScheduleId",flightDept.ScheduleId);
                    await command.ExecuteNonQueryAsync();


                }
            }
        }
       


          public async Task<List<Airport>> AirportShow()

          {
            List<Airport> airports = new List<Airport>();
            using (SqlConnection conn = SQlServerConnectionManager.OpenConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("AirportShow", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {//Assign values to object and add each obje to list
                            Airport airport = new Airport
                            {
                                AirportId = Convert.ToInt32(reader["AirportId"]),
                                AirportName = reader["AirportName"].ToString(),
                                CityName = reader["CityName"].ToString()


                            };
                            airports.Add(airport);


                        }
                    }
                   

                }
                return airports;

            }
          }
        //getting the Role ID of corressponding username and password
        public async Task<int> AuthenticateUserAsync(string username, string password)
        {
            int roleId = 0;
            using (SqlConnection conn = SQlServerConnectionManager.OpenConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("Sp_GetUserPassword", conn))
                {
                    //CommadType
                    command.CommandType = CommandType.StoredProcedure;
                    //Input parameters
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);
                    //output parameters
                    SqlParameter roleIdParam = new SqlParameter("@RoleId", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output,
                    };
                    command.Parameters.Add(roleIdParam);

                    await command.ExecuteNonQueryAsync();

                    if (roleIdParam.Value != DBNull.Value)
                    {
                        roleId = Convert.ToInt32(roleIdParam.Value);
                    }
                    return roleId;
                } 
            }

        }

        public  async Task<List<Flight>> FlightAsync()
        {
            List <Flight> flights = new List <Flight>();
            using (SqlConnection conn = SQlServerConnectionManager.OpenConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("FlightShow", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {//Assign values to object and add each object to list
                            Flight flight = new  Flight
                            {
                              FlightID =  Convert.ToInt32(reader["FlightID"]),
                              FlightName = reader["FlightName"].ToString()


                            };
                            flights.Add(flight);
                            
                            
                            

                           
                        }
                    }
                    

                }
                return flights;
            }
        }

        public async Task<List<Schedule>> ListSchedule()
        {
            List<Schedule> schedules = new List<Schedule>();
            using (SqlConnection conn = SQlServerConnectionManager.OpenConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {//Assign values to object and add each object to list
                            Schedule schedule = new Schedule
                            {
                                ScheduleId = Convert.ToInt32(reader["ScheduleId "]),
                                dateOfTravel = Convert.ToDateTime(reader["dateOfTravel"]),
                                TimeOfTravel = Convert.ToDateTime(reader["TimeOfTravel"])


                            };
                            schedules.Add(schedule);




                        }
                    }
                

                }
                return schedules;
            }

        } 
    }
}




        

        
   

