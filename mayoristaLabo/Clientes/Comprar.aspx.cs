using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Printing;
using System.Web.Security;
using accesoDatos;
using Dominio;
using Negocio;


namespace mayoristaLabo.Clientes
{
    public partial class Comprar : System.Web.UI.Page
    {
        List<Articulo> productosTotales;
        List<Articulo> productosEnCarrito;
        bool efectivo;
        bool tarjeta;
        decimal subtotal;

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
                    subtotal = 0;
                    lblSubtotalCalculado.Text = subtotal.ToString();
                    efectivo = true;
                    tarjeta = false;
                    btnComprar.Enabled = false;
                }

                if (Session["carrito"] == null)
                {
                    Session["carrito"] = new List<Articulo>();
                }
                if (Session["articulos"] == null)
                {
                    Session["articulos"] = productosTotales;
                }
                if (Session["subtotal"] == null)
                {
                    Session["subtotal"] = subtotal;
                }
                if (Session["efectivo"] == null)
                {
                    Session["efectivo"] = efectivo;
                }
                if (Session["tarjeta"] == null)
                {
                    Session["tarjeta"] = tarjeta;
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
            //
            // en este insert del tipo instead of, se van a hacer todos los insert correspondientes en el carrito.
            // para luego hacer un insert general en compras donde se sumaran todos los articulos que tengan idCompra en null.
            //
            // esto dara como resultado que si se quiere saber la cantida que se compro de un producto 
            // en dicha compra, se tendra que hacer una view con la clausula group by,
            // y que ademas haga un count en el apartado de cantidad para que sume la cantidad de ese producto en esa compra.
            //
            // por consecuente ya se tendrian todos los datos necesarios

            ArticuloNegocio artNegocio = new ArticuloNegocio();
            CompraNegocio compNegocio = new CompraNegocio();
            Compra compra = new Compra();
            Usuario usuario = (Usuario)(Session["usuario"]);
            try
            {
                productosEnCarrito = (List<Articulo>)Session["carrito"];
                efectivo = (bool)Session["efectivo"];
                tarjeta = (bool)Session["tarjeta"];

                //-------SE CARGAN CADA UNO DE LOS ARTICULOS EN LA TABLA DE VENTAS
                foreach (Articulo art in productosEnCarrito)
                {
                    artNegocio.CargarCompra_X_Articulo(art);
                }

                compra.IDCompra = 0; // indistinto ya que en el trigger se calcula.


                //--------------// ESTE IF TIENE QUE QUEDAR COMENTADO HASTA QUE TENGAMOS ARMADO EL LOGIN //--------------
                //if (ClienteNegocio.esCliente(usuario))
                //{

                compra.IDCaja = 0; //caja reservada para el autoservicio

                compra.IDCliente = (object)usuario == null ? 5 : usuario.IdUsuario; // obviamente para estas pruebas va a ser null porque todavia no tenemos desarrollado un login.

                compra.IDCajero = 0; //cajero reservada para el autoservicio

                //}
                //-------------------------------------------------------------------------------------------------------

                compra.Monto = 0; // indistinto ya que en el trigger se calcula.
                compra.FechaCompra = DateTime.Now;
                if (efectivo)
                    compra.IDTipoPago = 1;
                if (tarjeta)
                    compra.IDTipoPago = 2;

                compra.Cantidad = 0;  // indistinto ya que en el trigger se calcula.
                compra.DescuentoMayorista = 0; // indistinto ya que en el trigger se calcula.

                compNegocio.CargarCompra(compra);// se carga la compra. 


                Response.Redirect("Pago.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            btnComprar.Enabled = false;

            productosEnCarrito = (List<Articulo>)Session["carrito"];
            productosTotales = (List<Articulo>)Session["articulos"];

            subtotal = (decimal)Session["subtotal"];
            subtotal = 0;
            Session["subtotal"] = subtotal;

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

            lblSubtotalCalculado.Text = subtotal.ToString();
        }

        protected void dgvListaDeProductosTotales_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                btnComprar.Enabled = true;

                long idArticulo = (long)dgvListaDeProductosTotales.SelectedDataKey.Value;
                ArticuloNegocio negocio = new ArticuloNegocio();

                productosEnCarrito = (List<Articulo>)Session["carrito"];
                productosTotales = (List<Articulo>)Session["articulos"];

                subtotal = (decimal)Session["subtotal"];
                int indice = productosTotales.FindIndex(x => x.IDProducto == idArticulo);
                if (productosTotales[indice].Stock > 0)
                {

                    foreach (Articulo aux in negocio.ListarArticulos(idArticulo))
                    {
                        aux.Stock = 1;
                        subtotal += aux.Precio;
                        productosEnCarrito.Add(aux);
                    };
                    Session["subtotal"] = subtotal;

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

                    lblSubtotalCalculado.Text = subtotal.ToString();
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

                subtotal = (decimal)Session["subtotal"];

                foreach (Articulo aux in productosEnCarrito)
                {
                    if (idArticulo == aux.IDProducto)
                    {
                        subtotal -= aux.Precio;
                        productosEnCarrito.Remove(aux);
                        break;
                    }
                }
                Session["subtotal"] = subtotal;

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

                if (productosEnCarrito.Count == 0)
                {
                    btnComprar.Enabled = false;
                }

                Session["articulos"] = productosTotales;
                Session["carrito"] = productosEnCarrito;

                dgvListaDeProductosTotales.DataSource = productosTotales;
                dgvListaDeProductosTotales.DataBind();

                dgvCarrito.DataSource = productosEnCarrito;
                dgvCarrito.DataBind();

                lblSubtotalCalculado.Text = subtotal.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgvListaDeProductosTotales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // evento para manipular la visual de la grilla dgv.
        }

        protected void btnEfectivo_Click(object sender, EventArgs e)
        {
            btnEfectivo.CssClass = "btn btn-primary";
            btnTarjeta.CssClass = "btn btn-outline-primary";
            efectivo = true;
            tarjeta = false;
            Session["efectivo"] = efectivo;
            Session["tarjeta"] = tarjeta;
        }

        protected void btnTarjeta_Click(object sender, EventArgs e)
        {
            btnTarjeta.CssClass = "btn btn-primary";
            btnEfectivo.CssClass = "btn btn-outline-primary";
            tarjeta = true;
            efectivo = false;
            Session["tarjeta"] = tarjeta;
            Session["efectivo"] = efectivo;
        }

    }
}