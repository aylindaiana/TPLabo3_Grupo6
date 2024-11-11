<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="mayoristaLabo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <h1 class="text-center">Pagina de inicio</h1>
        <p class="text-center">Bienvenido al panel de administración del Supermercado Mayorista Mayor Mayo.</p>
        <div class="row">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h5>Gestión de Caja</h5>
                    </div>
                    <div class="card-body">
                        <p>Administra las cajas que van a utilizar los Empleados.</p>
                        <a href="/Empleados/Cajas.aspx" class="btn btn-primary btn-block">Ir a Usuarios</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-success text-white text-center">
                        <h5>Gestión de Empleados</h5>
                    </div>
                    <div class="card-body">
                        <p>Controla los empleados y sus puestos desde el listado oficial.</p>
                        <a href="/Vistas/Empleados.aspx" class="btn btn-success btn-block">Ir a Empleados</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-info text-white text-center">
                        <h5>Gestión de Clientes</h5>
                    </div>
                    <div class="card-body">
                        <p>Controla los clientes y sus compras desde el listado oficial.</p>
                        <a href="/Vistas/Clientes.aspx" class="btn btn-info btn-block">Ir a Clientes</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-warning text-white text-center">
                        <h5>Gestión de Pagos de clientes</h5>
                    </div>
                    <div class="card-body">
                        <p>Consulta los pagos realizadas en el supermercado, incluyendo sus detalles y descuentos.</p>
                        <a href="/Clientes/Pago.aspx" class="btn btn-warning btn-block">Ir a Compras</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-danger text-white text-center">
                        <h5>Gestión de Productos</h5>
                    </div>
                    <div class="card-body">
                        <p>Visualiza el inventario de productos, sus precios y stock disponible.</p>
                        <a href="/Empleados/Deposito.aspx" class="btn btn-danger btn-block">Ir a Productos</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-secondary text-white text-center">
                        <h5>Reportes de Ventas</h5>
                    </div>
                    <div class="card-body">
                        <p>Revisar y controlar los informes de ventas incluyendo historial de precios.</p>
                        <a href="/Vistas/Ventas.aspx" class="btn btn-secondary btn-block">Ir a Reportes</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
