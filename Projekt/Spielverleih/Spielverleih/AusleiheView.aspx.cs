using Ludothek.Model;
using Microsoft.AspNet.Identity;
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
    public partial class AusleiheView : Page
    {
        private LudothekDBEntities _context;

        public Guid _benutzerID;

        public List<Spiel> Spiele
        {
            get
            {
                var aktiveAusleihen = _context.Ausleihe.Where(y => !y.Zurueckgegeben);
                return _context.Spiel.Where(x => aktiveAusleihen.All(y => y.SpielNummer != x.Spielnummer)).ToList();
            }
        }

        public List<Ausleihe> Ausleihen =>  _context.Ausleihe.Where(x => x.FK_Kunde_ID == _benutzerID).OrderByDescending(x => x.Nummer).ToList();

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            _benutzerID = new Guid(Context.User.Identity.GetUserId());
            if (!Page.IsPostBack)
            {
                lstVerfuegbareSpiele.DataSource = Spiele;
                lstVerfuegbareSpiele.DataValueField = "Id";
                lstVerfuegbareSpiele.DataTextField = "Name";
                lstVerfuegbareSpiele.DataBind();
                lstAusleihe.DataSource = Ausleihen;
                lstAusleihe.DataBind();
            }
        }

        protected void Ausleihen_Click(object sender, EventArgs e)
        {
            var aktiveAusleihen = _context.Ausleihe.Where(x => !x.Zurueckgegeben).ToList();
            if (aktiveAusleihen.Count != 3)
            {
                DateTime now = DateTime.Now;
                Spiel spiel = _context.Spiel.Where(x => x.ID == new Guid(lstVerfuegbareSpiele.SelectedValue)).FirstOrDefault();
                Ausleihe letzteAusleihe = _context.Ausleihe.OrderByDescending(x => x.Nummer).FirstOrDefault();
                int nummer = 1;
                if (letzteAusleihe != null)
                {
                    nummer = letzteAusleihe.Nummer + 1;
                }

                Ausleihe ausleihe = new Ausleihe()
                {
                    ID = Guid.NewGuid(),
                    Nummer = nummer,
                    SpielNummer = spiel.Spielnummer,
                    SpielBezeichnung = spiel.Name,
                    Verlag = spiel.Verlag.Name,
                    FK_Kunde_ID = _benutzerID,
                    Ausleihdatum = now,
                    AnzVerlängerungen = 0,
                    Rueckgabedatum = DateTime.Now.AddDays(7),
                    Zurueckgegeben = false
                };
                _context.Ausleihe.Add(ausleihe);
                _context.SaveChanges();
                lstVerfuegbareSpiele.DataSource = Spiele;
                lstVerfuegbareSpiele.DataBind();
                lstAusleihe.DataSource = Ausleihen;
                lstAusleihe.DataBind();
            }
        }

        protected void Verlaengern_Click(object sender, EventArgs e)
        {
            var id = new Guid(((Button)sender).CommandArgument);
            var ausleihe = _context.Ausleihe.Where(x => x.ID == id).FirstOrDefault();
            if (ausleihe.AnzVerlängerungen < 3)
            {
                ausleihe.Rueckgabedatum = ausleihe.Rueckgabedatum.AddDays(7);
                ausleihe.AnzVerlängerungen++;
                _context.Entry(ausleihe).State = EntityState.Modified;
                _context.SaveChanges();
                lstAusleihe.DataSource = Ausleihen;
                lstAusleihe.DataBind();
            }
        }

        protected void Zurueckgeben_Click(object sender, EventArgs e)
        {
            var id = new Guid(((Button)sender).CommandArgument);
            var ausleihe = _context.Ausleihe.Where(x => x.ID == id).FirstOrDefault();
            ausleihe.Zurueckgegeben = true;
            _context.Entry(ausleihe).State = EntityState.Modified;
            _context.SaveChanges();
            lstVerfuegbareSpiele.DataSource = Spiele;
            lstVerfuegbareSpiele.DataBind();
            lstAusleihe.DataSource = Ausleihen;
            lstAusleihe.DataBind();
        }
    }
}