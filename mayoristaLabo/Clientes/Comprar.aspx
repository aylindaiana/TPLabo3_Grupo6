<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="mayoristaLabo.Clientes.Comprar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el cliente y muestra los articulos disponibles(elementos de tabla productos con stock > 0)para comprar, cada uno deberia tener un boton que diga comprar y se añade a un carrito.</h3>
    <p>Aca se va a hacer el proceso de compra (insert a compras y por ende mediante un trigger a historial)</p>


    <div class="row">
        <div class="col">
            <h5>Productos totales</h5>
            <asp:GridView ID="dgvListaDeProductosTotales" runat="server" CssClass="table table-active table-bordered"
                AutoGenerateColumns="false" OnSelectedIndexChanged="dgvListaDeProductosTotales_SelectedIndexChanged" DataKeyNames="IDProducto" OnRowDataBound="dgvListaDeProductosTotales_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="IDProducto" DataField="IDProducto" Visible="false" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Stock" DataField="Stock" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Estado" DataField="Estado" />
                    <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="Agregar al carrito" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col">
            <h5>Carrito de compras</h5>
            <asp:GridView ID="dgvCarrito" runat="server" CssClass="table table-active table-bordered"
                AutoGenerateColumns="false" OnSelectedIndexChanged="dgvCarrito_SelectedIndexChanged" DataKeyNames="IDProducto"> 
                <Columns>
                    <asp:BoundField HeaderText="IDProducto" DataField="IDProducto" Visible="false" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Cantidad" DataField="Stock" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Estado" DataField="Estado" />
                    <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="Eliminar del carrito" />
                </Columns>
            </asp:GridView>

            <asp:Button Text="Comprar" runat="server" ID="btnComprar" OnClick="btnComprar_Click" CssClass="btn btn-primary" />
            <asp:Button Text="Cancelar" runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>
