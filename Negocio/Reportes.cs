using accesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Reportes
    {
        public void ReportePostVenta(long IDCompra, List<CompraExpandida> C_E, List<CompraXProductoExpandida> CXP_E)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("EXEC SP_REPORTE_COMPRA_DETALLADA @ID_COMPRA");
                datos.setearParametro("@ID_COMPRA", IDCompra);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    CompraExpandida aux0 = new CompraExpandida();
                    aux0.IDCompra = (object)datos.Lector["Codigo Compra"] == null ? 0 : (long)datos.Lector["Codigo Compra"];
                    aux0.IDCaja = (object)datos.Lector["Caja"] == null ? 0 : (long)datos.Lector["Caja"];
                    aux0.IDCajero = (object)datos.Lector["Numero Cajero"] == null ? 0 : (long)datos.Lector["Numero Cajero"];
                    aux0.NombreCajero = (object)datos.Lector["Nombre cajero"] == null ? "" : (string)datos.Lector["Nombre cajero"];
                    aux0.IDCliente = (object)datos.Lector["Identificador Cliente"] == null ? 0 : (long)datos.Lector["Identificador Cliente"];
                    aux0.NombreCliente = (object)datos.Lector["Nombre Cliente"] == null ? "" : (string)datos.Lector["Nombre Cliente"];
                    aux0.TipoCliente = (object)datos.Lector["Tipo de Cliente"] == null ? "" : (string)datos.Lector["Tipo de Cliente"];
                    aux0.FechaCompra = (object)datos.Lector["Fecha de Compra"] == null ? DateTime.Now : (DateTime)datos.Lector["Fecha de Compra"];
                    aux0.TipoPago = (object)datos.Lector["Tipo de pago"] == null ? "" : (string)datos.Lector["Tipo de pago"];
                    aux0.CantidadProductos = (object)datos.Lector["Total de productos"] == null ? 0 : (long)datos.Lector["Total de productos"];
                    aux0.ImporteBruto = (object)datos.Lector["Importe Bruto"] == null ? "" : (string)datos.Lector["Importe Bruto"];
                    aux0.DescuentoMayorista = (object)datos.Lector["Descuento Mayorista"] == null ? "" : (string)datos.Lector["Descuento Mayorista"];
                    aux0.ImporteNetoTotal = (object)datos.Lector["Importe neto total"] == null ? "" : (string)datos.Lector["Importe neto total"];

                    C_E.Add(aux0);
                }

                if (datos.Lector.NextResult())
                {
                    while (datos.Lector.Read())
                    {
                        CompraXProductoExpandida aux = new CompraXProductoExpandida();

                        aux.IDCompra = (object)datos.Lector["ID Compra"] == null ? 0 : (long)datos.Lector["ID Compra"];
                        aux.NombreProducto = (object)datos.Lector["Producto"] == null ? "" : (string)datos.Lector["Producto"]; 
                        aux.PrecioUnitario = (object)datos.Lector["Precio Unitario"] == null ? 0 : (decimal)datos.Lector["Precio Unitario"]; 
                        aux.Cantidad = (object)datos.Lector["Cantidad"] == null ? "" : (string)datos.Lector["Cantidad"];

                        CXP_E.Add(aux);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
