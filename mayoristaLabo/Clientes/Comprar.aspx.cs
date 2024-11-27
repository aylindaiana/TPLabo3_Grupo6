using accesoDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Drawing.Printing;

namespace mayoristaLabo.Clientes
{
    public partial class Comprar : System.Web.UI.Page
    {
        List<Articulo> productosTotales;
        List<Articulo> productosEnCarrito;

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();

            try
            {
                productosTotales = negocio.ListarArticulos();

                if (!IsPostBack)
                {
                    productosEnCarrito = new List<Articulo>();

                    dgvListaDeProductosTotales.DataSource = productosTotales;
                    dgvListaDeProductosTotales.DataBind();

                }

                if (Session["carrito"] == null)
                {
                    Session["carrito"] = new List<Articulo>();
                }
                if (Session["articulos"] == null)
                {
                    Session["articulos"] = productosTotales;
                }



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            // se deja preparado el principio para comenzar con los envios disparadores a la bbdd.
            // faltan ajustes al trigger.
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            productosEnCarrito = (List<Articulo>)Session["carrito"];
            productosTotales = (List<Articulo>)Session["articulos"];


            List<Articulo> listaAux = productosTotales;
            foreach (Articulo carr in productosEnCarrito)
            {
                int cont = 0;
                foreach (Articulo tot in productosTotales)
                {
                    if (carr.IDProducto == tot.IDProducto)
                    {
                        listaAux[cont].Stock = listaAux[cont].Stock + 1;
                    }
                    cont++;
                }
            }
            productosTotales = listaAux;

            productosEnCarrito.Clear();

            Session["articulos"] = productosTotales;
            Session["carrito"] = productosEnCarrito;

            dgvListaDeProductosTotales.DataSource = productosTotales;
            dgvListaDeProductosTotales.DataBind();

            dgvCarrito.DataSource = productosEnCarrito;
            dgvCarrito.DataBind();
        }

        protected void dgvListaDeProductosTotales_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                long idArticulo = (long)dgvListaDeProductosTotales.SelectedDataKey.Value;
                ArticuloNegocio negocio = new ArticuloNegocio();

                productosEnCarrito = (List<Articulo>)Session["carrito"];
                productosTotales = (List<Articulo>)Session["articulos"];
                int indice = productosTotales.FindIndex(x => x.IDProducto == idArticulo);
                if (productosTotales[indice].Stock > 0)
                {

                    foreach (Articulo aux in negocio.ListarArticulos(idArticulo))
                    {
                        aux.Stock = 1;
                        productosEnCarrito.Add(aux);
                    }

                    List<Articulo> auxLista = new List<Articulo>();
                    foreach (Articulo aux in productosTotales)
                    {
                        if (aux.IDProducto == idArticulo)
                        {
                            aux.Stock--;
                            auxLista.Add(aux);
                        }
                        else
                        {
                            auxLista.Add(aux);
                        }
                    }
                    productosTotales = auxLista;


                    Session["articulos"] = productosTotales;
                    Session["carrito"] = productosEnCarrito;

                    dgvListaDeProductosTotales.DataSource = productosTotales;
                    dgvListaDeProductosTotales.DataBind();

                    dgvCarrito.DataSource = productosEnCarrito;
                    dgvCarrito.DataBind();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgvCarrito_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                long idArticulo = (long)dgvCarrito.SelectedDataKey.Value;
                Session["IdAModificar"] = idArticulo;

                productosEnCarrito = (List<Articulo>)Session["carrito"];
                productosTotales = (List<Articulo>)Session["articulos"];


                foreach (Articulo aux in productosEnCarrito)
                {
                    if (idArticulo == aux.IDProducto)
                    {
                        productosEnCarrito.Remove(aux);
                        break;
                    }
                }

                List<Articulo> auxLista = new List<Articulo>();
                foreach (Articulo aux in productosTotales)
                {
                    if (aux.IDProducto == idArticulo)
                    {
                        aux.Stock++;
                        auxLista.Add(aux);
                    }
                    else
                    {
                        auxLista.Add(aux);
                    }
                }
                productosTotales = auxLista;


                Session["articulos"] = productosTotales;
                Session["carrito"] = productosEnCarrito;

                dgvListaDeProductosTotales.DataSource = productosTotales;
                dgvListaDeProductosTotales.DataBind();

                dgvCarrito.DataSource = productosEnCarrito;
                dgvCarrito.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgvListaDeProductosTotales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // evento para manipular los colores de la grilla.
        }
    }
}