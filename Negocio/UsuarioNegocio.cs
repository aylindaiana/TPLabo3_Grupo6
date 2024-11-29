using accesoDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listarUsuarios()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> users = new List<Usuario>();
            try
            {
                datos.setearConsulta("SELECT ID, IDUsuario, Email, Pass, Nombre, Apellido, Direccion, Telefono FROM USUARIOS");
                datos.ejecutarLectura();

                while (datos.Lector.Read()){
                    Usuario aux = new Usuario();

                    aux.ID = (long)datos.Lector["ID"];
                    aux.IDUsuario = (long)datos.Lector["IDUsuario"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Pass = (string)datos.Lector["Pass"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Direccion = (string)datos.Lector["Direccion"];
                    aux.Telefono = (string)datos.Lector["Telefono"];

                    users.Add(aux);
                }

                return users;
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
