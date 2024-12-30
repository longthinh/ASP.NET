using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models;

namespace ChuyenDeASPNET.Controllers
{
    public class ProfileController : Controller
    {
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        // GET: Profile
        public ActionResult ProfileMain()
        {
            HomeModel objHomeModel = new HomeModel();
            // Lấy danh sách sản phẩm và danh mục từ cơ sở dữ liệu
            objHomeModel.ListProduct = objASPNETEntities.Products.ToList();
            objHomeModel.ListCategory = objASPNETEntities.Categories.ToList();
            return View(objHomeModel);
        }
        public ActionResult Order()
        {
            return View();
        }
        public ActionResult Seller()
        {
            return View();
        }
        public ActionResult Setting()
        {
            return View();
        }
        public ActionResult Wishlist()
        {
            return View();
        }
        public ActionResult Address()
        {
            return View();
        }
    }
}