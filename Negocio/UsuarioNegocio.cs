using accesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {

        public List<Usuario> ListarUsuarios()
        {
            List<Usuario> usuarios = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT * FROM Usuarios");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario();

                    usuario.IdUsuario = (long)datos.Lector["IDUsuario"];
                    usuario.nombre = datos.Lector["Nombre"].ToString();
                    usuario.apellido = datos.Lector["Apellido"].ToString();
                    usuario.email = datos.Lector["Email"].ToString();
                    usuario.contraseña = datos.Lector["Pass"].ToString();
                    usuario.direccion = datos.Lector["Direccion"].ToString();
                    usuario.telefono = datos.Lector["Telefono"].ToString();
                    usuario.estado = (bool)datos.Lector["Estado"];

                    usuarios.Add(usuario);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return usuarios;
        }

        public void NuevoUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("EXEC sp_AltaUsuario @Email, @Pass, @Nombre, @Apellido, @Direccion, @Telefono");


                datos.setearParametro("@Email", usuario.email);
                datos.setearParametro("@Pass", usuario.contraseña);
                datos.setearParametro("@Nombre", usuario.nombre);
                datos.setearParametro("@Apellido", usuario.apellido);
                datos.setearParametro("@Direccion", usuario.direccion);
                datos.setearParametro("@Telefono", usuario.telefono);

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

        public void ModificarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("EXEC sp_AltaUsuario @Email, @Pass, @Nombre, @Apellido, @Direccion, @Telefono");


                datos.setearParametro("@Email", usuario.email);
                datos.setearParametro("@Pass", usuario.contraseña);
                datos.setearParametro("@Nombre", usuario.nombre);
                datos.setearParametro("@Apellido", usuario.apellido);
                datos.setearParametro("@Direccion", usuario.direccion);
                datos.setearParametro("@Telefono", usuario.telefono);

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


        public void CambiarEstadoUsuario(long idUsuario, bool activar)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                if (activar)
                    datos.setearConsulta("EXEC sp_ReactivarUsuario @IDUsuario");
                else
                    datos.setearConsulta("EXEC sp_DarDeBajaUsuario @IDUsuario");

                datos.setearParametro("@IDUsuario", idUsuario);
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

        public List<Usuario> ObtenerUsuariosConPuestos()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IDUsuario, Nombre, Apellido, FechaIngreso, Puesto FROM VW_VistaUsuariosGeneral");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario();

                    usuario.IdUsuario = (long)datos.Lector["IDUsuario"];
                    usuario.nombre = datos.Lector["Nombre"].ToString();
                    usuario.apellido = datos.Lector["Apellido"].ToString();
                    usuario.estado = (bool)datos.Lector["Estado"];
                    usuario.puesto = datos.Lector["Puesto"].ToString() != "Sin puesto asignado" ?
                             new Puesto { NombrePuesto = datos.Lector["Puesto"].ToString() } : null;

                    listaUsuarios.Add(usuario);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return listaUsuarios;
        }

        public Usuario ValidarUsuario(string email, string pass)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT * FROM USUARIOS WHERE Email = @Email AND Pass = @Pass AND Estado = 1");
                datos.setearParametro("@Email", email);
                datos.setearParametro("@Pass", pass);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario
                    {
                        IdUsuario = (long)datos.Lector["IDUsuario"],
                        email = datos.Lector["Email"].ToString(),
                        nombre = datos.Lector["Nombre"].ToString(),
                        apellido = datos.Lector["Apellido"].ToString(),
                        direccion = datos.Lector["Direccion"].ToString(),
                        telefono = datos.Lector["Telefono"].ToString(),
                        estado = (bool)datos.Lector["Estado"]
                    };
                    return usuario;
                }
                else
                {
                    return null;
                }
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
        public bool ObtenerEstadoUsuario(long idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Estado FROM Usuarios WHERE IDUsuario = @IDUsuario");
                datos.setearParametro("@IDUsuario", idUsuario);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return (bool)datos.Lector["Estado"];
                }
                else
                {
                    return false;
                }
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
