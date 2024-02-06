using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using LMStstem.DataAccess;
using LMStstem.Models;

namespace LMStstem.Controllers
{
    [AllowAnonymous] //This will make the controller's actions or view can access without authrization!!!!
    public class AccountController : Controller
    {
        AccountDAL _account = new AccountDAL();
        // GET: Account
        public ActionResult Login()
        {
            return View(new UserModel());
        }

        [HttpPost]
        public ActionResult Login(UserModel model)
        {
            try
            {
                var User = _account.GetUser(model);
                if (User != null)
                {
                    FormsAuthentication.SetAuthCookie(model.UserID.ToString(), true);
                    Session.Add("UserId", User.UserID);
                    Session.Add("UserName", User.Username);
                    Session.Add("UserRole", User.UserRole);
                    if (User.UserRole == 3)
                        return RedirectToAction("Index", "Home",new { area = "librarians"});
                    else if (User.UserRole == 2)
                        return RedirectToAction("Index", "Home", new { area = "Staff" });
                    else if (User.UserRole == 1)
                        return RedirectToAction("Index", "Home", new { area = "Student" });
                    else
                    {
                        ViewBag.ErrorMessage = "Not valid Role!!!";
                        return View(model);
                    }
                }
                else
                {
                    ViewBag.ErrorMessage = "Invalid Email or Password!";
                    return View(model);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

        public ActionResult SignUp()
        {
            return View(new UserModel());
        }

        [HttpPost]
        public ActionResult SignUp(UserModel model)
        {
            try
            {
                int usedId = _account.SignUp(model);
                ViewBag.SuccessMessage = $"User Successfully Created with User ID: {usedId}";
                return View("Login");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(UserModel model)
        {
            return View();
        }


        public JsonResult GetRoles()
        {
            try
            {
                var Roles = _account.GetUserRoles();
                return Json(Roles, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json("", JsonRequestBehavior.AllowGet);
            }
        }
    }
}