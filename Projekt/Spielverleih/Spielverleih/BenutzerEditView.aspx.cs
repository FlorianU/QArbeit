using Spielverleih.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using System.Data.Entity;

namespace Spielverleih
{
    public partial class BenutzerEditView : Page
    {
        private AusleihContext _context;
        public Kunde Benutzer
        {
            get
            {
               return _context.Kunden.ToList().Where(x => x.Id == new Guid(Context.User.Identity.GetUserId())).FirstOrDefault();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new AusleihContext();
            if (!IsPostBack)
            {
                var benutzer = Benutzer;
                txtVorname.Text = benutzer.Vorname;
                txtName.Text = benutzer.Name;
                txtPlz.Text = benutzer.Plz.ToString();
                txtOrt.Text = benutzer.Ort;
                txtStrasse.Text = benutzer.Strasse;
                txtStrassennummer.Text = benutzer.Strassennummer;
            }
        }


        public IQueryable<Kunde> GetKunde([QueryString("Id")] Guid? kundeId)
        {
            IQueryable<Kunde> query = _context.Kunden;
            var id = Context.User.Identity.GetUserId();
            query = query.Where(p => p.Id.ToString() == id);
            return query;
        }

        protected void Speichern_Click(object sender, EventArgs e)
        {
            var benutzer = Benutzer;
            benutzer.Vorname = txtVorname.Text;
            benutzer.Name = txtName.Text;
            benutzer.Plz = int.Parse(txtPlz.Text);
            benutzer.Ort = txtOrt.Text;
            benutzer.Strasse = txtStrasse.Text;
            benutzer.Strassennummer = txtStrassennummer.Text;
            _context.Entry(benutzer).State = EntityState.Modified;
            _context.SaveChanges();
            Response.Redirect("BenutzerView.aspx");
        }
    }
}