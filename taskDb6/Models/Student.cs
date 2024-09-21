using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace taskDb6.Models
{
    internal class Student
    {
        //        •	Student:
        //•	StudentId
        //•	Name(up to 100 characters, unicode)
        //•	PhoneNumber(exactly 10 characters, not unicode, not required)
        //•	RegisteredOn(DateTime)
        //•	Birthday(not required)
        public int Id { get; set; }
        public string Name { get; set; }
        public string? PhoneNumber { get; set; }

        public DateTime RegisteredOn { get; set; }
        public DateTime Birthday { get; set; }
        public List<Course> CoursesS { get; set; }
        public List<Homework>  HomeworksS { get; set; }

    }
}
