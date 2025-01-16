using FluentValidation;
using WebApi1.Models;

namespace WebApi1.Data
{
    public class CityValidation : AbstractValidator<CityModel>
    {
        public CityValidation() 
        {
            RuleFor(c => c.CityID).NotEmpty().WithMessage("Please Enter Value!!😐");
            RuleFor(c => c.StateID).NotEmpty().WithMessage("Please Enter Value!!😐");
            RuleFor(c => c.CountryID).NotEmpty().WithMessage("Please Enter Value!!😐");
            RuleFor(c => c.CityName).NotEmpty().WithMessage("Please Enter Value!!😐");
            RuleFor(c => c.CityCode).NotEmpty().WithMessage("Please Enter Value!!😐");
        }
    }
}
