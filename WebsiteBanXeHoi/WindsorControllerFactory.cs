using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Castle.Windsor;
using System.Web.Mvc;
using Castle.Windsor.Configuration.Interpreters;
using System.Reflection;
using Castle.Core.Resource;
using Castle.Core;



namespace WebsiteBanXeHoi
{
    public class WindsorControllerFactory : DefaultControllerFactory
    {
      
        WindsorContainer container;
        public WindsorControllerFactory()
        {           
            container = new WindsorContainer(new XmlInterpreter(new ConfigResource("castle")));           
            var controllerTypes = from t in Assembly.GetExecutingAssembly().GetTypes()
                                  where typeof(IController).IsAssignableFrom(t)
                                  select t;
            foreach (Type t in controllerTypes)
                container.AddComponentWithLifestyle(t.FullName, t,
                LifestyleType.Transient);
        }
        protected override IController  GetControllerInstance(System.Web.Routing.RequestContext requestContext, Type controllerType)
        {
            return (IController)container.Resolve(controllerType);
        }
    }
}
