using Ludothek.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spielverleih
{
    public partial class VerlagView : System.Web.UI.Page
    {
        private LudothekDBEntities _context;

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                lstVerlaege.DataSource = Verlage;
                lstVerlaege.DataBind();
            }
        }

        public List<Verlag> Verlage => _context.Verlag.OrderBy(x => x.Name).ToList();

        protected void Hinzufügen_Click(object sender, EventArgs e)
        {
            Verlag verlag = new Verlag()
            {
                ID = Guid.NewGuid(),
                Name = txtName.Text,
                Strasse = txtStrasse.Text,
                PLZ = int.Parse(txtPLZ.Text),
                Ort = txtOrt.Text,
            };

            _context.Verlag.Add(verlag);
            _context.SaveChanges();
            lstVerlaege.DataSource = Verlage;
            lstVerlaege.DataBind();
        }
    }
}