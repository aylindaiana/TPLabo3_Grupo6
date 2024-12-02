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
    public partial class DepositoProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["PaginaAnterior"] == "Deposito" || Session["PaginaAnterior"] == "Funcion")
                {
                    int id = int.Parse(Session["IDProducto"].ToString());
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Articulo aux = negocio.ListarArticulos(id)[0];

                    categoria.Text = aux.Categoria;
                    nombre.Text = aux.Nombre;
                    precio.Text = "$" + aux.Precio.ToString();
                    descripcion.Text = aux.Descripcion;
                    stock.Text = aux.Stock.ToString();
                    imagen.ImageUrl = aux.UrlImagen;

                    if(aux.Stock < 1)
                    {
                        restarStock.Enabled = false;
                    } else
                    {
                        restarStock.Enabled = true;
                    }
                }
                else
                {
                    Response.Redirect("Deposito.aspx");
                    Session["PaginaAnterior"] = "";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        protected void agregar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            int id = int.Parse(Session["IDProducto"].ToString());
            negocio.agregarStock(id);
            Session["PaginaAnterior"] = "Funcion";

            Articulo aux = negocio.ListarArticulos(id)[0];
            stock.Text = aux.Stock.ToString();
        }

        protected void restar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            int id = int.Parse(Session["IDProducto"].ToString());
            negocio.restarStock(id);
            Session["PaginaAnterior"] = "Funcion";

            Articulo aux = negocio.ListarArticulos(id)[0];
            stock.Text = aux.Stock.ToString();
        }
    }
}