using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics.Metrics;
using WebApi1.Data;
using WebApi1.Models;

namespace WebApi1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CountryController : ControllerBase
    {
        private readonly CountryRepository _countryRepository;

        public CountryController(CountryRepository countryRepository)
        {

            _countryRepository = countryRepository;

        }

        [HttpGet]

        public ActionResult GetAllCities()
        {

            var cities = _countryRepository.SelectAll();

            return Ok(cities);

        }

        [HttpGet("{id}")]

        public IActionResult GetCountryById(int id)
        {

            var Country = _countryRepository.SelectByPK(id);

            if (Country == null)

            {

                return NotFound();

            }

            return Ok(Country);

        }

        #region Insert
        [HttpPost]

        public IActionResult InsertCountry([FromBody] CountryModel Country)

        {

            if (Country == null)

                return BadRequest();

            bool isInserted = _countryRepository.Insert(Country);

            if (isInserted)

                return Ok(new { Message = "Country inserted successfully!" });

            return StatusCode(500, "An error occurred while inserting the city.");

        }
        #endregion

        #region Update
        [HttpPut("{id}")]

        public IActionResult UpdateCountry(int id, [FromBody] CountryModel Country)

        {

            if (Country == null || id != Country.CountryID)
                return BadRequest();

            var isUpdated = _countryRepository.Update(Country);

            if (!isUpdated)

                return NotFound();

            return NoContent();

        }
        #endregion

        [HttpDelete("{id}")]

        public IActionResult DeleteCountry(int id)
        {
            var isDeleted = _countryRepository.Delete(id);
            if (!isDeleted)
            {
                return NotFound();
            }


            return NoContent();

        }
    }
}
