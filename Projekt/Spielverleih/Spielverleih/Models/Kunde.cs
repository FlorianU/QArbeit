using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Spielverleih.Models
{
    public class Kunde
    {
        [ScaffoldColumn(false)]
        public Guid Id { get; set; }

        [Required, Display(Name = "Vorname")]
        public string Vorname { get; set; }

        [Required, Display(Name = "Name")]
        public string Name { get; set; }

        [Required, Display(Name = "PLZ")]
        public int Plz { get; set; }

        [Required, Display(Name = "Ort")]
        public string Ort { get; set; }

        [Required, Display(Name = "Strasse")]
        public string Strasse { get; set; }

        [Required, Display(Name = "Strassennummer")]
        public string Strassennummer { get; set; }

        public virtual ICollection<Ausleihe> Ausleihen { get; set; }
    }
}