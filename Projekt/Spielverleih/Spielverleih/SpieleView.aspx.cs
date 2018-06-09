using Ludothek.Model;
using Ludothek.Model.Enums;
using Spielverleih.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        public List<Spiel> Spiele => _context.Spiel.OrderBy(x => x.Spielnummer).ToList();
        public List<Verlag> Verlaege => _context.Verlag.OrderBy(x => x.Name).ToList();
        public List<Tarifkategorie> TarifKategorien => _context.Tarifkategorie.OrderBy(x => x.Tarifname).ToList();
        public IEnumerable<SpielKategorie> SpielKategorien => Enum.GetValues(typeof(SpielKategorie)).Cast<SpielKategorie>();

        private void BindListView()
        {
            lstSpiele.DataSource = Spiele;
            lstSpiele.DataBind();
        }

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
                BindListView();
            }
        }

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
                FK_Verlag_ID = new Guid(lstVerlaege.SelectedValue),
                Kategorie = (SpielKategorie)Enum.Parse(typeof(SpielKategorie), lstSpielKategorien.SelectedValue),
                FK_Tarifkategorie_ID = new Guid(lstTarifKategorien.SelectedValue)
            };

            _context.Spiel.Add(spiel);
            _context.SaveChanges();

            BindListView();
        }

        protected void Delete_Clicked(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Spiel spiel = _context.Spiel.FirstOrDefault(x => x.ID == id);
            _context.Spiel.Remove(spiel);
            _context.SaveChanges();
            BindListView();
        }


        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstSpiele.EditIndex = e.NewEditIndex;
            BindListView();
        }

        protected void Update_Click(object sender, EventArgs e)
        {

            Guid id = new Guid(((Button)sender).CommandArgument);
            Spiel spiel = _context.Spiel.FirstOrDefault(x => x.ID == id);
            Panel panel = (Panel)((Button)sender).Parent;
            TextBox txtNameEdit = (TextBox)panel.FindControl("txtEditName");
            TextBox txtEditBeschreibung = (TextBox)panel.FindControl("txtEditBeschreibung");
            TextBox txtEditFSK = (TextBox)panel.FindControl("txtEditFSK");
            TextBox txtEditKategorie = (TextBox)panel.FindControl("txtEditKategorie");
            TextBox txtEditVerlag = (TextBox)panel.FindControl("txtEditVerlag"); 
            TextBox txtEditTarifkategorie = (TextBox)panel.FindControl("txtEditTarifkategorie");

            spiel.Name = txtNameEdit.Text;
            spiel.Beschreibung = txtEditBeschreibung.Text;
            spiel.FSK = int.Parse(txtEditFSK.Text);
            //spiel.Kategorie = txtEditKategorie.Text;
            //spiel.FK_Verlag_ID = txtEditVerlag.Text;
            //spiel.FK_Tarifkategorie_ID = txtEditTarifkategorie.Text;

            _context.Entry(spiel).State = EntityState.Modified;
            _context.SaveChanges();

            lstSpiele.EditIndex = -1;
            BindListView();
        }

        protected void OnItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstSpiele.EditIndex = -1;
            BindListView();
        }
    }
}