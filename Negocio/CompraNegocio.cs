using accesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Negocio
{
    public class CompraNegocio
    {
        public void CargarCompra(Compra compra)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO COMPRAS(IDCompra, IDCaja, IDCliente, IDCajero, Monto, FechaCompra, IDTipoPago, Cantidad, DescuentoMayorista) VALUES (@ID_COMPRA, @ID_CAJA, @ID_CLIENTE, @ID_CAJERO, @MONTO_TOTAL, @FECHA_COMPRA, @ID_TIPO_PAGO, @CANTIDAD, @DESCUENTO_MAYORISTA)");

                datos.setearParametro("@ID_COMPRA", (object)compra.IDCompra ?? DBNull.Value);
                datos.setearParametro("@ID_CAJA", (object)compra.IDCaja ?? DBNull.Value);
                datos.setearParametro("@ID_CLIENTE", (object)compra.IDCliente ?? DBNull.Value);
                datos.setearParametro("@ID_CAJERO", (object)compra.IDCajero ?? DBNull.Value);
                datos.setearParametro("@MONTO_TOTAL", (object)compra.Monto ?? DBNull.Value);
                datos.setearParametro("@FECHA_COMPRA", (object)compra.FechaCompra ?? DBNull.Value);
                datos.setearParametro("@ID_TIPO_PAGO", (object)compra.IDTipoPago ?? DBNull.Value);
                datos.setearParametro("@CANTIDAD", (object)compra.Cantidad ?? DBNull.Value);
                datos.setearParametro("@DESCUENTO_MAYORISTA", (object)compra.DescuentoMayorista ?? DBNull.Value);

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

        public int UltimoIDCompraCargado()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT dbo.FN_ULTIMO_IDCOMPRA_CARGADO() AS IDCompra");
                return datos.ejecutarAccionScalar();
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

        public static List<Compra> ListarCompras()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Compra> listaComprasGeneral = new List<Compra>();
            try
            {
                datos.setearConsulta("EXEC SP_LISTAR_COMPRAS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Compra aux = new Compra();

                    aux.IDCompra = (object)datos.Lector["IDCompra"] == null ? 0 : (long)datos.Lector["IDCompra"];
                    aux.IDCaja = (object)datos.Lector["IDCaja"] == null ? 0 : (long)datos.Lector["IDCaja"];
                    aux.IDCliente = (object)datos.Lector["IDCliente"] == null ? 0 : (long)datos.Lector["IDCliente"];
                    aux.IDCajero = (object)datos.Lector["IDCajero"] == null ? 0 : (long)datos.Lector["IDCajero"];
                    aux.Monto = (object)datos.Lector["Monto"] == null ? 0 : (decimal)datos.Lector["Monto"];
                    aux.FechaCompra = (object)datos.Lector["FechaCompra"] == null ? DateTime.Now : (DateTime)datos.Lector["FechaCompra"];
                    aux.IDTipoPago = (object)datos.Lector["IDTipoPago"] == null ? 0 : (long)datos.Lector["IDTipoPago"];
                    aux.Cantidad = (object)datos.Lector["Cantidad"] == null ? 0 : (long)datos.Lector["Cantidad"];
                    aux.DescuentoMayorista = (object)datos.Lector["DescuentoMayorista"] == null ? 0 : (decimal)datos.Lector["DescuentoMayorista"];

                    listaComprasGeneral.Add(aux);
                }

                return listaComprasGeneral;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
