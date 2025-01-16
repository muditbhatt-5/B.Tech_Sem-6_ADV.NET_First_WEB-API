using Microsoft.Data.SqlClient;
using System.Data;
using WebApi1.Models;

namespace WebApi1.Data
{
    public class StateRepository
    {
        private readonly string _connectionString;

        public StateRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("ConnectionString");
        }


        public IEnumerable<StateModel> SelectAll()
        {
            var cities = new List<StateModel>();
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("PR_LOC_State_SelectAll", conn)
                {

                    CommandType = CommandType.StoredProcedure
                };
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cities.Add(new StateModel
                    {
                        StateID = Convert.ToInt32(reader["StateID"]),
                        CityCount = Convert.ToInt32(reader["CityCount"]),
                        StateName = reader["StateName"].ToString(),
                        StateCode = reader["StateCode"].ToString(),
                        CountryID = Convert.ToInt32(reader["CountryID"])
                    });
                }
            }
            return cities;
        }

        #region select by pk
        public StateModel SelectByPK(int StateID)

        {

            StateModel State = null;

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_State_SelectByPk", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@StateID", StateID);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())

                {

                    State = new StateModel

                    {

                        StateID = Convert.ToInt32(reader["StateID"]),

                        StateName = reader["StateName"].ToString(),

                        StateCode = reader["StateCode"].ToString(),

                        CountryID = Convert.ToInt32(reader["CountryID"])

                    };

                }

            }
            return State;
        }
        #endregion


        #region Select City By City Count
        public StateModel SelectCityByCityCount(int CityCount,string StateName)

        {

            StateModel State = null;

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("GetCityDetailsByState", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@CityCount", CityCount);
                cmd.Parameters.AddWithValue("@StateName", StateName);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())

                {

                    State = new StateModel

                    {
                        CityID = reader["CityID"].ToString(),
                        CityName = reader["CityName"].ToString(),
                        CityCount = Convert.ToInt32(reader["CityCode"]),
                        StateID = Convert.ToInt32(reader["StateID"]),
                        StateName = reader["StateName"].ToString(),
                        StateCode = reader["StateCode"].ToString()

                    };

                }

            }
            return State;
        }
        #endregion

        #region Insert

        public bool Insert(StateModel state)

        {

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_state_Insert", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@StateName", state.StateName);
                cmd.Parameters.AddWithValue("@StateCode", state.StateCode);
                cmd.Parameters.AddWithValue("@CountryID", state.CountryID);
                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery(); // Execute the stored procedure

                // Return true if the insertion was successful

                return rowsAffected > 0;

            }

        }
        #endregion

        #region Update
        public bool Update(StateModel state)

        {

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_State_Update", conn)

                {

                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@StateID", state.StateID);
                cmd.Parameters.AddWithValue("@StateName", state.StateName);
                cmd.Parameters.AddWithValue("@StateCode", state.StateCode);
                cmd.Parameters.AddWithValue("@CountryID", state.CountryID);
                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery();

                return rowsAffected > 0;

            }

        }

        #endregion
        public bool Delete(int StateID)

        {

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_State_Delete", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@StateID", StateID);

                conn.Open();
                int rowAffected = cmd.ExecuteNonQuery();
                return rowAffected > 0;
            }
        }
    }
}
