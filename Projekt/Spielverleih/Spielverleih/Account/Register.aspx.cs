using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Ludothek.Model;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Spielverleih.Models;

namespace Spielverleih.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            
            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                var benutzer = new Benutzer()
                {
                    ID = new Guid(user.Id),
                    Vorname = Vorname.Text,
                    Nachname = Nachname.Text,
                    Strasse = Strasse.Text,
                    PLZ = int.Parse(Plz.Text),
                    Ort = Ort.Text
                };
                manager.AddToRole(user.Id, "Kunde");
                var db = new LudothekDBEntities();
                db.Benutzer.Add(benutzer);
                db.SaveChanges();
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}