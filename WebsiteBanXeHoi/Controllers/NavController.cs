using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DomainModel.Abstract;
using System.Web.Routing;

namespace WebsiteBanXeHoi.Controllers
{
    public class NavController : Controller
    {
        private IProductsRepository productsRepository;
        public NavController(IProductsRepository productsRepository)
        {
            this.productsRepository = productsRepository;
        }
        public ViewResult Menu(string highlightCategory)
        {
           
            List<NavLink> navLinks = new List<NavLink>();

            navLinks.Add(new CategoryLink(null)
            {
                IsSelected = (highlightCategory == null)
            });

           
            var categories = productsRepository.Products.Select(x => x.Manufacture.Name);
            foreach (string category in categories.Distinct().OrderBy(x => x))
            {
                navLinks.Add(new CategoryLink(category)
                {
                    IsSelected = (category == highlightCategory)
                });
            }
               
            return View(navLinks);
        }

    }

    public class NavLink 
    {
        public string Text { get; set; }
        public RouteValueDictionary RouteValues { get; set; }
        public bool IsSelected { get; set; }
    }

    public class CategoryLink : NavLink 
    {
        public CategoryLink(string category)
        {
            Text = category ?? "Home";
            RouteValues = new RouteValueDictionary(new
            {
                controller = "Products",
                action = "List",
                category = category,
                page = 1
            });
        }
    }
}
