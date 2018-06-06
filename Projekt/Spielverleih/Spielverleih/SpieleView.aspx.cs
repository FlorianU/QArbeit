using Ludothek.Model;
using Ludothek.Model.Enums;
using Spielverleih.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spielverleih
{
    public partial class SpieleView : Page
    {
        private LudothekDBEntities _context;


        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                if (User.IsInRole("Mitarbeiter") ||User.IsInRole("Administrator"))
                {
                    var lstSpielKategorien = (DropDownList)loginView.FindControl("lstSpielKategorien");
                    var lstTarifKategorien = (DropDownList)loginView.FindControl("lstTarifKategorien");
                    var lstVerlaege = (DropDownList)loginView.FindControl("lstVerlaege");

                    lstSpielKategorien.DataSource = SpielKategorien;
                    lstSpielKategorien.DataBind();

                    lstTarifKategorien.DataSource = TarifKategorien;
                    lstTarifKategorien.DataValueField = "Id";
                    lstTarifKategorien.DataTextField = "Tarifname";
                    lstTarifKategorien.DataBind();

                    lstVerlaege.DataSource = Verlaege;
                    lstVerlaege.DataValueField = "Id";
                    lstVerlaege.DataTextField = "Name";
                    lstVerlaege.DataBind();
                }

                lstSpiele.DataSource = Spiele;
                lstSpiele.DataBind();
            }
            
        }

        public List<Spiel> Spiele => _context.Spiel.OrderBy(x => x.Spielnummer).ToList();
        public List<Verlag> Verlaege => _context.Verlag.OrderBy(x => x.Name).ToList();
        public List<Tarifkategorie> TarifKategorien => _context.Tarifkategorie.OrderBy(x => x.Tarifname).ToList();
        public IEnumerable<SpielKategorie> SpielKategorien => Enum.GetValues(typeof(SpielKategorie)).Cast<SpielKategorie>();

        protected void Hinzufügen_Click(object sender, EventArgs e)
        {
            var txtName = (TextBox)loginView.FindControl("txtName");
            var txtBeschreibung = (TextBox)loginView.FindControl("txtBeschreibung");
            var txtFSK = (TextBox)loginView.FindControl("txtFSK");
            var lstSpielKategorien = (DropDownList)loginView.FindControl("lstSpielKategorien");
            var lstTarifKategorien = (DropDownList)loginView.FindControl("lstTarifKategorien");
            var lstVerlaege = (DropDownList)loginView.FindControl("lstVerlaege");
            Spiel spiel = new Spiel()
            {
                ID = Guid.NewGuid(),
                Name = txtName.Text,
                Beschreibung = txtBeschreibung.Text,
                FSK = int.Parse(txtFSK.Text),
                FkVerlag = new Guid(lstVerlaege.SelectedValue),
                Kategorie = SpielKategorie.Kindergarten,
                FkTarifkategorie = new Guid(lstTarifKategorien.SelectedValue)
            };

            _context.Spiel.Add(spiel);
            _context.SaveChanges();
            lstSpiele.DataSource = Spiele;
            lstSpiele.DataBind();
        }
    }
}