using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace WebsiteBanXeHoi.Controllers
{
    public class DownloadController : Controller
    {
        public FilePathResult DownloadBangGia()
        {
            string filename = @"~/DownloadBangGia/baogia.pdf";
            return File(filename, "application/pdf", "Bangbaogiaxehoi.pdf");

        }

    }
}