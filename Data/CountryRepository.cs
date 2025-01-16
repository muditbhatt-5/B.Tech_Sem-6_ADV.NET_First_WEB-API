using Microsoft.Data.SqlClient;
using System.Data;
using System.Diagnostics.Metrics;
using WebApi1.Models;

namespace WebApi1.Data
{
    public class CountryRepository
    {
        private readonly string _connectionString;

        public CountryRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("ConnectionString");
        }

        #region Select All
        public IEnumerable<CountryModel> SelectAll()
        {
            var cities = new List<CountryModel>();
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("PR_LOC_Country_SelectAll", conn)
                {

                    CommandType = CommandType.StoredProcedure
                };
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cities.Add(new CountryModel
                    {
                        CountryID = Convert.ToInt32(reader["CountryID"]),
                        CountryName = reader["CountryName"].ToString(),
                        CountryCode = reader["CountryCode"].ToString()
                    });
                }
            }
            return cities;
        }
        #endregion

        #region Select By Pk
        public CountryModel SelectByPK(int CountryID)

        {

            CountryModel Country = null;

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_Country_SelectByPK", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@CountryID", CountryID);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())

                {

                    Country = new CountryModel

                    {

                        CountryID = Convert.ToInt32(reader["CountryID"]),

                        CountryName = reader["CountryName"].ToString(),

                        CountryCode = reader["CountryCode"].ToString()

                    };

                }

            }
            return Country;
        }

        #endregion

        #region Insert

        public bool Insert(CountryModel Country)

        {

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_Country_Insert", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@CountryName", Country.CountryName); // Ensure @Modified is provided
                cmd.Parameters.AddWithValue("@CountryCode", Country.CountryCode);
                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery(); // Execute the stored procedure

                // Return true if the insertion was successful

                return rowsAffected > 0;

            }

        }
        #endregion

        #region Update
        public bool Update(CountryModel Country)

        {

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_Country_Update", conn)

                {

                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@CountryID", Country.CountryID);

                cmd.Parameters.AddWithValue("@CountryName", Country.CountryName); 
                
                cmd.Parameters.AddWithValue("@CountryCode", Country.CountryCode);
                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery();

                return rowsAffected > 0;

            }

        }

        #endregion

        #region Delete
        public bool Delete(int CountryID)

        {

            using (SqlConnection conn = new SqlConnection(_connectionString))

            {

                SqlCommand cmd = new SqlCommand("PR_LOC_Country_Delete", conn)

                {

                    CommandType = CommandType.StoredProcedure

                };

                cmd.Parameters.AddWithValue("@CountryID", CountryID);

                conn.Open();
                int rowAffected = cmd.ExecuteNonQuery();
                return rowAffected > 0;
            }
        }
        #endregion
    }
}
