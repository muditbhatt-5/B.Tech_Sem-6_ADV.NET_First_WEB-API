using FluentValidation;
using WebApi1.Models;

namespace WebApi1.Data
{
    public class CountryValidation : AbstractValidator<CountryModel>
    {
        public CountryValidation() 
        {
            RuleFor(c => c.CountryID).NotEmpty().WithMessage("Please Enter Value!!😐");
            RuleFor(c => c.CountryName).NotEmpty().WithMessage("Please Enter Value!!😐");
            RuleFor(c => c.CountryCode).NotEmpty().WithMessage("Please Enter Value!!😐");
        }
    }
}
