<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="mayoristaLabo.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="text-center mb-4">Registro de Usuario</h3>
        <div class="card">
            <div class="card-header">
                <h5 class="text-center">Crear una cuenta</h5>
            </div>
            <div class="card-body">
                <asp:Label ID="lblErrores" runat="server" CssClass="text-danger d-block mb-3"></asp:Label>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Ingrese su correo electrónico"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtPass" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Ingrese su contraseña"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Ingrese su nombre"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" Placeholder="Ingrese su apellido"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtDireccion" class="form-label">Dirección</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Placeholder="Ingrese su dirección"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtTelefono" class="form-label">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Placeholder="Ingrese su teléfono"></asp:TextBox>
                </div>
                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary w-100" Text="Registrar" OnClick="btnRegistrar_Click"></asp:Button>
            </div>
        </div>
    </div>
</asp:Content>
