using FluentValidation;
using WebApi1.Models;

namespace WebApi1.Data
{
    public class StateValidation : AbstractValidator<StateModel>
    {
        public StateValidation()
        {
            RuleFor(c => c.StateID).NotEmpty().WithMessage("Please Enter State Id!");
            RuleFor(c => c.StateName).NotEmpty().WithMessage("Please Enter State Name!!😐");
            RuleFor(c => c.StateCode).NotEmpty().WithMessage("Please Enter State Code!!😐");
            RuleFor(c => c.CountryID).NotEmpty().WithMessage("Please Enter Country ID!!😐");
            RuleFor(c => c.CityID).NotEmpty().WithMessage("Please Enter City Id!!😐");
            RuleFor(c => c.CityName).NotEmpty().WithMessage("Please Enter City Name!!😐");
            RuleFor(c => c.CityCode).NotEmpty().WithMessage("Please Enter City Code!!😐");
        }
    }
}
