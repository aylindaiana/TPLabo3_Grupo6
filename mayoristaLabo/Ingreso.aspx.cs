using accesoDatos;
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                userErrorMsg.Visible = false;
                errorMessage.Visible = false;
            }
        }
        protected void btnValidate_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtUsuario.Text.Trim();
                string password = txtPassword.Text.Trim();

                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuario = negocio.ValidarUsuario(email, password);

                if (usuario != null && usuario.estado)
                {
                    Session["NombreUsuario"] = usuario.nombre;
                    Session["IDUsuario"] = usuario.IdUsuario;
                    Response.Redirect("Inicio.aspx");
                }
                else if (usuario != null && !usuario.estado)
                {
                    errorMessage.InnerText = "El usuario está inactivo. Contacte al administrador.";
                    errorMessage.Visible = true;
                }
                else
                {
                    userErrorMsg.InnerText = "Usuario o contraseña incorrectos. Intente nuevamente.";
                    userErrorMsg.Visible = true;
                }
            }
            catch (Exception ex)
            {
                errorMessage.InnerText = $"Error en el inicio de sesión: {ex.Message}";
                errorMessage.Visible = true;
            }
        }
    }
}