using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Security;
using WebsiteBanXeHoi.HtmlHelpers;
using DomainModel.Services;

namespace WebsiteBanXeHoi.Controllers
{
    public class AccountController : Controller
    {
        public static int count = 0;
        private IOrderSubmitter orderSubmitter;
        public AccountController(IOrderSubmitter orderSubmitter)
        {
            this.orderSubmitter = orderSubmitter;
        }
       
        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult LogOn()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult LogOn(string name, string password, string returnUrl)
        {
            if (FormsAuthentication.Authenticate(name, password))
            {
                returnUrl = returnUrl ?? Url.Action("Index", "Admin");
                FormsAuthentication.SetAuthCookie(name, false);
                return Redirect(returnUrl); ;
            }
            else
            {
                count++;
                if (count > 3)
                {
                    count = 0;
                    return View("QuenMatKhau");
                }
                ViewData["lastLoginFailed"] = true;
                return View();
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult QuenMatKhau(string email, string myCaptcha, string attempt)
        {         
            if (CaptchaHelper.VerifyAndExpireSolution(HttpContext, myCaptcha, attempt))
            {
                
                ViewData["KiemTraCaptcha"] = true;
                orderSubmitter.SendEmail(email);
                return View("LayMatKhauThanhCong");
            }
            else
            {               
                ViewData["KiemTraCaptcha"] = false;
                return View();
            }
            
        }
    }
}
