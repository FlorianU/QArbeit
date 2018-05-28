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

        public Kunde Benutzer
        {
            get
            {
                return _context.Kunde.ToList().Where(x => x.ID == new Guid(Context.User.Identity.GetUserId())).FirstOrDefault();
            }
        }

        public List<Spiel> Spiele
        {
            get
            {
                return _context.Spiel.ToList();
            }
        }

        public List<Ausleihe> Ausleihen
        {
            get
            {
                return _context.Ausleihe.Where(x => x.FkKunde == Benutzer.ID).ToList();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
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
                Kunde = Benutzer,
                Ausleihdatum = now,
                AnzVerlängerungen = 0,
            };
            _context.Ausleihe.Add(ausleihe);
            _context.SaveChanges();
            lstVerfuegbareSpiele.DataSource = Spiele;
            lstVerfuegbareSpiele.DataBind();
            lstAusleihe.DataSource = Ausleihen;
            lstAusleihe.DataBind();
        }

        protected void Verlaengern_Click(object sender, EventArgs e)
        {
            //var id = new Guid(((Button)sender).CommandArgument);
            //var ausleihe = _context.Ausleihen.Where(x => x.Id == id).FirstOrDefault();
            //ausleihe.Enddatum = ausleihe.Enddatum.AddDays(7);
            // _context.Entry(ausleihe).State = EntityState.Modified;
            //_context.SaveChanges();
            //lstAusleihe.DataSource = Ausleihen;
            //lstAusleihe.DataBind();
        }
    }
}