using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET.Context
{
    public class HomeModel
    {
        public List<Product> ListProduct { get; set; }
        public List<Category> ListCategory { get; set; }
        public List<Brand> ListBrand { get; set; }
        public List<User> ListUser { get; set; }
    }
}