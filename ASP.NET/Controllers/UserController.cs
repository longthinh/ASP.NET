using ASP.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Login()
        {
            ViewBag.ErrorMessage = null;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            // Kiểm tra thông tin đăng nhập
            if (username == "sa" && password == "sa")
            {
                // Chuyển hướng về trang chủ khi đăng nhập thành công
                return RedirectToAction("Index", "Home");
            }

            // Gửi thông báo lỗi khi đăng nhập thất bại
            ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không chính xác";
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User objSubject)
        {
            return View(objSubject);
        }
    }
}