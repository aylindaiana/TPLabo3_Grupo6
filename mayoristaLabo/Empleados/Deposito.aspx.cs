using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo.Empleados
{
    public partial class Deposito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                List<Articulo> Articulos = new List<Articulo>();


                Articulos = negocio.ListarCategoria(1);
                dgvListaLacteos.DataSource = Articulos;
                dgvListaLacteos.DataBind();

                Articulos = negocio.ListarCategoria(2);
                dgvListaPanaderia.DataSource = Articulos;
                dgvListaPanaderia.DataBind();


                Articulos = negocio.ListarCategoria(3);
                dgvListaFrescos.DataSource = Articulos;
                dgvListaFrescos.DataBind();
            }
        }

        protected void dgvListaFrescos_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["IDProducto"] = dgvListaFrescos.SelectedDataKey.Value;
            Session["PaginaAnterior"] = Title.ToString();
            Response.Redirect("DepositoProducto.aspx", false);
        }

        protected void dgvListaPanaderia_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["IDProducto"] = dgvListaPanaderia.SelectedDataKey.Value;
            Session["PaginaAnterior"] = Title.ToString();
            Response.Redirect("DepositoProducto.aspx", false);
        }

        protected void dgvListaLacteos_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["IDProducto"] = dgvListaLacteos.SelectedDataKey.Value;
            Session["PaginaAnterior"] = Title.ToString();
            Response.Redirect("DepositoProducto.aspx", false);
        }
    }
}