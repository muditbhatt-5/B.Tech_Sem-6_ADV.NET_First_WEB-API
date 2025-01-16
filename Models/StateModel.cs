namespace WebApi1.Models
{
    public class StateModel
    {
        public int StateID { get; set; }
        public string StateName { get; set; }
        public string StateCode { get; set; }
        public int CountryID { get; set; }

        public int CityCount { get; set; }

        public string CityID { get; set; }
        public string CityName { get; set; }
        public string CityCode { get; set; }
    }
}
