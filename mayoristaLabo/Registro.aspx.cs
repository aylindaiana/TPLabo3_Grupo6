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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblErrores.Text = string.Empty;
            }
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string mensajeError;

                if (!ValidarFormulario(out mensajeError))
                {
                    lblErrores.CssClass = "text-danger d-block";
                    lblErrores.Text = mensajeError;
                    return;
                }
                Usuario nuevoUsuario = new Usuario();


                nuevoUsuario.email = txtEmail.Text;
                nuevoUsuario.contraseña = txtPass.Text;
                nuevoUsuario.nombre = txtNombre.Text;
                nuevoUsuario.apellido = txtApellido.Text;
                nuevoUsuario.direccion = txtDireccion.Text;
                nuevoUsuario.telefono = txtTelefono.Text;


                UsuarioNegocio negocio = new UsuarioNegocio();
                negocio.NuevoUsuario(nuevoUsuario);

                lblErrores.CssClass = "text-success d-block";
                lblErrores.Text = "¡Usuario registrado exitosamente!";
            }
            catch (Exception ex)
            {
                lblErrores.CssClass = "text-danger d-block";
                lblErrores.Text = $"Error al registrar el usuario: {ex.Message}";
            }
        }

        //Funciones

        private bool ValidarFormulario(out string mensajeError)
        {
            mensajeError = string.Empty;

            if (string.IsNullOrWhiteSpace(txtEmail.Text) || !txtEmail.Text.Contains("@"))
            {
                mensajeError = "El campo de correo electrónico es obligatorio.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtPass.Text))
            {
                mensajeError = "El campo de contraseña es obligatorio.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                mensajeError = "El campo de nombre es obligatorio.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtApellido.Text))
            {
                mensajeError = "El campo de apellido es obligatorio.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtDireccion.Text))
            {
                mensajeError = "El campo de dirección es obligatorio.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                mensajeError = "El campo de teléfono es obligatorio.";
                return false;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(txtEmail.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                mensajeError = "Debe ingresar un correo electrónico válido (ejemplo@dominio.com).";
                return false;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(txtTelefono.Text, @"^\+?\d{7,15}$"))
            {
                mensajeError = "Debe ingresar un número de teléfono válido (de 7 a 15 dígitos).";
                return false;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(txtPass.Text, @"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"))
            {
                mensajeError = "La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial.";
                return false;
            }

            return true;
        }

    }
}