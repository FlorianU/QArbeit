using Ludothek.Model;
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
    public partial class TarifKategorieView : System.Web.UI.Page
    {
        private LudothekDBEntities _context;

        public List<Tarifkategorie> Tarifkategorien => _context.Tarifkategorie.OrderBy(x => x.Tarifname).ToList();

         private void BindListView()
        {
            lstTarifkategorien.DataSource = Tarifkategorien;
            lstTarifkategorien.DataBind();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            { 
                BindListView();
            }
        }

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
            BindListView();
        }

        protected void Delete_Clicked(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Tarifkategorie tarifkategorie = _context.Tarifkategorie.FirstOrDefault(x => x.ID == id);
            var spieleList = _context.Spiel.Where(x => x.FK_Tarifkategorie_ID == tarifkategorie.ID).ToList();
            if (spieleList.Count == 0)
            {
                _context.Tarifkategorie.Remove(tarifkategorie);
                _context.SaveChanges();

                BindListView();
            }
        }

        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstTarifkategorien.EditIndex = e.NewEditIndex;
            BindListView();
        }

        protected void Update_Click(object sender, EventArgs e)
        {

            Guid id = new Guid(((Button)sender).CommandArgument);
            Tarifkategorie tarifkategorie = _context.Tarifkategorie.FirstOrDefault(x => x.ID == id);
            Panel panel = (Panel)((Button)sender).Parent;
            TextBox txtEditTarifname = (TextBox)panel.FindControl("txtEditTarifname");
            TextBox txtEditPrice = (TextBox)panel.FindControl("txtEditPrice");

            tarifkategorie.Tarifname = txtEditTarifname.Text;
            tarifkategorie.Price = double.Parse(txtEditPrice.Text);

            _context.Entry(tarifkategorie).State = EntityState.Modified;
            _context.SaveChanges();

            lstTarifkategorien.EditIndex = -1;
            BindListView();
        }

        protected void OnItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstTarifkategorien.EditIndex = -1;
            BindListView();
        }
    }
}