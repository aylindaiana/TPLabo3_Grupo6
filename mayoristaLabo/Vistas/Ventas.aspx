<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="mayoristaLabo.Vistas.Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el Manager</h3>
    <p>Historial de compras y un general de facturacion</p>

    <%foreach (Dominio.Compra aux in Negocio.CompraNegocio.ListarCompras())
        {

            List<Dominio.CompraExpandida> C_E = new List<Dominio.CompraExpandida>();
            List<Dominio.CompraXProductoExpandida> CXP_E = new List<Dominio.CompraXProductoExpandida>();

            Negocio.Reportes reporte = new Negocio.Reportes();
            reporte.ReportePostVenta(aux.IDCompra, C_E, CXP_E);

            dgvDatos.DataSource = C_E;
            dgvDatos.DataBind();

            dgvProductosCompra.DataSource = CXP_E;
            dgvProductosCompra.DataBind();
    %>
            <hr />
            <div class="row">
                <div class="col-6">
                    <h5>Datos de la compra</h5>
                    <asp:GridView ID="dgvDatos" runat="server" CssClass="table table-dark table-bordered table table-striped"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Codigo Compra" DataField="IDCompra" Visible="true"/>
                            <asp:BoundField HeaderText="Caja" DataField="IDCaja" Visible="true" />
                            <asp:BoundField HeaderText="Numero Cajero" DataField="IDCajero" Visible="true" />
                            <asp:BoundField HeaderText="Nombre cajero" DataField="NombreCajero" Visible="true" />
                            <asp:BoundField HeaderText="Identificador Cliente" DataField="IDCliente" Visible="true" />
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
                </div>
                <div class="col-8">
                    <h5>Listado de productos</h5>
                    <asp:GridView ID="dgvProductosCompra" runat="server" CssClass="table table-dark table-bordered table table-striped"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="ID Compra" DataField="IDCompra" Visible="true" />
                            <asp:BoundField HeaderText="Producto" DataField="NombreProducto" Visible="true" />
                            <asp:BoundField HeaderText="Categoria" DataField="Categoria" Visible="true" />
                            <asp:BoundField HeaderText="Precio Unitario" DataField="PrecioUnitario" Visible="true" />
                            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" Visible="true" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
    <% } %>
    <asp:Button Text="Regresar" runat="server" ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-primary" />


</asp:Content>
