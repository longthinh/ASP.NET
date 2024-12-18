using ASP.NET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class HomeController : Controller
    {
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();

            objHomeModel.ListCategory = objASPNETEntities.Categories.ToList();
            objHomeModel.ListProduct = objASPNETEntities.Products.ToList();
            objHomeModel.ListBrand = objASPNETEntities.Brands.ToList();
            objHomeModel.ListUser = objASPNETEntities.Users.ToList();

            return View(objHomeModel);
        }

    }
}