using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CompraExpandida
    {
        public long IDCompra { get; set; }
        public long IDCaja { get; set; }
        public long IDCajero { get; set; }
        public string NombreCajero { get; set; }
        public long IDCliente { get; set; }
        public string NombreCliente { get; set; }
        public string TipoCliente { get; set; }
        public DateTime FechaCompra { get; set; }
        public string TipoPago { get; set; }
        public long CantidadProductos { get; set; }
        public string ImporteBruto { get; set; }
        public string DescuentoMayorista { get; set; }
        public string ImporteNetoTotal { get; set; }
    }
}
