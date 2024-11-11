using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mayoristaLabo.Empleados
{
    public partial class Cajas : System.Web.UI.Page
    {
        private Cajas _context;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // CargarCajas();
               Message.ReferenceEquals(this, null );
            }
        }
        /*
        private void CargarCajas()
        {
            var cajas = _context.
                .Select(c => new
                {
                    c.IDCaja,
                    Estado = _context.CajaXEmpleados.Any(ce => ce.IDCaja == c.IDCaja) ? "Ocupada" : "Disponible"
                })
                .Take(5)  // Solo tomar las primeras 5 cajas
                .ToList();

            repeaterCajas.DataSource = cajas;
            repeaterCajas.DataBind();
        }*/
        protected void btnAsignar_Click(object sender, EventArgs e)
        { }
            /*

            private ApplicationDbContext _context;

            protected void Page_Load(object sender, EventArgs e)
            {
                // Inicializamos el contexto de la base de datos
                _context = new ApplicationDbContext();

                // Cargar las cajas solo si es la primera carga de la página
                if (!IsPostBack)
                {
                    CargarCajas();
                }
            }

            // Cargar las cajas disponibles desde la base de datos
            private void CargarCajas()
            {
                var cajas = _context.Cajas
                    .Select(c => new
                    {
                        c.IDCaja,
                        Estado = _context.CajaXEmpleados.Any(ce => ce.IDCaja == c.IDCaja) ? "Ocupada" : "Disponible"
                    })
                    .Take(5)  // Solo tomar las primeras 5 cajas
                    .ToList();

                repeaterCajas.DataSource = cajas;
                repeaterCajas.DataBind();
            }

            // Manejar el clic en el botón para asignar o desasignar una caja
            protected void btnAsignar_Click(object sender, EventArgs e)
            {
                // Obtener el ID de la caja del argumento del comando
                var btn = sender as Button;
                long idCaja = Convert.ToInt64(btn.CommandArgument);

                // Obtener el ID del empleado desde la sesión (o de algún sistema de autenticación)
                long idEmpleado = GetEmpleadoIdFromSession();

                if (idEmpleado == 0)
                {
                    // Si el empleado no está autenticado, redirigir a la página de login
                    Response.Redirect("~/Login.aspx");
                    return;
                }

                // Verificar si la caja está ocupada o no
                var caja = _context.Cajas.FirstOrDefault(c => c.IDCaja == idCaja);
                if (caja != null)
                {
                    if (_context.CajaXEmpleados.Any(ce => ce.IDCaja == idCaja))
                    {
                        // Si la caja está ocupada, desasignarla
                        DesasignarCaja(idEmpleado, idCaja);
                    }
                    else
                    {
                        // Si la caja está libre, asignarla al empleado
                        AsignarCaja(idEmpleado, idCaja);
                    }

                    // Volver a cargar las cajas después de la acción
                    CargarCajas();
                }
            }

            // Asignar una caja a un empleado
            private void AsignarCaja(long idEmpleado, long idCaja)
            {
                var asignacion = new CajaXEmpleado
                {
                    IDEmpleado = idEmpleado,
                    IDCaja = idCaja,
                    FichaEntrada = DateTime.Now
                };

                _context.CajaXEmpleados.Add(asignacion);
                _context.SaveChanges();
            }

            // Desasignar una caja de un empleado
            private void DesasignarCaja(long idEmpleado, long idCaja)
            {
                var asignacion = _context.CajaXEmpleados
                    .FirstOrDefault(ce => ce.IDEmpleado == idEmpleado && ce.IDCaja == idCaja);

                if (asignacion != null)
                {
                    asignacion.FichaSalida = DateTime.Now;
                    _context.CajaXEmpleados.Update(asignacion);
                    _context.SaveChanges();
                }
            }

            // Obtener el ID del empleado desde la sesión o el contexto de autenticación
            private long GetEmpleadoIdFromSession()
            {
                // Aquí puedes implementar la lógica para obtener el ID del empleado desde la sesión
                // Por ejemplo:
                return Convert.ToInt64(Session["EmpleadoID"]);
            }
        */
        }
}