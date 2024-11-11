<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Navegacion.aspx.cs" Inherits="mayoristaLabo.Navegacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <h2 class="text-center mb-4">Navegación del Sitio Completo (ADMINISTRADOR)</h2>
        <p class="text-center">Exploración de todas las secciones disponibles en el sitio.</p>

        <div class="row justify-content-center mb-4">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h3>General</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="Inicio.aspx" class="btn btn-outline-primary mb-2 w-100">Inicio</a></li>
                            <li><a href="Ingreso.aspx" class="btn btn-outline-primary mb-2 w-100">Ingreso</a></li>
                            <li><a href="Registro.aspx" class="btn btn-outline-primary mb-2 w-100">Registro</a></li>
                            <li><a href="Exito.aspx" class="btn btn-outline-success mb-2 w-100">Éxito</a></li>
                            <li><a href="Error.aspx" class="btn btn-outline-danger mb-2 w-100">Error</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-info text-white text-center">
                        <h3>Clientes</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="/Clientes/Comprar.aspx" class="btn btn-info mb-2 w-100">Comprar</a></li>
                            <li><a href="/Clientes/Pago.aspx" class="btn btn-info mb-2 w-100">Pago</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-white text-center">
                        <h3>Repositor</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="/Empleados/Deposito.aspx" class="btn btn-warning mb-2 w-100">Depósito</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white text-center">
                        <h3>Cajero</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="/Empleados/Cajas.aspx" class="btn btn-success mb-2 w-100">Cajas</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-danger text-white text-center">
                        <h3>Gerente</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="/Vistas/Clientes.aspx" class="btn btn-danger mb-2 w-100">Listado Clientes</a></li>
                            <li><a href="/Vistas/Empleados.aspx" class="btn btn-danger mb-2 w-100">Listado Empleados</a></li>
                        </ul>
                        <p class="text-muted text-center">Incluye permisos de Cajero y Repositor</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-dark text-white text-center">
                        <h3>Manager</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="/Vistas/Ventas.aspx" class="btn btn-dark mb-2 w-100">Ventas</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
