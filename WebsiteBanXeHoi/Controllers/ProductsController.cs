using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DomainModel.Abstract;
using DomainModel.Concrete;
using DomainModel.Entities;
using System.Xml.Linq;


namespace WebsiteBanXeHoi.Controllers
{
    public class ProductsController : Controller
    {      
        public int PageSize = 4; 
        private IProductsRepository productsRepository;

        public ProductsController(IProductsRepository productsRepository)
        {
            this.productsRepository = productsRepository;
        }

        public ViewResult List(string category, int page)
        {
            var productsInCategory = (category == null) ? productsRepository.Products : productsRepository.Products.Where(x => x.Manufacture.Name == category);

            int numProducts = productsInCategory.Count();
            ViewData["TotalPages"] = (int)Math.Ceiling((double)numProducts / PageSize);
            ViewData["CurrentPage"] = page;
            ViewData["CurrentCategory"] = category; 

            return View(productsInCategory
                        .Skip((page - 1) * PageSize)
                        .Take(PageSize)
                        .ToList()
                        );
        }

        public WatermarkedImageResult GetImage(int ID)
        {
            Product product = (from p in productsRepository.Products
                               where p.ID == ID
                               select p).First();
            string watermarkText = "www.thegioixehoi.com";
            string watermarkAuthorText = "Design by Huỳnh Nam";
            return new WatermarkedImageResult(Server.MapPath(product.ImagePath), watermarkText , watermarkAuthorText);
           
        }

        public ViewResult XemChiTiet(int ID , string returnUrl)
        {
            ViewData["returnUrl"] = returnUrl;
            var product = (from p in productsRepository.Products
                               where p.ID == ID
                               select p).FirstOrDefault();
            return View(product);
        }

        public ActionResult GetTime(string zone)
        {
            DateTime time = DateTime.UtcNow.AddHours(offsets[zone]);
            if (Request.IsAjaxRequest())
            {                
                string fragment = string.Format(
                "<div>Bây giờ là {1:h:MM:ss tt} tại {0}.</div>", zone.ToUpper(), time);
                return Content(fragment);
            }
            else
            {
               
                return View(time);
            }
        }
        private Dictionary<string, int> offsets = new Dictionary<string, int> { { "vn", 0 }, { "hk", 1 }, { "london", -7 }, { "us", -15 } };
    }
}
