using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TCCECA
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Récupération du fichier res.txt
           // System.IO.StreamReader reservation = new System.IO.StreamReader(Server.MapPath("App_Data/res.txt"));

            System.IO.StreamReader reservation = new System.IO.StreamReader(Server.MapPath("App_Data/res.txt"));

            List<string> listDays = new List<string>();
            List<string> listHours = new List<string>();
            List<string> listPersons = new List<string>();
            
            //Rempli les différentes listes
            while (!reservation.EndOfStream)
            {
                var line = reservation.ReadLine();
                var values = line.Split(';');

                listDays.Add(values[0]);
                listHours.Add(values[1]);
                listPersons.Add(values[2]);
            }

            //Parcours les lignes du fichier txt.
            int x=0;
            int y=0;
            for (int i = 0; i < listDays.Count; i++)
            {
                switch (listDays[i])
                {
                    case "Lundi":
                        x = 1;
                        break;
                    case "Mardi":
                        x = 2;
                        break;
                    case "Mercredi":
                        x = 3;
                        break;
                    case "Jeudi":
                        x = 4;
                        break;
                    case "Vendredi":
                        x = 5;
                        break;
                    case "Samedi":
                        x = 6;
                        break;
                    case "Dimanche":
                        x = 7;
                        break;
                }
                switch (listHours[i])
                {
                    case "8":
                        y = 1;
                        break;
                    case "9":
                        y = 2;
                        break;
                    case "10":
                        y = 3;
                        break;
                    case "11":
                        y = 4;
                        break;
                    case "12":
                        y = 5;
                        break;
                    case "13":
                        y = 6;
                        break;
                    case "14":
                        y = 7;
                        break;
                    case "15":
                        y = 8;
                        break;
                    case "16":
                        y = 9;
                        break;
                    case "17":
                        y = 10;
                        break;
                    case "18":
                        y = 11;
                        break;
                    case "19":
                        y = 12;
                        break;
                    case "20":
                        y = 13;
                        break;
                    case "21":
                        y = 14;
                        break;
                    case "22":
                        y = 15;
                        break;
                }
                //rajoute le nom du joueur dans la bonne cellule
                tblCourt.Rows[y].Cells[x].Text = listPersons[i];
            }
        }

        protected void bttAjouter_Click(object sender, EventArgs e)
        {

        }

        protected void bttSupprimer_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}