using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace taskDb6.Models
{
    internal class Resource
    {
        //        •	Resource:
        //•	ResourceId
        //•	Name(up to 50 characters, unicode)
        //•	Url(not unicode)
        //•	ResourceTy
        public int ResourceId { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
     
        public enum ResourceType;
        public int CourseId{ get; set; }
        public Course CourseR { get; set; }  
    }
}
