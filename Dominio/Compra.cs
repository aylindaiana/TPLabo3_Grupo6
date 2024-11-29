using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Compra
    {
        public long IDCompra { get; set; }
        public long IDCaja { get; set; }
        public long IDCliente { get; set; }
        public long IDCajero { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaCompra { get; set; }
        public long IDTipoPago { get; set; }
        public long Cantidad { get; set; }
        public decimal DescuentoMayorista { get; set; }
    }
}
