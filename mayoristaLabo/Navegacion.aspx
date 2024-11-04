<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Navegacion.aspx.cs" Inherits="mayoristaLabo.Navegacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <h2>Pagina hecha con fines de poder analizar pagina por pagina disponible en el sitio</h2>
            <p>General</p>
            <ul>
                <li><a href="Inicio.aspx" class="btn btn-primary">Inicio</a></li>
                <li><a href="Ingreso.aspx" class="btn btn-primary">Ingreso</a></li>
                <li><a href="Registro.aspx" class="btn btn-primary">Registro</a></li>
                <li><a href="Exito.aspx" class="btn btn-success">Exito</a></li>
                <li><a href="Error.aspx" class="btn btn-danger">Error</a></li>
            </ul>
            <p>Clientes</p>
            <ul>
                <li><a href="/Clientes/Comprar.aspx" class="btn btn-primary">Comprar</a></li>
                <li><a href="/Clientes/Pago.aspx" class="btn btn-primary">Pago</a></li>
            </ul>
            <p>Repositor</p>
            <ul>
                <li><a href="/Empleados/Deposito.aspx" class="btn btn-primary">Deposito</a></li>
            </ul>
            <p>Cajero</p>
            <ul>
                <li><a href="/Empleados/Cajas.aspx" class="btn btn-primary">Cajas</a></li>
            </ul>
            <p>Gerente</p>
            <ul>
                <li><a href="/Vistas/Clientes.aspx" class="btn btn-primary">Listado Clientes</a></li>
                <li><a href="/Vistas/Empleados.aspx" class="btn btn-primary">Listado Empleados</a></li>
                <p>Mas todos los botones de cajero y repositor.</p>
            </ul>
            <p>Manager</p>
            <ul>
                <li><a href="/Vistas/Ventas.aspx" class="btn btn-primary">Ventas</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
