using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo.Clientes
{
    public partial class Pago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CompraNegocio negocio = new CompraNegocio();
            Reportes reporte = new Reportes();

            long UltimoIDCompra;
            List<CompraExpandida> C_E = new List<CompraExpandida>();
            List<CompraXProductoExpandida> CXP_E = new List<CompraXProductoExpandida>();

            try
            {
                if (!IsPostBack)
                {
                    UltimoIDCompra = negocio.UltimoIDCompraCargado();
                    reporte.ReportePostVenta(UltimoIDCompra, C_E, CXP_E);
                }

                dgvDatosCompra.DataSource = C_E;
                dgvDatosCompra.DataBind();

                dgvListaProductosTotales.DataSource = CXP_E;
                dgvListaProductosTotales.DataBind();

            }
            catch (Exception ex)
            {

                Response.Redirect("/Error.aspx", false);
            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Navegacion.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}