using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting;
using System.Text;
using System.Threading.Tasks;
using accesoDatos;
using Dominio;

namespace Negocio
{
    public class ClienteNegocio
    {
        public List<Cliente> listarClientes()
        {
            List<Cliente> clientes = new List<Cliente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT ID, IDCliente, IDTipoCliente");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cliente aux = new Cliente();

                    aux.ID = (long)datos.Lector["ID"];
                    aux.IDCliente = (long)datos.Lector["IDCliente"];
                    aux.IDTipoCliente = (long)datos.Lector["IDTipoCliente"];

                    clientes.Add(aux);
                }

                return clientes;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool esCliente(Usuario usuario)
        {
            List <Cliente> clientes = new List<Cliente>();
            ClienteNegocio negocio = new ClienteNegocio();
            try
            {
                clientes = negocio.listarClientes();

                foreach (Cliente aux in clientes)
                {
                    if (usuario.IDUsuario == aux.IDCliente)
                        return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
