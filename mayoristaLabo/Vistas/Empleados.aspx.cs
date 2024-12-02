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
    public partial class Empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                dgvEmpleadosTotales.DataSource = negocio.ObtenerEmpleadosConPuestos();
                dgvEmpleadosTotales.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Navegacion.aspx", false);
        }
    }
}