<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DepositoProducto.aspx.cs" Inherits="mayoristaLabo.DepositoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="d-flex align-items-center justify-content-center gap-2 bg-light">
            <asp:Image ID="imagen" runat="server"/>
            <div class="info d-flex flex-column">
                <asp:Label ID="categoria" runat="server" Text="Categoria" CssClass="m-0"></asp:Label>
                <asp:Label ID="nombre" runat="server" Text="Nombre" CssClass="mt-0"></asp:Label>
                <asp:Label ID="descripcion" runat="server" Text="Descripcion"></asp:Label>
                <div class="info-min d-flex justify-content-between">
                    <asp:Label ID="precio" runat="server" Text="Precio"></asp:Label>
                    <div class="info-func d-flex">
                        <asp:Label ID="stock" runat="server" Text="Stock"></asp:Label>
                        <asp:Button ID="agregarStock" runat="server" Text="Agregar" CssClass="btn-producto btn btn-success" OnClick="agregar_Click"/>
                        <asp:Button ID="restarStock" runat="server" Text="Restar" CssClass="btn-producto btn btn-danger" OnClick="restar_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
