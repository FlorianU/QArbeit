using System;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Ludothek.Model;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Spielverleih.Models;
using Ludothek.Model.Enums;

namespace Spielverleih
{
    public partial class MitarbeiterView : Page
    {
        private LudothekDBEntities _context;

        public IEnumerable<Funktion> Funktionen => Enum.GetValues(typeof(Funktion)).Cast<Funktion>();
        public List<Ludothek.Model.Ludothek> Ludotheken => _context.Ludothek.ToList();

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                lstFunktionen.DataSource = Funktionen;
                lstFunktionen.DataBind();

                lstLudotheken.DataSource = Ludotheken;
                lstLudotheken.DataValueField = "ID";
                lstLudotheken.DataTextField = "Name";
                lstLudotheken.DataBind();
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };

            IdentityResult result = manager.Create(user, "gibbiX12345!");

            if (result.Succeeded)
            {
                var benutzer = new Benutzer()
                {
                    ID = new Guid(user.Id),
                    Vorname = Vorname.Text,
                    Nachname = Nachname.Text,
                    //Geburtsdatum = Geburtsdatum.Text,
                    Strasse = Strasse.Text,
                    PLZ = int.Parse(Plz.Text),
                    Ort = Ort.Text
                };
                var lastUser = _context.Mitarbeiter.OrderByDescending(x => x.Personalnummer).FirstOrDefault();
                int personalNummer = lastUser != null ? lastUser.Personalnummer.Value + 1 : 1;
                var mitarbeiter = new Mitarbeiter()
                {
                    ID = Guid.NewGuid(),
                    Personalnummer = personalNummer,
                    Funktion = (Funktion)Enum.Parse(typeof(Funktion), lstFunktionen.SelectedValue),
                    FK_Benutzer_ID = benutzer.ID,
                    FK_Ludothek_ID = new Guid(lstLudotheken.SelectedValue)
                };
                switch (mitarbeiter.Funktion)
                {
                    case Funktion.Mitarbeiter:
                        manager.AddToRole<ApplicationUser, string>(user.Id, "Mitarbeiter"); break;
                    case Funktion.Administrator:
                        manager.AddToRole<ApplicationUser, string>(user.Id, "Administrator"); break;
                }
                _context.Benutzer.Add(benutzer);
                _context.Mitarbeiter.Add(mitarbeiter);
                _context.SaveChanges();

                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}