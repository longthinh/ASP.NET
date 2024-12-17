using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET.Models
{
    public class User
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Sex { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public int Phone { get; set; }
        public string Password { get; set; }
    }
}