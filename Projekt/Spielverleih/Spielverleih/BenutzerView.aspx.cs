using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Ludothek.Model;

namespace Spielverleih
{
    public partial class BenutzerView : Page
    {
        private LudothekDBEntities _context;

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
        }

        public IQueryable<Kunde> GetKunde([QueryString("Id")] Guid? kundeId)
        {
            Guid userIdentityId = new Guid(Context.User.Identity.GetUserId());
            return _context.Kunde.Where(kunde => kunde.ID == userIdentityId);
        }

        protected void Editieren_Click(object sender, EventArgs e)
        {
            Response.Redirect("BenutzerEditView.aspx");
        }
    }
}