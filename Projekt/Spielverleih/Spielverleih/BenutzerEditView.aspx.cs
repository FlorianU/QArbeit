using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using Ludothek.Model;

namespace Spielverleih
{
    public partial class BenutzerEditView : Page
    {
        private LudothekDBEntities _context;
        public Kunde Benutzer
        {
            get
            {
               return _context.Kunde.ToList().Where(x => x.ID == new Guid(Context.User.Identity.GetUserId())).FirstOrDefault();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!IsPostBack)
            {
                var benutzer = Benutzer;
                txtVorname.Text = benutzer.Vorname;
                txtName.Text = benutzer.Nachname;
                //txtPlz.Text = benutzer.Geburtsdatum;
                txtPlz.Text = benutzer.PLZ.ToString();
                txtOrt.Text = benutzer.Ort;
                txtStrasse.Text = benutzer.Strasse;
            }
        }


        public IQueryable<Kunde> GetKunde([QueryString("Id")] Guid? kundeId)
        {
            IQueryable<Kunde> query = _context.Kunde;
            var id = Context.User.Identity.GetUserId();
            query = query.Where(p => p.ID.ToString() == id);
            return query;
        }

        protected void Speichern_Click(object sender, EventArgs e)
        {
            var benutzer = Benutzer;
            benutzer.Vorname = txtVorname.Text;
            benutzer.Nachname = txtName.Text;
            //benutzer.Geburtsdatum = txtGeburtsdatum.Text;
            benutzer.PLZ = int.Parse(txtPlz.Text);
            benutzer.Ort = txtOrt.Text;
            benutzer.Strasse = txtStrasse.Text;
            _context.Entry(benutzer).State = EntityState.Modified;
            _context.SaveChanges();
            Response.Redirect("BenutzerView.aspx");
        }
    }
}