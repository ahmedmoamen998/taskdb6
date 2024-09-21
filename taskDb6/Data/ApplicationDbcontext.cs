using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using taskDb6.Models;

namespace taskDb6.Data
{
    internal class ApplicationDbcontext : DbContext
    {
              public DbSet<Course>  Courses  { get; set; }
              public DbSet<StudentCourse> StudentCourses { get; set; }
              public DbSet<Student>  Students { get; set; }
              public DbSet<Resource>  Resources  { get; set; }
              public DbSet<Homework>  Homeworks { get; set; }
                
              
             protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
            base.OnConfiguring(optionsBuilder);

            optionsBuilder.UseSqlServer("Data Source=.\\NEWMSSQLSERVER;" + "Initial Catalog=firstef;" +"Integrated Security=True;" + "TrustServerCertificate=True");

             } 
                

    }
    
}

