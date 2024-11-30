using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo.Vistas
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
            }
        }
        private void CargarClientes()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            gvClientes.DataSource = negocio.ListarUsuarios();
            gvClientes.DataBind();
        }
        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            long idCliente = Convert.ToInt64(e.CommandArgument);

            UsuarioNegocio negocio = new UsuarioNegocio();

            if (e.CommandName == "Editar")
            {
                Response.Redirect($"EditarCliente.aspx?id={idCliente}");
            }
            else if (e.CommandName == "Accion")
            {
                bool estadoActual = negocio.ObtenerEstadoUsuario(idCliente);

                negocio.CambiarEstadoUsuario(idCliente, !estadoActual);

                lblMensaje.CssClass = "text-success";
                lblMensaje.Text = estadoActual ? "Cliente reactivado exitosamente." : "Cliente dado de baja exitosamente.";

                CargarClientes();
            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

    }
}