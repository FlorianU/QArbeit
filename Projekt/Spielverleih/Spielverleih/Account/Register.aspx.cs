﻿using System;
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
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                var kunde = new Kunde()
                {
                    ID = new Guid(user.Id),
                    Vorname = Vorname.Text,
                    Nachname = Nachname.Text,
                    //Geburtsdatum = Geburtsdatum.Text,
                    Strasse = Strasse.Text,
                    PLZ = int.Parse(Plz.Text),
                    Ort = Ort.Text
                };
                manager.AddToRole<ApplicationUser, string>(user.Id, "Kunde");
                var db = new LudothekDBEntities();
                db.Kunde.Add(kunde);
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