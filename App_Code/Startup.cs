using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(event2.Startup))]
namespace event2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
