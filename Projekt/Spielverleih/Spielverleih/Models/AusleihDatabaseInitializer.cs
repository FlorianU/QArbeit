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

        }

    }
}