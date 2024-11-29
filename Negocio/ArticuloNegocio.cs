using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Threading;
using System.Data.Common;
using Dominio;
using accesoDatos;

namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> ListarArticulos(long id = 0)
            {
            AccesoDatos datos = new AccesoDatos();
            List<Articulo> listaProductos = new List<Articulo>();
            try
            {
                if (id == 0)
                {
                    datos.setearConsulta("SELECT IDProducto, Nombre, Stock, Precio, Descripcion, Estado FROM PRODUCTOS WHERE Estado = 1");
                    datos.ejecutarLectura();
                }
                else
                {
                    datos.setearConsulta("SELECT IDProducto, Nombre, Stock, Precio, Descripcion, Estado FROM PRODUCTOS WHERE Estado = 1 AND IDProducto = " + id);
                    datos.ejecutarLectura();
                }

                while (datos.Lector.Read())
                {
                    Articulo producto = new Articulo();
                    producto.IDProducto = (long)datos.Lector["IDProducto"];
                    producto.Nombre = (string)datos.Lector["Nombre"];
                    producto.Stock = (long)datos.Lector["Stock"];
                    producto.Precio = (decimal)datos.Lector["Precio"];
                    producto.Descripcion = (string)datos.Lector["Descripcion"];
                    producto.Estado = (bool)datos.Lector["Estado"];

                    listaProductos.Add(producto);
                }

                return listaProductos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void CargarCompra_X_Articulo(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO COMPRA_X_PRODUCTO (IDProducto, PrecioUnitarioHistorico) VALUES (@ID_PRODUCTO, @PRECIO_HISTORICO)");
                datos.setearParametro("@ID_PRODUCTO", (object)articulo.IDProducto ?? DBNull.Value);
                datos.setearParametro("@PRECIO_HISTORICO", (object)articulo.Precio ?? DBNull.Value);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
