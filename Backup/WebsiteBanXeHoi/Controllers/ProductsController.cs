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
      
        public int PageSize = 4; // Will change this later
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
            ViewData["CurrentCategory"] = category; // For use when generating page links

            return View(productsInCategory
                        .Skip((page - 1) * PageSize)
                        .Take(PageSize)
                        .ToList()
                        );
        }


        // Lấy hình anh show lên mà không xai wartermark
        //public FilePathResult GetImage(int ID)
        //{
        //    Product product = (from p in productsRepository.Products
        //                       where p.ID == ID
        //                       select p).First();
        //    return File(product.ImagePath, product.ImageMimeType);
        //}



        // Hàm mới dùng để hiện thị WarterMarked. Chú ý rằng: Những kiểu có suffix "Result" là luôn kế thừa từ lớp ActionResult (hay nói đúng hơn cũng là 1 result)
        public WatermarkedImageResult GetImage(int ID)
        {
            Product product = (from p in productsRepository.Products
                               where p.ID == ID
                               select p).First();
            string watermarkText = "www.thegioixehoi.com";
            string watermarkAuthorText = "Design by Huỳnh Nam";

            return new WatermarkedImageResult(product.ImagePath, watermarkText , watermarkAuthorText);
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
            //DateTime time = DateTime.Now.AddHours(offsets[zone]);
            //return string.Format("<div>Bây giờ tại {0} là {1:h:MM:ss tt}</div>", zone.ToUpper(), time);

            DateTime time = DateTime.UtcNow.AddHours(offsets[zone]);
            if (Request.IsAjaxRequest())
            {
                // Produce a fragment of HTML
                string fragment = string.Format(
                "<div>Bây giờ là {1:h:MM:ss tt} tại {0}.</div>", zone.ToUpper(), time);
                return Content(fragment);
            }
            else
            {
                // Produce a complete HTML page
                return View(time);
            }
        }
        private Dictionary<string, int> offsets = new Dictionary<string, int> { { "vn", 0 }, { "hk", 1 }, { "london", -7 }, { "us", -15 } };
    }
}
