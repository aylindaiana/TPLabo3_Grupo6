using accesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        public Usuario ObtenerClientePorID(long idCliente)
        {
            AccesoDatos datos = new AccesoDatos();
            Usuario usuario = null;

            try
            {
                datos.setearConsulta("SELECT * FROM USUARIOS WHERE IDUsuario = @IDCliente");
                datos.setearParametro("@IDCliente", idCliente);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario
                    {
                        IdUsuario = (long)datos.Lector["IdUsuario"],
                        nombre = datos.Lector["Nombre"].ToString(),
                        apellido = datos.Lector["Apellido"].ToString(),
                        email = datos.Lector["Email"].ToString(),
                        contraseña = datos.Lector["Pass"].ToString(),
                        direccion = datos.Lector["Direccion"].ToString(),
                        telefono = datos.Lector["Telefono"].ToString()
                    };
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

            return usuario;
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

        public List<Empleado> ObtenerEmpleadosConPuestos()
        {
            List<Empleado> listaEmpleados = new List<Empleado>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT * FROM VW_EMPLEADOS_PUESTOS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Empleado empleado = new Empleado
                    {
                        IdUsuario = (long)datos.Lector["IDEmpleado"],
                        nombre = datos.Lector["Nombre"].ToString(),
                        apellido = datos.Lector["Apellido"].ToString(),
                        FechaIngreso = datos.Lector["FechaIngreso"] != DBNull.Value
                                       ? (DateTime?)datos.Lector["FechaIngreso"]
                                       : null,
                        FechaEgreso = datos.Lector["FechaEgreso"] != DBNull.Value
                                      ? (DateTime?)datos.Lector["FechaEgreso"]
                                      : null,
                        Puesto = new Puesto
                        {
                            IdPuesto = (long)datos.Lector["IDPuesto"],
                            NombrePuesto = datos.Lector["NombrePuesto"].ToString()
                        }
                    };

                    listaEmpleados.Add(empleado);
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

            return listaEmpleados;
        }
        public List<Usuario> ObtenerClientesConTiposYEstados()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT * FROM VW_CLIENTES_TIPO_ESTADO");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    
                        usuario.cliente.IDCliente = datos.Lector["IDCliente"] != DBNull.Value ? (long)datos.Lector["IDCliente"] : 0;

                    usuario.nombre = datos.Lector["Nombre"].ToString();
                    usuario.apellido = datos.Lector["Apellido"].ToString();
                    usuario.email = datos.Lector["Email"].ToString();
                    usuario.telefono = datos.Lector["Telefono"].ToString();
                    usuario.cliente.Estado = datos.Lector["Estado"].ToString() == "Activo";
                    

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
        public bool ObtenerEstadoUsuario(long idCliente)
        {
            bool estado = false;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Estado FROM VW_CLIENTES_TIPO_ESTADO WHERE IDCliente = @IDCliente");
                datos.setearParametro("@IDCliente", idCliente);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    estado = (bool)datos.Lector["Estado"];  
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

            return estado;
        }

        public void CambiarEstadoCliente(long idCliente, bool estado)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("EXEC sp_DarDeBajaUsuario @IDCliente, @Estado");

                datos.setearParametro("@IDCliente", idCliente);
                datos.setearParametro("@Estado", estado ? 1 : 0);  

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
