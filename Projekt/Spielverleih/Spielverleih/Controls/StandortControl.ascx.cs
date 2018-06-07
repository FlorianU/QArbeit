using Ludothek.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spielverleih
{
    public partial class StandortControl : System.Web.UI.UserControl
    {
        private LudothekDBEntities _context;

        [Category("Text")]
        [Description("The message to display")]
        public string LudothekID { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
        }
        
        public List<Standort> Standorte => _context.Standort.Where(x => x.FK_Ludothek_ID == new Guid(LudothekID)).OrderBy(x => x.Name).ToList();

        protected void StandortHinzufügen_Click(object sender, EventArgs e)
        {
            LudothekID = ((Button)sender).CommandArgument;
            Standort standort = new Standort()
            {
                ID = Guid.NewGuid(),
                Name = txtOrt.Text,
                PLZ = int.Parse(txtPLZ.Text),
                FK_Ludothek_ID = new Guid(LudothekID)
            };

            _context.Standort.Add(standort);
            _context.SaveChanges();
            lstStandorte.DataSource = Standorte;
            lstStandorte.DataBind();
        }

        public void RefreshList()
        {
            lstStandorte.DataSource = Standorte;
            lstStandorte.DataBind();
        }
    }
}