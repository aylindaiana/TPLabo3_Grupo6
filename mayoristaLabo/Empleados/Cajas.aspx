<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Cajas.aspx.cs" Inherits="mayoristaLabo.Empleados.Cajas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el Cajero/Gerente/Manager</h3>
    <p>La idea es que hayan 5 cajas, estas pueden estar u no ocupadas por un empleado.</p>
    <p>El empleado al navegar aqui, puede ingresar (como maximo a una caja) o desloguearse de esta</p>
    <p>Operacion de sql: empleado_x_caja</p>

        <div class="container mt-4">
        <h3>Asignación de Cajas</h3>

        <div class="row">
            <%-- Mostrar las 5 cajas --%>
            <asp:Repeater ID="repeaterCajas" runat="server">
                <ItemTemplate>
                    <div class="col-md-2 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Caja <%# Eval("IDCaja") %></h5>
                                <%# Eval("Estado") == "Disponible" ? "<p>Disponible</p>" : "<p>Ocupada</p>" %>

                                <asp:Button ID="btnAsignar" runat="server" CommandArgument='<%# Eval("IDCaja") %>' Text='<%# Eval("Estado") == "Disponible" ? "Asignarme" : "Desasignarme" %>' CssClass="btn btn-primary" OnClick="btnAsignar_Click" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
