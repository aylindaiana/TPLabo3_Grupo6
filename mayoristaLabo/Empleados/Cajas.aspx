<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Cajas.aspx.cs" Inherits="mayoristaLabo.Empleados.Cajas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el Cajero/Gerente/Manager</h3>
    <p>La idea es que hayan 5 cajas, estas pueden estar u no ocupadas por un empleado.</p>
    <p>El empleado al navegar aqui, puede ingresar (como maximo a una caja) o desloguearse de esta</p>
    <p>Operacion de sql: empleado_x_caja</p>
</asp:Content>
