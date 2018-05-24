//------------------------------------------------------------------------------
// <auto-generated>
//     Der Code wurde von einer Vorlage generiert.
//
//     Manuelle Änderungen an dieser Datei führen möglicherweise zu unerwartetem Verhalten der Anwendung.
//     Manuelle Änderungen an dieser Datei werden überschrieben, wenn der Code neu generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ludothek.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Spiel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Spiel()
        {
            this.AusleiheSpiel = new HashSet<AusleiheSpiel>();
        }
    
        public System.Guid ID { get; set; }
        public Nullable<int> Spielnummer { get; set; }
        public string Name { get; set; }
        public System.Guid FkVerlag { get; set; }
        public System.Guid FkSpielkategorie { get; set; }
        public System.Guid FkTarifkategorie { get; set; }
        public string Beschreibung { get; set; }
        public Nullable<int> FSK { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AusleiheSpiel> AusleiheSpiel { get; set; }
        public virtual Spielkategorie Spielkategorie { get; set; }
        public virtual Tarifkategorie Tarifkategorie { get; set; }
        public virtual Verlag Verlag { get; set; }
    }
}
