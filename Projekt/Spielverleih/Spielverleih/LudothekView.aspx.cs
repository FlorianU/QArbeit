﻿using Ludothek.Model;
using System;
using System.Collections.Generic;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            _context = new LudothekDBEntities();
            if (!Page.IsPostBack)
            {
                lstLudotheken.DataSource = Ludotheken;
                lstLudotheken.DataBind();
            }
        }

        public List<Ludothek.Model.Ludothek> Ludotheken => _context.Ludothek.OrderBy(x => x.Name).ToList();

        protected void Hinzufügen_Click(object sender, EventArgs e)
        {
            Ludothek.Model.Ludothek ludothek = new Ludothek.Model.Ludothek()
            {
                ID = Guid.NewGuid(),
                Name = txtName.Text,
                Strasse = txtStrasse.Text,
                PLZ = int.Parse(txtPLZ.Text),
                Ort = txtOrt.Text,
            };

            _context.Ludothek.Add(ludothek);
            _context.SaveChanges();
            lstLudotheken.DataSource = Ludotheken;
            lstLudotheken.DataBind();
        }
    }
}