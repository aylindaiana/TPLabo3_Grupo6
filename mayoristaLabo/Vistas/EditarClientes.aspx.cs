using accesoDatos;
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo.Vistas
{
    public partial class EditarClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                long idCliente = Convert.ToInt64(Request.QueryString["id"]);
                CargarCliente(idCliente);
            }
        }


        private void CargarCliente(long idCliente)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario usuario = negocio.ObtenerClientePorID(idCliente);

            if (usuario != null)
            {
                txtNombre.Text = usuario.nombre;
                txtApellido.Text = usuario.apellido;
                txtEmail.Text = usuario.email;
                txtPass.Text = usuario.contraseña;
                txtDireccion.Text = usuario.direccion;
                txtTelefono.Text = usuario.telefono;
            }
            else
            {
                lblMensaje.Text = "No se encontró el cliente.";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                long idCliente = Convert.ToInt64(Request.QueryString["id"]);
                UsuarioNegocio negocio = new UsuarioNegocio();

                Usuario usuario = new Usuario
                {
                    IdUsuario = idCliente,
                    nombre = txtNombre.Text,
                    apellido = txtApellido.Text,
                    email = txtEmail.Text,
                    contraseña = txtPass.Text,
                    direccion = txtDireccion.Text,
                    telefono = txtTelefono.Text,
                };

                negocio.ModificarUsuario(usuario);

                lblMensaje.CssClass = "text-success";
                lblMensaje.Text = "Cliente actualizado correctamente.";
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Text = "Ocurrió un error: " + ex.Message;
            }
        }
    }
}