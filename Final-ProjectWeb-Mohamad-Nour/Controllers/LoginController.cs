using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Final_ProjectWeb_Mohamad_Nour.Models;

namespace Final_ProjectWeb_Mohamad_Nour.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            ViewBag.ReturnUrl = Request.QueryString["ReturnUrl"];
            UserProfile user = new UserProfile();
            return View(user);
        }
        [HttpPost]
        public ActionResult Index(UserProfile user)
        {


            if (!user.Username.Equals("nour"))
            {

                ViewBag.Error = "Sorry , it is invalid Username";

            }


            else if (!user.Password.Equals("2021c"))
            {

                ViewBag.Error = "Sorry , it is invalid  Password";
            }

            else
            {
                HttpCookie cookie = new HttpCookie("AuthCookie");
                cookie.Value = user.Username;


                // As I know 30 days it is good for these days in order to let the user feel more comfortable.
                if (user.RememberMe)
                {
                    cookie.Expires = DateTime.Now.AddDays(30);
                }
                cookie.Path = Request.ApplicationPath;
                Response.Cookies.Add(cookie);

                string return_url = Request.QueryString["ReturnUrl"];
                if (string.IsNullOrEmpty(return_url))
                {
                    return Redirect("/");
                }
                else
                {
                    return Redirect(return_url);
                }
            }


            return View(user);

        }

        public ActionResult Logout()
        {
            HttpCookie cookie = new HttpCookie("AuthCookie");
            cookie.Expires = DateTime.Now.AddDays(-1);
            cookie.Path = Request.ApplicationPath;

            Response.Cookies.Add(cookie);

            return Redirect("/");
        }








    }
}