<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Pago.aspx.cs" Inherits="mayoristaLabo.Clientes.Pago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el cliente tras el proceso de seleccion de compra</h3>
    <p>Aca se define el tipo de pago y procede a generar el monto total</p>


    <h3>Felicidades su compra se realizo con exito!</h3>

    <div class="row">

        <div class="col">
            <h5>Datos de la compra</h5>
            <asp:GridView ID="dgvDatosCompra" runat="server" CssClass="table table-active table-bordered"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Codigo Compra" DataField="IDCompra" Visible="false" />
                    <asp:BoundField HeaderText="Caja" DataField="IDCaja" Visible="true" />
                    <asp:BoundField HeaderText="Numero Cajero" DataField="IDCajero" Visible="true" />
                    <asp:BoundField HeaderText="Nombre cajero" DataField="NombreCajero" Visible="true" />
                    <asp:BoundField HeaderText="Identificador Cliente" DataField="IDCliente" Visible="false" />
                    <asp:BoundField HeaderText="Nombre Cliente" DataField="NombreCliente" Visible="true" />
                    <asp:BoundField HeaderText="Tipo de Cliente" DataField="TipoCliente" Visible="true" />
                    <asp:BoundField HeaderText="Fecha de Compra" DataField="FechaCompra" Visible="true" />
                    <asp:BoundField HeaderText="Tipo de pago" DataField="TipoPago" Visible="true" />
                    <asp:BoundField HeaderText="Total de productos" DataField="CantidadProductos" Visible="true" />
                    <asp:BoundField HeaderText="Importe Bruto" DataField="ImporteBruto" Visible="true" />
                    <asp:BoundField HeaderText="Descuento Mayorista" DataField="DescuentoMayorista" Visible="true" />
                    <asp:BoundField HeaderText="Importe neto total" DataField="ImporteNetoTotal" Visible="true" />
                </Columns>
            </asp:GridView>

            <asp:Button Text="Regresar" runat="server" ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-primary"/>

        </div>

        <div class="col">
            <h5>Listado de productos</h5>
            <asp:GridView ID="dgvListaProductosTotales" runat="server" CssClass="table table-active table-bordered"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="ID Compra" DataField="IDCompra" Visible="false" />
                    <asp:BoundField HeaderText="Producto" DataField="NombreProducto" Visible="true" />
                    <asp:BoundField HeaderText="Precio Unitario" DataField="PrecioUnitario" Visible="true" />
                    <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" Visible="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>



</asp:Content>
