using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DomainModel.Abstract;
using DomainModel.Entities;
using System.Web.Security;
using System.IO;
using System.Web.Script.Serialization;

namespace WebsiteBanXeHoi.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private IProductsRepository productsRepository;
        public AdminController(IProductsRepository productsRepository)
        {
            this.productsRepository = productsRepository;
            
        }
        public ActionResult Details(int id) { return View(); }

        
        public ViewResult Create()
        {
            return View("Edit", new Product());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Edit(int ID)
        {
            Product product = (from p in productsRepository.Products
                               where p.ID == ID
                               select p).First();
            return View(product);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(Product product, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    product.ImageMimeType = image.ContentType;
                    string filenameimage = ((image.FileName).Split('\\')).Last();
                    string path = Server.MapPath("~/Image/" + filenameimage);
                    product.ImagePath = path;
                    
                    image.SaveAs(path);
                }
                productsRepository.SaveProduct(product);
                TempData["message"] = "Xe "+ product.Name + " đã được lưu lại!";
                return RedirectToAction("Index");
            }
            else
                return View(product);
        }

        private const int PageSize = 3;

        public ViewResult Index(int? page)
        {
            ViewData["currentPage"] = page ?? 1;
            ViewData["totalPages"] = (int)Math.Ceiling(1.0 * productsRepository.Products.Count() / PageSize);
            var items = productsRepository.Products.Skip(((page ?? 1) - 1) * PageSize).Take(PageSize);
            return View(items);
        }       
        [AcceptVerbs(HttpVerbs.Post)] 
        public JavaScriptResult DeleteItem(int ID)
        {
            var itemToDelete = GetItem(ID);
            productsRepository.DeleteProduct(itemToDelete);
            var script = string.Format("OnItemDeleted({0}, {1})",itemToDelete.ID,JavaScriptEncode(itemToDelete.Name));
            return JavaScript(script);
        }
        private Product GetItem(int ID)
        {
            Product product = (from p in productsRepository.Products
                               where p.ID == ID
                               select p).First();
            return product;
        }
        private static string JavaScriptEncode(string str)
        {
            return new JavaScriptSerializer().Serialize(str);
        }
    }
}
