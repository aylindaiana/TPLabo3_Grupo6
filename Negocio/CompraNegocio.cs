using accesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    }
}
