﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.NET.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult AllCategory()
        {
            return View();
        }

        public ActionResult ProductByCategory()
        {
            return View();
        }

        public ActionResult ListCategory()
        {
            return View();
        }

        public ActionResult GridCategory()
        {
            return View();
        }
    }
}