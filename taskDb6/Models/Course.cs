﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace taskDb6.Models
{
    internal class Course
    {
        public int Id { get; set; } 
        public string Name { get; set; }
        public string? Description { get; set; }
    
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double Price { get; set; }
        public List <Student> StudentsC { get; set; }

    }
}
