using System.Web;
using System.Web.Mvc;

namespace Final_ProjectWeb_Mohamad_Nour
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
