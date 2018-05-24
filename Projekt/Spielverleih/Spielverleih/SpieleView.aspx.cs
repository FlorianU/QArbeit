using Ludothek.Model;
using Spielverleih.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spielverleih
{
    public partial class SpieleView : Page
    {
        private LudothekDBEntities _context;
        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
        }

        

        public IQueryable<Spiel> GetSpiele([QueryString("ID")] Guid? categoryId)
        {
            return (IQueryable<Spiel>)_context.Spiel;
        }
    }
}