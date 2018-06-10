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
    public partial class LudothekView : System.Web.UI.Page
    {
        private LudothekDBEntities _context;

        public List<Ludothek.Model.Ludothek> Ludotheken => _context.Ludothek.OrderBy(x => x.Name).ToList();

        public List<Verband> Verbaende => _context.Verband.OrderBy(x => x.Name).ToList();

        private void BindListView()
        {
            lstLudotheken.DataSource = Ludotheken;
            lstLudotheken.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {

                lstVerbaende.DataSource = Verbaende;
                lstVerbaende.DataValueField = "Id";
                lstVerbaende.DataTextField = "Name";
                lstVerbaende.DataBind();

                BindListView();
            }
        }

        protected void Hinzufügen_Click(object sender, EventArgs e)
        {
            Ludothek.Model.Ludothek ludothek = new Ludothek.Model.Ludothek()
            {
                ID = Guid.NewGuid(),
                Name = txtName.Text,
                FK_Verband_ID = new Guid(lstVerbaende.SelectedValue)
            };

            _context.Ludothek.Add(ludothek);
            _context.SaveChanges();
            BindListView();
        }

        protected void Delete_Clicked(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Ludothek.Model.Ludothek ludothek = _context.Ludothek.FirstOrDefault(x => x.ID == id);
            var standorte = _context.Standort.Where(x => x.FK_Ludothek_ID == ludothek.ID);
            _context.Standort.RemoveRange(standorte);
            _context.Ludothek.Remove(ludothek);
            var mitarbeiterList = _context.Mitarbeiter.Where(x => x.FK_Ludothek_ID == ludothek.ID);
            foreach (Mitarbeiter mitarbeiter in mitarbeiterList)
            {
                mitarbeiter.FK_Ludothek_ID = null;
                _context.Entry(mitarbeiter).State = EntityState.Modified;
            }
            _context.SaveChanges();

            BindListView();
        }

        protected void Expand_Click(object sender, EventArgs e)
        {
            Button button = ((Button)sender);
            var panel = button.Parent.FindControl("expandID");
            panel.Visible = !panel.Visible;
        }

        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstLudotheken.EditIndex = e.NewEditIndex;
            BindListView();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Ludothek.Model.Ludothek ludothek = _context.Ludothek.FirstOrDefault(x => x.ID == id);
            Panel panel = (Panel)((Button)sender).Parent;
            TextBox txtNameEdit = (TextBox)panel.FindControl("txtEditName");
            DropDownList lstEditVerbaende = (DropDownList)panel.FindControl("lstEditVerbaende");

            ludothek.Name = txtNameEdit.Text;
            ludothek.FK_Verband_ID = new Guid(lstEditVerbaende.SelectedValue);

            _context.Entry(ludothek).State = EntityState.Modified;
            _context.SaveChanges();

            lstLudotheken.EditIndex = -1;
            BindListView();
        }

        protected void OnItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstLudotheken.EditIndex = -1;
            BindListView();
        }

        protected void OnItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (lstLudotheken.EditIndex == (e.Item as ListViewDataItem).DataItemIndex)
            {
                DropDownList ddlCountries = (e.Item.FindControl("lstEditVerbaende") as DropDownList);
                ddlCountries.DataSource = Verbaende;
                ddlCountries.DataTextField = "Name";
                ddlCountries.DataValueField = "Id";
                ddlCountries.DataBind();
                ddlCountries.SelectedValue = ((Ludothek.Model.Ludothek)e.Item.DataItem).FK_Verband_ID.ToString();
            }
        }
    }
}