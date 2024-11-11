<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Ingreso.aspx.cs" Inherits="mayoristaLabo.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .login-container {
            max-width: 400px; 
            margin: 50px auto; 
            padding: 30px;
            background-color: #fff;
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .login-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .error-message {
            display: none;
            color: red;
            font-size: 0.9rem;
            margin-top: 5px;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-mayorista {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            font-size: 1.1rem;
        }
        .forgot-password {
            font-size: 0.9rem;
            color: #007bff;
        }
        .forgot-password:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--<h3>Pagina de ingreso</h3>-->
    <!--<p>(LOGIN)</p> -->
     <div class="background"></div>
        <div class="container">
            <div class="login-container">
                <h2 class="text-center login-title">Mayorista Mayor Mayo</h2>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario</label>
                    <asp:TextBox ID="txtUsuario" CssClass="form-control" placeholder="Ingrese su usuario" runat="server" />
                    <span id="userErrorMsg" runat="server" class="error-message">Usuario incorrecto. Intente nuevamente.</span>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" placeholder="Ingrese su contraseña" runat="server" />
                    <span id="errorMessage" runat="server" class="error-message">Contraseña incorrecta. Intente nuevamente.</span>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe"/>
                    <label class="form-check-label" for="rememberMe">Recordarme</label>
                </div>
                <asp:Button ID="btnValidate" CssClass="btn btn-mayorista w-100" Text="Iniciar sesión" OnClick="btnValidate_Click" runat="server" />
                <div class="mt-3 text-center">
                    <a href="#" class="forgot-password">¿Olvidé mi contraseña?</a>
                </div>
            </div>
        </div>
</asp:Content>
