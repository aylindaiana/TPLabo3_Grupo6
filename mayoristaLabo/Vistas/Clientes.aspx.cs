using accesoDatos;
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
                //CargarClientes();
                UsuarioNegocio negocio = new UsuarioNegocio();
                Session.Add("listaClientes", negocio.ObtenerClientesConTiposYEstados());
                //List<Usuario> clientes = negocio.ObtenerClientesConTiposYEstados();
                gvClientes.DataSource = Session["listaClientes"];
                gvClientes.DataBind();
            }
        }

        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            long idCliente = Convert.ToInt64(e.CommandArgument);
            UsuarioNegocio negocio = new UsuarioNegocio();

            if (e.CommandName == "Editar")
            {
                Response.Redirect($"EditarClientes.aspx?id={idCliente}");
            }
            else if (e.CommandName == "Accion")
            {
                bool estadoActual = negocio.ObtenerEstadoUsuario(idCliente);
                negocio.CambiarEstadoCliente(idCliente, !estadoActual);
                lblMensaje.CssClass = estadoActual ? "text-danger" : "text-success";
                lblMensaje.Text = estadoActual ? "Cliente dado de baja exitosamente." : "Cliente reactivado exitosamente.";
                CargarClientes();
            }

        }

        protected void btnDesactivar_Click(Object sender, EventArgs e)
        {
            lblMensaje.Text = string.Empty;

            Button btnDesactivar = (Button)sender;
            long idCliente = long.Parse(btnDesactivar.CommandArgument);

            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                bool estadoActual = negocio.ObtenerEstadoUsuario(idCliente);  

                if (estadoActual) 
                {
                    negocio.CambiarEstadoCliente(idCliente, false);  
                    lblMensaje.Text = "El cliente fue desactivado correctamente.";
                }
                else
                {
                    lblMensaje.Text = "El cliente ya está desactivado.";
                }

                CargarClientes();  
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Ocurrió un error al intentar desactivar el cliente: " + ex.Message;
            }
        }

        protected void btnReactivar_Click(Object sender, EventArgs e)
        {
            lblMensaje.Text = string.Empty;

            Button btnReactivar = (Button)sender;
            long idCliente = long.Parse(btnReactivar.CommandArgument);

            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                bool estadoActual = negocio.ObtenerEstadoUsuario(idCliente);  

                if (!estadoActual) 
                {
                    negocio.CambiarEstadoCliente(idCliente, true); 
                    lblMensaje.Text = "El cliente fue reactivado correctamente.";
                }
                else
                {
                    lblMensaje.Text = "El cliente ya está activo.";
                }

                CargarClientes(); 
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Ocurrió un error al intentar reactivar el cliente: " + ex.Message;
            }
        }

        private void CargarClientes()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            List<Usuario> clientes = negocio.ObtenerClientesConTiposYEstados();
            gvClientes.DataSource = clientes;
            gvClientes.DataBind();
        }



        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Usuario> lista = (List<Usuario>)Session["listaClientes"];
            List<Usuario> listaFiltrada = lista.FindAll(x=> x.nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            gvClientes.DataSource = listaFiltrada;
            gvClientes.DataBind();
        }

    }
}