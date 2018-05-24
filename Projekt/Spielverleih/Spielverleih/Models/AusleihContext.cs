using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Spielverleih.Models
{
    public class AusleihContext : DbContext
    {
        public AusleihContext() : base("SpielverleihConnection")
        {
        }

        public DbSet<Kunde> Kunden { get; set; }
        public DbSet<Ausleihe> Ausleihen { get; set; }
    }
}