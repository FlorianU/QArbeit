using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Spielverleih.Models
{
    public class AusleiheDatabaseInitializer : DropCreateDatabaseIfModelChanges<AusleihContext>
    {
        protected override void Seed(AusleihContext context)
        {
            GetSpiele().ForEach(c => context.Spiele.Add(c));

        }

        private static List<Spiel> GetSpiele()
        {
            var spiele = new List<Spiel> {
                new Spiel
                {
                    Id = Guid.NewGuid(),
                    Bezeichnung = "Uno",
                    Beschreibung = "Kartenspiel",
                    Fsk = 5
                },
                new Spiel
                {
                    Id = Guid.NewGuid(),
                    Bezeichnung = "Halligalli",
                    Beschreibung = "Famillienspiel",
                    Fsk = 5
                },
                new Spiel
                {
                    Id = Guid.NewGuid(),
                    Bezeichnung = "Cards against Humanity",
                    Beschreibung = "Kartenspiel",
                    Fsk = 16
                },
                new Spiel
                {
                    Id = Guid.NewGuid(),
                    Bezeichnung = "Mensch ärgere dich nicht",
                    Beschreibung = "Brettspiel",
                    Fsk = 5
                },
                new Spiel
                {
                    Id = Guid.NewGuid(),
                    Bezeichnung = "Schach",
                    Beschreibung = "Brettspiel",
                    Fsk = 7
                },
                new Spiel
                {
                    Id = Guid.NewGuid(),
                    Bezeichnung = "Monopoly",
                    Beschreibung = "Familienspiel",
                    Fsk = 5
                }
            };

            return spiele;
        }
    }
}