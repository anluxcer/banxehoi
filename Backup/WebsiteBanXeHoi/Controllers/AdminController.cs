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
    [Authorize]//: Chạy thiệt hãy bật
    public class AdminController : Controller
    {
        private IProductsRepository productsRepository;


        public AdminController(IProductsRepository productsRepository)
        {
            this.productsRepository = productsRepository;
            
        }

        
        //public ViewResult Index()
        //{
        //    return View(productsRepository.Products.ToList());
        //}

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
                // TODO: Add insert logic here
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ViewResult Edit(int ID) // Bởi vì object lấy về là một Product , do đó tham số truyền vào cho hàm xử lý này bắt buộc phải trùng với tên của field trong Product table --- còn mọi thứ như: nạp(fetch) đối tượng , xác định tại dòng nào thì do framework làm giúp (lúc mà ta chọn thiết lập các control trong Index.aspx). Đây chính là mấu chốt các tham số truyền vào hàm mà trước giờ ta không hiểu từ đâu nó ra. Mọi thứ chính là từ strong-type-name và tên đúng các property trong những object dc kết nối với View này....và ngoài ra còn do tính năng hỗ trợ của submit ...
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
            else // Validation error, so redisplay same view
                return View(product);
        }

        // Xóa thông thường không xài Ajax

        //public RedirectToRouteResult Delete(int ID)
        //{
        //    Product product = (from p in productsRepository.Products
        //                       where p.ID == ID
        //                       select p).First();
        //    productsRepository.DeleteProduct(product);
        //    TempData["message"] = product.Name + " has been deleted";
        //    return RedirectToAction("Index");
        //}


        // Chức năng phân trang

        private const int PageSize = 3;

        public ViewResult Index(int? page)
        {
            ViewData["currentPage"] = page ?? 1;
            ViewData["totalPages"] = (int)Math.Ceiling(1.0 * productsRepository.Products.Count() / PageSize);
            var items = productsRepository.Products.Skip(((page ?? 1) - 1) * PageSize).Take(PageSize);
            return View(items);
        }

        // Chức năng xóa theo Ajax
        [AcceptVerbs(HttpVerbs.Post)] // Only allow POSTs (this action causes changes)
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
            // Encode certain characters, or the JavaScript expression could be invalid
            return new JavaScriptSerializer().Serialize(str);
        }
    }
}
