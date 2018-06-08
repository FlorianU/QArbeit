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
    public partial class VerbandView : System.Web.UI.Page
    {
        private LudothekDBEntities _context;

        public List<Verband> Verbaende => _context.Verband.OrderBy(x => x.Name).ToList();

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                BindListView();
            }
        }

        private void BindListView()
        {
            lstVerbaende.DataSource = Verbaende;
            lstVerbaende.DataBind();
        }

        protected void Hinzufügen_Click(object sender, EventArgs e)
        {
            Verband verband = new Verband()
            {
                ID = Guid.NewGuid(),
                Name = txtName.Text
            };

            _context.Verband.Add(verband);
            _context.SaveChanges();
            BindListView();
        }

        protected void Delete_Clicked(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Verband verband = _context.Verband.FirstOrDefault(x => x.ID == id);
            var ludothekList = _context.Ludothek.Where(x => x.FK_Verband_ID == verband.ID).ToList();
            if (ludothekList.Count == 0)
            {
                _context.Verband.Remove(verband);
                _context.SaveChanges();

                BindListView();
            }
        }


        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstVerbaende.EditIndex = e.NewEditIndex;
            BindListView();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            Guid id = new Guid(((Button)sender).CommandArgument);
            Verband verband = _context.Verband.FirstOrDefault(x => x.ID == id);
            Panel panel = (Panel)((Button)sender).Parent;
            TextBox txtNameEdit = (TextBox)panel.FindControl("txtEditName");

            verband.Name = txtNameEdit.Text;
            _context.Entry(verband).State = EntityState.Modified;
            _context.SaveChanges();

            lstVerbaende.EditIndex = -1;
            BindListView();
        }

        protected void OnItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstVerbaende.EditIndex = -1;
            BindListView();
        }
    }
}