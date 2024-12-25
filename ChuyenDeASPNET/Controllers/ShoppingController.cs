using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class ShoppingController : Controller
    {
        // GET: Shopping
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        public ActionResult Cart()
        {
            HomeModel objHomeModel = new HomeModel();
            // Lấy danh sách sản phẩm và danh mục từ cơ sở dữ liệu
            objHomeModel.ListProduct = objASPNETEntities.Products.ToList();
            return View(objHomeModel);
        }
    }
}