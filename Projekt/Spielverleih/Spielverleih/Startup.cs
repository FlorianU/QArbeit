using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Spielverleih.Startup))]
namespace Spielverleih
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
