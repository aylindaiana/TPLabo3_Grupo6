using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["NombreUsuario"] != null)
                {
                    lblUsuarioLogueado.Text = $"Bienvenido, {Session["NombreUsuario"]}";
                    btnCerrarSesion.Visible = true;
                }
                else
                {
                    lblUsuarioLogueado.Text = "";
                    btnCerrarSesion.Visible = false;
                }
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Borra toda la sesión
            Response.Redirect("~/Ingreso.aspx"); // Redirige a la página de inicio de sesión
        }
    }
}