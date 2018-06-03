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
    public partial class TarifKategorieView : System.Web.UI.Page
    {
        private LudothekDBEntities _context;

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                lstTarifkategorien.DataSource = Tarifkategorien;
                lstTarifkategorien.DataBind();
            }
        }

        public List<Tarifkategorie> Tarifkategorien => _context.Tarifkategorie.OrderBy(x => x.Tarifname).ToList();

        protected void Hinzufügen_Click(object sender, EventArgs e)
        {
            Tarifkategorie tarifkategorie = new Tarifkategorie()
            {
                ID = Guid.NewGuid(),
                Tarifname = txtName.Text,
                Price = double.Parse(txtPrice.Text)
            };

            _context.Tarifkategorie.Add(tarifkategorie);
            _context.SaveChanges();
            lstTarifkategorien.DataSource = Tarifkategorien;
            lstTarifkategorien.DataBind();
        }
    }
}