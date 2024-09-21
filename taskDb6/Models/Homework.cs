using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace taskDb6.Models
{
    internal class Homework
    {
        //        •	Homework:
        //•	HomeworkId
        //•	Content(string, linking to a file, not unicode)
        //•	ContentType(enum – can be Application, Pdf or Zip)
        //•	SubmissionTime
        //•	StudentId
        public int HomeworkId { get; set; }

        public string Content { get; set; }
        public enum ContentType;
        public DateTime SubmissionTime { get; set; }

        public int StudentId { get; set; }
        public Student StudentH { get; set; }


    }
}
