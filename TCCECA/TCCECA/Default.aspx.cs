using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TCCECA
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

         protected string salutation()
        {
             String salutationtxt = "";
             System.DateTime t1 = Convert.ToDateTime(System.DateTime.Now);
             System.DateTime t2 = Convert.ToDateTime("5:00 PM");

             if (t1.TimeOfDay.Ticks > t2.TimeOfDay.Ticks)
                {
                    salutationtxt = "Bonsoir";
                }
                else
                {
                    salutationtxt = "Bonjour";
                }
            return salutationtxt;
        }




    }
}