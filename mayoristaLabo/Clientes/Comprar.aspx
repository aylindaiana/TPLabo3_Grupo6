<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="mayoristaLabo.Clientes.Comprar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Pagina que debe ser vista unicamente por el cliente y muestra los articulos disponibles(elementos de tabla productos con stock > 0)para comprar, cada uno deberia tener un boton que diga comprar y se añade a un carrito.</h3>
    <p>Aca se va a hacer el proceso de compra (insert a compras y por ende mediante un trigger a historial)</p>
</asp:Content>
