using Microsoft.EntityFrameworkCore;
using taskdb6_2.Data;
using taskdb6_2.Models;

namespace taskdb6_2
{
    internal class Program
    {
        static void Main(string[] args)
        {

            // 1 Retrieve all categories from the production.categories table.

            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Categories.ToList();

            //foreach (var item in result)
            //{
            //    Console.WriteLine($"Customer Name: {item.FullName}, State: {item.State}");

            //}
            //-------------------------------------------------------------------------------------------------------

            // 2 Retrieve the first product from the production.products table.
            //    try {
            //        ApplicationDbContext context = new ApplicationDbContext();
            //        var result2 = context.Categories.First();
            //        Console.WriteLine(result2.CategoryId+" "+ result2.CategoryName);
            //    }
            //    catch { Console.WriteLine("cant find"); }
            //}

            //-------------------------------------------------------------------------------------------------------

            //Retrieve a specific product from the production.products table by ID.
            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Products.Find(5);

            //-------------------------------------------------------------------------------------------------------

            // Retrieve all products from the production.products table with a certain  model year.
            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Products.Where(e=>e.ModelYear==2016);
            //foreach (var item in result)
            //{
            //    Console.WriteLine(item.ProductId+" | " + item.ProductName+" | "+ item.ModelYear);
            //}

            //-------------------------------------------------------------------------------------------------------

            //Retrieve a specific customer from the sales.customers table by ID.
            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Customers.Find(10);

            //    Console.WriteLine(result.CustomerId + " | " + result.FirstName );

            //-------------------------------------------------------------------------------------------------------

            //Retrieve a list of product names and their corresponding brand names.
            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Products.Include(e=>e.Brand).ToList();
            //foreach (var item in result)
            //{
            //    Console.WriteLine(item.ProductId + " | " + item.ProductName + " | " +item.Brand.BrandName );
            //}

            //-------------------------------------------------------------------------------------------------------

            //Count the number of products in a specific category.
            // ApplicationDbContext context = new ApplicationDbContext();
            // var result = context.Products.Include(e => e.Category).Where(e => e.Category.CategoryName == "Children Bicycles");
            //int c = result.Count();
            // Console.WriteLine(c);

            //-------------------------------------------------------------------------------------------------------

            //Calculate the total list price of all products in a specific category.
            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Products.Include(e => e.Category).Where(e => e.Category.CategoryName == "Children Bicycles").Sum(e=>e.ListPrice);

            //Console.WriteLine(result);

            //-------------------------------------------------------------------------------------------------------

            //Calculate the average list price of products.
            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Products.ToList().Average(e => e.ListPrice);

            //Console.WriteLine(result);

            //-------------------------------------------------------------------------------------------------------

            //Retrieve orders that are completed.

            //ApplicationDbContext context = new ApplicationDbContext();
            //var result = context.Orders.Where(e=>e.OrderStatus== 4).ToList();
            //foreach (var item in result)
            //{
            //      Console.WriteLine(item.OrderId+"|"+item.OrderStatus+"|"+item.OrderDate);
            //    Console.WriteLine(result.Count());
            //}
          
        }
    }
}
