using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Xml.Linq;
using DomainModel.Abstract;

namespace WebsiteBanXeHoi.Controllers
{
    public class RSSController : Controller
    {
       private IProductsRepository productsRepository;

        public RSSController(IProductsRepository productsRepository)
        {
            this.productsRepository = productsRepository;
        }

        public ContentResult RSSFeed()
        {
            string encoding = Response.ContentEncoding.WebName;

            XDocument rss = new XDocument(new XDeclaration("1.0", encoding, "yes"),
                                          new XElement("rss", new XAttribute("version", "2.0"),
                                                        new XElement("channel", new XElement("title", "Trang RSS: sản phẩm mới cập nhật"),
                                                                       from rssitem in productsRepository.GetRSS()
                                                                       select new XElement("item",
                                                                                            new XElement("title", rssitem.name),
                                                                                            new XElement("description", rssitem.description),
                                                                                            new XElement("link", "http://www.willgo.info")
                                                                                            )
                                                                    )
                                                        )
                                            );

            return Content(rss.ToString(), "application/rss+xml");
        }
    }
}
