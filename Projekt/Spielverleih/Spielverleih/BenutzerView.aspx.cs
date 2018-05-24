using Spielverleih.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;

namespace Spielverleih
{
    public partial class BenutzerView : Page
    {
        private AusleihContext _context;

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new AusleihContext();
        }

        public IQueryable<Kunde> GetKunde([QueryString("Id")] Guid? kundeId)
        {
            var id = Context.User.Identity.GetUserId();
            return (IQueryable<Kunde>)_context.Kunden.Where(p => p.Id.ToString() == id);
        }

        protected void Editieren_Click(object sender, EventArgs e)
        {
            Response.Redirect("BenutzerEditView.aspx");
        }
    }
}