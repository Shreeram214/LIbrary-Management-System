using System.Web.Mvc;

namespace LMStstem.Areas.librarians
{
    public class librariansAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "librarians";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "librarians_default",
                "librarians/{controller}/{action}/{id}",
                new { Controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}