using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApi1.Data;
using WebApi1.Models;

namespace WebApi1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StateController : ControllerBase
    {
        private readonly StateRepository _StateRepository;

        public StateController(StateRepository StateRepository)
        {

            _StateRepository = StateRepository;

        }

        [HttpGet]

        public ActionResult GetAllState()
        {

            var cities = _StateRepository.SelectAll();

            return Ok(cities);

        }

        [HttpGet("{id}")]

        public IActionResult GetStateById(int id)
        {

            var State = _StateRepository.SelectByPK(id);

            if (State == null)

            {

                return NotFound();

            }

            return Ok(State);

        }

        #region select city by count
        [HttpGet("GetCityByCityCount/{CityCount}/{StateName}")]
        public IActionResult GetCityByCityCount(int CityCount, string StateName)
        {
            var State = _StateRepository.SelectCityByCityCount(CityCount, StateName);

            if (State == null)
            {
                return NotFound();
            }

            return Ok(State);
        }

        #endregion

        #region Insert
        [HttpPost]

        public IActionResult InsertState([FromBody] StateModel State)

        {

            if (State == null)

                return BadRequest();

            bool isInserted = _StateRepository.Insert(State);

            if (isInserted)

                return Ok(new { Message = "State inserted successfully!" });

            return StatusCode(500, "An error occurred while inserting the city.");

        }
        #endregion

        #region Update
        [HttpPut("{id}")]

        public IActionResult UpdateState(int id, [FromBody] StateModel State)

        {

            if (State == null || id != State.CountryID)
                return BadRequest();

            var isUpdated = _StateRepository.Update(State);

            if (!isUpdated)

                return NotFound();

            return NoContent();

        }
        #endregion

        [HttpDelete("{id}")]

        public IActionResult DeleteState(int id)
        {
            var isDeleted = _StateRepository.Delete(id);
            if (!isDeleted)
            {
                return NotFound();
            }


            return NoContent();

        }
    }
}
