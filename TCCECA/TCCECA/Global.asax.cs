using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using TCCECA;

namespace TCCECA
{
    public class Global : HttpApplication
    {
        public const String numversion = "2.0";
        public static String salutation = "";
        public  System.DateTime t1 = Convert.ToDateTime(System.DateTime.Now);
        public  System.DateTime t2 = Convert.ToDateTime("5:00 PM");

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            if (t1.TimeOfDay.Ticks > t2.TimeOfDay.Ticks)
            {
                salutation = "Bonsoir";
            }
            else
            {
                salutation = "Bonjour";
            }

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
      

    }
}
