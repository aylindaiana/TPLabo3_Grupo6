<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="mayoristaLabo.Vistas.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el Gerente/Manager</h3>

    <h3 class="mt-4 text-center">Gestión de Clientes</h3>
    <p class="text-center">Lista de todos los clientes registrados.</p>

    <div class="container mt-4">
        <div class="input-group mb-3">
            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar cliente"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>

        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
<asp:GridView ID="gvClientes" runat="server" CssClass="table table-striped table-hover"
    AutoGenerateColumns="False" OnRowCommand="gvClientes_RowCommand">
    <Columns>
        <asp:BoundField DataField="IDCliente" HeaderText="ID" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
        <asp:BoundField DataField="Email" HeaderText="Correo Electrónico" />
        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />

        <asp:TemplateField HeaderText="Acción">
            <ItemTemplate>
                <!-- Botón de Editar -->
                <asp:Button ID="btnEditar" runat="server" CommandName="Editar" Text="Editar" 
                    CssClass="btn btn-warning" CommandArgument='<%# Eval("cliente.IDCliente") %>' />

                <!-- Botón de Acción (Dar de Baja/Reactivar) -->
                <asp:Button ID="btnDesactivar" runat="server" Text="Desactivar" CommandArgument='<%# Eval("IDCliente") %>' OnClick="btnDesactivar_Click"  />
                <asp:Button ID="btnReactivar" runat="server" Text="Reactivar" CommandArgument='<%# Eval("IDCliente") %>' OnClick="btnReactivar_Click" />

            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>



    </div>
</asp:Content>
