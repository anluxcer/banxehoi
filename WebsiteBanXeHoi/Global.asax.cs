﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using DomainModel.Entities;

namespace WebsiteBanXeHoi
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(null,
                             "", 
                             new
                             {
                                 controller = "Products",
                                 action = "List",
                                 category = (string)null,
                                 page = 1
                             }
                             );

            routes.MapRoute(null,
                            "Page{page}", 
                            new { controller = "Products", action = "List", category = (string)null },
                            new { page = @"\d+" } 
                            );

            routes.MapRoute(null,
                            "{category}", 
                            new { controller = "Products", action = "List", page = 1 }
                            );
                            routes.MapRoute(null,
                            "{category}/Page{page}", 
                            new { controller = "Products", action = "List" }, 
                            new { page = @"\d+" } 
                            );

            routes.MapRoute(null, "{controller}/{action}");

        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
            ControllerBuilder.Current.SetControllerFactory(new WindsorControllerFactory());

            ModelBinders.Binders.Add(typeof(Cart), new CartModelBinder());
        }
    }
}