using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
                    datos.setearConsulta("SELECT IDProducto, Nombre, Stock, Precio, Descripcion, Estado FROM PRODUCTOS");
                    datos.ejecutarLectura();
                }
                else
                {
                    datos.setearConsulta("SELECT IDProducto, Nombre, Stock, Precio, Descripcion, Estado FROM PRODUCTOS WHERE IDProducto = " + id);
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


    }
}
