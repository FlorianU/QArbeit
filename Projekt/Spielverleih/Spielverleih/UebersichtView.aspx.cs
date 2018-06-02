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
    public partial class UebersichView : Page
    {
        private LudothekDBEntities _context;
        private string _filter;
        
        public List<Ausleihe> Ausleihen
        {
            get
            {
                if (string.IsNullOrEmpty(_filter))
                {
                    return _context.Ausleihe.OrderByDescending(x => x.Ausleihdatum).ToList();
                }
                else
                {
                    return _context.Ausleihe.Where(x =>  
                    x.Nummer.ToString().Contains(_filter)
                    || x.SpielBezeichnung.Contains(_filter)
                    || x.Verlag.Contains(_filter)
                    || x.Ausleihdatum.ToString().Contains(_filter)
                    || x.Rueckgabedatum.ToString().Contains(_filter)
                    || x.AnzVerlängerungen.ToString().Contains(_filter)
                    || x.Kunde.Vorname.Contains(_filter)
                    || x.Kunde.Nachname.Contains(_filter)
                    || x.Kunde.Strasse.Contains(_filter)
                    || x.Kunde.PLZ.ToString().Contains(_filter)
                    || x.Kunde.Ort.Contains(_filter)
                    ).OrderByDescending(x => x.Ausleihdatum).ToList();
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                lstAusleihe.DataSource = Ausleihen;
                lstAusleihe.DataBind();
            }
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            _filter = txtFilter.Text;
            lstAusleihe.DataSource = Ausleihen;
            lstAusleihe.DataBind();
        }
    }
}