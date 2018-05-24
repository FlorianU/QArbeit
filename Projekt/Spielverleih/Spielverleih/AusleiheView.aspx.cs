using Microsoft.AspNet.Identity;
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
    public partial class AusleiheView : Page
    {
        private AusleihContext _context;

        public Kunde Benutzer
        {
            get
            {
                return _context.Kunden.ToList().Where(x => x.Id == new Guid(Context.User.Identity.GetUserId())).FirstOrDefault();
            }
        }

        //public List<Spiel> Spiele
        //{
        //    get
        //    {
        //        List<Ausleihe> ausleihen = _context.Ausleihen.ToList();
        //        var list = ausleihen.Where(x => x.Enddatum >= DateTime.Now);
        //        var spiele = _context.Spiele.ToList();
        //        list.Select(x => x.Spiel).ToList().ForEach(x => spiele.Remove(x));
        //        return spiele;
        //    }
        //}

        public List<Ausleihe> Ausleihen
        {
            get
            {
                return _context.Ausleihen.Where(x => x.KundeId == Benutzer.Id).ToList();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new AusleihContext();
            if (!Page.IsPostBack)
            {
                //lstVerfuegbareSpiele.DataSource = Spiele;
                lstVerfuegbareSpiele.DataValueField = "Id";
                lstVerfuegbareSpiele.DataTextField = "Bezeichnung";
                lstVerfuegbareSpiele.DataBind();
                lstAusleihe.DataSource = Ausleihen;
                lstAusleihe.DataBind();
            }
        }

        protected void Ausleihen_Click(object sender, EventArgs e)
        {
            //DateTime now = DateTime.Now;
            ////Spiel spiel = _context.Spiele.Where(x => x.Id == new Guid(lstVerfuegbareSpiele.SelectedValue)).FirstOrDefault();
            //Ausleihe ausleihe = new Ausleihe()
            //{
            //    Id = Guid.NewGuid(),
            //    Kunde = Benutzer,
            //    Ausleihdatum = now,
            //    Enddatum = now.AddDays(7),
            //    Spiel = spiel
            //};
            //_context.Ausleihen.Add(ausleihe);
            //_context.SaveChanges();
            //lstVerfuegbareSpiele.DataSource = Spiele;
            //lstVerfuegbareSpiele.DataBind();
            //lstAusleihe.DataSource = Ausleihen;
            //lstAusleihe.DataBind();
        }

        protected void Verlaengern_Click(object sender, EventArgs e)
        {
            var id = new Guid(((Button)sender).CommandArgument);
            var ausleihe = _context.Ausleihen.Where(x => x.Id == id).FirstOrDefault();
            ausleihe.Enddatum = ausleihe.Enddatum.AddDays(7);
             _context.Entry(ausleihe).State = EntityState.Modified;
            _context.SaveChanges();
            lstAusleihe.DataSource = Ausleihen;
            lstAusleihe.DataBind();
        }
    }
}