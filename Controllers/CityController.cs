using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Diagnostics.Metrics;
using WebApi1.Data;
using WebApi1.Models;

namespace WebApi1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly CityRepository _cityRepository;

        public CityController(CityRepository cityRepository)
        {

            _cityRepository = cityRepository;

        }

        #region getall
        [HttpGet]
        public ActionResult GetAllCities()
        {

            var cities = _cityRepository.SelectAll();

            return Ok(cities);

        }
        #endregion

        #region get by id
        [HttpGet("{id}")]

        public IActionResult GetCityById(int id)
        {

            var city = _cityRepository.SelectByPK(id);

            if (city == null)

            {

                return NotFound();
            }
            return Ok(city);

        }

        #endregion

        #region Insert
        [HttpPost]

        public IActionResult InsertCity([FromBody] CityModel city)

        {

            if (city == null)

                return BadRequest();

            bool isInserted = _cityRepository.Insert(city);

            if (isInserted)

                return Ok(new { Message = "City inserted successfully!" });

            return StatusCode(500, "An error occurred while inserting the city.");

        }
        #endregion

        #region Update
        [HttpPut("{id}")]

        public IActionResult UpdateCity(int id, [FromBody] CityModel city)

        {

            if (city == null || id != city.CityID)

                return BadRequest();

            var isUpdated = _cityRepository.Update(city);

            if (!isUpdated)

                return NotFound();

            return NoContent();

        }
        #endregion

        #region delete

        [HttpDelete("{id}")]

        public IActionResult DeleteCity(int id)
        {
            var isDeleted = _cityRepository.Delete(id);
            if (!isDeleted)
            {
                return NotFound();
            }
            return NoContent();

        }

        #endregion
    }
}
