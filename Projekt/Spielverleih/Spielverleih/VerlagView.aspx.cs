using Ludothek.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
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

        public List<Verlag> Verlage => _context.Verlag.OrderBy(x => x.Name).ToList();

        private void BindListView()
        {
            lstVerlaege.DataSource = Verlage;
            lstVerlaege.DataBind();
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

            Verlag verlag = new Verlag()
            {
                ID = Guid.NewGuid(),
                Name = txtName.Text,
                Strasse = txtStrasse.Text,
                PLZ = int.Parse(txtPlz.Text),
                Ort = txtOrt.Text
            };

            _context.Verlag.Add(verlag);
            _context.SaveChanges();
            BindListView();
        }

        protected void Delete_Clicked(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Verlag verlag = _context.Verlag.FirstOrDefault(x => x.ID == id);
            var spieleList = _context.Spiel.Where(x => x.FK_Verlag_ID == verlag.ID).ToList();
            if (spieleList.Count == 0)
            {
                _context.Verlag.Remove(verlag);
                _context.SaveChanges();

                BindListView();
            }
        }


        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstVerlaege.EditIndex = e.NewEditIndex;
            BindListView();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            
            Guid id = new Guid(((Button)sender).CommandArgument);
            Verlag verlag = _context.Verlag.FirstOrDefault(x => x.ID == id);
            Panel panel = (Panel)((Button)sender).Parent;
            TextBox txtNameEdit = (TextBox)panel.FindControl("txtEditName");
            TextBox txtEditStrasse = (TextBox)panel.FindControl("txtEditStrasse");
            TextBox txtEditPLZ = (TextBox)panel.FindControl("txtEditPLZ");
            TextBox txtEditOrt = (TextBox)panel.FindControl("txtEditOrt");

            verlag.Name = txtNameEdit.Text;
            verlag.Strasse = txtEditStrasse.Text;
            verlag.PLZ = int.Parse(txtEditPLZ.Text);
            verlag.Ort = txtEditOrt.Text;

            _context.Entry(verlag).State = EntityState.Modified;
            _context.SaveChanges();

            lstVerlaege.EditIndex = -1;
            BindListView();
        }

        protected void OnItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstVerlaege.EditIndex = -1;
            BindListView();
        }
    }
}