using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Spielverleih.Models
{
    public class Ausleihe
    {
        [ScaffoldColumn(false)]
        public Guid Id { get; set; }

        [Required, Display(Name = "Ausleihdatum")]
        public DateTime Ausleihdatum { get; set; }

        [Required, Display(Name = "Rückgabedatum")]
        public DateTime Enddatum { get; set; }

        public Guid SpielId { get; set; }
        public Guid KundeId { get; set; }

        public virtual Kunde Kunde { get; set; }
    }
}