using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        public long IDProducto { get; set; }
        public string Nombre { get; set; }
        public long Stock { get; set; }
        public decimal Precio { get; set; }
        public string Categoria { get; set; }
        public string Descripcion { get; set; }
        public string UrlImagen { get; set; }
        public bool Estado { get; set; }
    }
}