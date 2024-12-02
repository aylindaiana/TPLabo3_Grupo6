<%@ Page Title="Deposito" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Deposito.aspx.cs" Inherits="mayoristaLabo.Empleados.Deposito" EnableEventValidation="true"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" id="updatePanel">
        <ContentTemplate>
            <h3>Pagina que debe ser vista unicamente por el Repositor/Gerente/Manager</h3>
            <p>Aca tendria que haber una lista de todos los productos actuales y su respectivo stock</p>
            <p>Se podria usar la tabla categoria aquí</p>
            
            <ul class="nav nav-pills d-flex justify-content-center" id="pills-tab" role="tablist">
               <li class="nav-item" role="presentation">
                 <a class="nav-link active" id="pills-lacteos-tab" data-bs-toggle="pill" href="#pills-lacteos" role="tab" aria-controls="pills-lacteos" aria-selected="true">Lacteos</a>
               </li>
               <li class="nav-item" role="presentation">
                 <a class="nav-link" id="pills-panaderia-tab" data-bs-toggle="pill" href="#pills-panaderia" role="tab" aria-controls="pills-panaderia" aria-selected="false">Panaderia</a>
               </li>
               <li class="nav-item" role="presentation">
                 <a class="nav-link" id="pills-frescos-tab" data-bs-toggle="pill" href="#pills-frescos" role="tab" aria-controls="pills-frescos" aria-selected="false">Frescos</a>
               </li>
             </ul>

            <!-- Contenido de las pestañas -->
             <div class="tab-content mt-2" id="pills-tabContent">
               <div class="tab-pane fade show active" id="pills-lacteos" role="tabpanel" aria-labelledby="pills-lacteos-tab">
                   <!-- Lacteos -->
                    <asp:GridView ID="dgvListaLacteos" runat="server" CssClass="table table-active" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvListaLacteos_SelectedIndexChanged" DataKeyNames="IDProducto">
                         <Columns>
                             <asp:BoundField HeaderText="ID Producto" DataField="IDProducto" Visible="True" />
                             <asp:BoundField HeaderText="Producto" DataField="Nombre"/>
                             <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText=" Modificar"/>
                         </Columns>
                     </asp:GridView>

               </div>
               <div class="tab-pane fade" id="pills-panaderia" role="tabpanel" aria-labelledby="pills-panaderia-tab">
                   <!-- Panaderia -->
                    <asp:GridView ID="dgvListaPanaderia" runat="server" CssClass="table table-active" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvListaPanaderia_SelectedIndexChanged" DataKeyNames="IDProducto">
                         <Columns>
                             <asp:BoundField HeaderText="ID Producto" DataField="IDProducto" Visible="True" />
                             <asp:BoundField HeaderText="Producto" DataField="Nombre"/>
                             <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText=" Modificar"/>
                         </Columns>
                     </asp:GridView>

               </div>
               <div class="tab-pane fade" id="pills-frescos" role="tabpanel" aria-labelledby="pills-frescos-tab">
                   <!-- Frescos -->
                     <asp:GridView ID="dgvListaFrescos" runat="server" CssClass="table table-active" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvListaFrescos_SelectedIndexChanged" DataKeyNames="IDProducto">
                         <Columns>
                             <asp:BoundField HeaderText="ID Producto" DataField="IDProducto" Visible="True" />
                             <asp:BoundField HeaderText="Producto" DataField="Nombre"/>
                             <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText=" Modificar"/>
                         </Columns>
                     </asp:GridView>

               </div>
             </div>  
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
