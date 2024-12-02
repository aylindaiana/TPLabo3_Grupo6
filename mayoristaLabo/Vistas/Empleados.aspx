<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="mayoristaLabo.Vistas.Empleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el Gerente/Manager</h3>
    <p>Una lista de todos los empleados registrados y su rol</p>

        <div class="row">
            <div class="col">
                <h5>Productos totales</h5>
                <asp:GridView ID="dgvEmpleadosTotales" runat="server"  CssClass="table table-striped table-hover"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="IDEmpleado" DataField="IDUsuario"/>
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:BoundField HeaderText="Apellido" DataField="apellido" />
                        <asp:BoundField HeaderText="Puesto" DataField="Puesto.NombrePuesto" />
                        <asp:BoundField HeaderText="EstadoEmpleado" DataField="estado"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    <asp:Button Text="Regresar" runat="server" ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-primary"/>

</asp:Content>
