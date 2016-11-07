using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(MHG.SignalIR.Chat.Startup))]
namespace MHG.SignalIR.Chat
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}