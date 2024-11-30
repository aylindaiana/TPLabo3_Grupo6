<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="mayoristaLabo.Vistas.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el Gerente/Manager</h3>

    <h3 class="mt-4 text-center">Gestión de Clientes</h3>
    <p class="text-center">Lista de todos los clientes registrados.</p>

    <div class="container mt-4">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="input-group mb-3">
            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar cliente"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>
<asp:GridView ID="gvClientes" runat="server" CssClass="table table-striped table-hover"
    AutoGenerateColumns="False" OnRowCommand="gvClientes_RowCommand">
    <Columns>
        <asp:BoundField DataField="IdUsuario" HeaderText="ID" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
        <asp:BoundField DataField="Email" HeaderText="Correo Electrónico" />
        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
        <asp:TemplateField HeaderText="Acción">
            <ItemTemplate>

                <asp:Button ID="btnEditar" runat="server" CommandName="Editar" 
                            Text="Editar" CommandArgument='<%# Eval("IdUsuario") %>' />

                <asp:Button ID="btnAccion" runat="server" CommandName="Accion" 
                            Text='<%# Eval("estado", "") == "True" ? "Dar de Baja" : "Reactivar" %>' 
                            CommandArgument='<%# Eval("IdUsuario") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </div>
</asp:Content>
