<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarClientes.aspx.cs" Inherits="mayoristaLabo.Vistas.EditarClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="mb-4 text-center">Editar Cliente</h3>
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger mb-3 d-block"></asp:Label>

        <div class="card shadow">
            <div class="card-body">
                <div class="form-group">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtApellido">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" Placeholder="Apellido"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Correo Electrónico"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPass">Contraseña</label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" Placeholder="Contraseña"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDireccion">Direccion</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Placeholder="Direccion"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label for="txtTelefono">Telefono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Placeholder="Telefono"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success btn-block mt-3" Text="Guardar" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
