﻿using System;
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
        public Benutzer Benutzer
        {
            get
            {
               return _context.Benutzer.ToList().Where(x => x.ID == new Guid(Context.User.Identity.GetUserId())).FirstOrDefault();
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
                txtPlz.Text = benutzer.PLZ.ToString();
                txtOrt.Text = benutzer.Ort;
                txtStrasse.Text = benutzer.Strasse;
            }
        }


        public IQueryable<Benutzer> GetBenutzer([QueryString("Id")] Guid? benutzerID)
        {
            IQueryable<Benutzer> query = _context.Benutzer;
            var id = Context.User.Identity.GetUserId();
            query = query.Where(p => p.ID.ToString() == id);
            return query;
        }

        protected void Speichern_Click(object sender, EventArgs e)
        {
            int plz;
            if (int.TryParse(txtPlz.Text, out plz))
            {
                var benutzer = Benutzer;
                benutzer.Vorname = txtVorname.Text;
                benutzer.Nachname = txtName.Text;
                benutzer.PLZ = plz;
                benutzer.Ort = txtOrt.Text;
                benutzer.Strasse = txtStrasse.Text;
                _context.Entry(benutzer).State = EntityState.Modified;
                _context.SaveChanges();
                Response.Redirect("BenutzerView.aspx");
            }
        }
    }
}