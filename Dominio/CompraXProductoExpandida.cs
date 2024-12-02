using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CompraXProductoExpandida
    {
        public long IDCompra { get; set; }
        public string NombreProducto { get; set; }
        public string Categoria { get; set; }
        public decimal PrecioUnitario { get; set; }
        public string Cantidad { get; set; }

    }
}
