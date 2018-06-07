using Ludothek.Model;
using System;
using System.Collections.Generic;
using System.Data;
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
                PLZ = int.Parse(txtPlz.Text),
                Ort = txtOrt.Text
            };

            _context.Verlag.Add(verlag);
            _context.SaveChanges();
            lstVerlaege.DataSource = Verlage;
            lstVerlaege.DataBind();
        }

        protected void OnItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (lstVerlaege.EditIndex == (e.Item as ListViewDataItem).DataItemIndex)
            {
                DataTable dt = new DataTable();
            }
        }


        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstVerlaege.EditIndex = e.NewEditIndex;
            lstVerlaege.DataSource = Verlage;
            lstVerlaege.DataBind();
        }


        protected void OnItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstVerlaege.EditIndex = -1;
            lstVerlaege.DataSource = Verlage;
            lstVerlaege.DataBind();
        }
    }
}