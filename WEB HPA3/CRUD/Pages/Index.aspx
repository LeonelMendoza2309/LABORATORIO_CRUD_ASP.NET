<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CRUD.Pages.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    INICIO
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .create-button:hover {
            background-color: transparent;
            border: 1px solid #198754;
            color: #198754;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form runat="server">
        <br />
        <div class="mx-auto" style="width: 300px;">
            <h2> Listado de Registros</h2>
        </div>
        <br />
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <asp:Button runat="server" ID="BtnCreate" Text="Crear" CssClass="btn btn-success create-button" onclick="BtnCreate_Click" />
                </div>
            </div>
        </div>
        <br />  
        <div class="container row">
            <div class="table small">
                <asp:GridView runat="server" ID="gvusuarios" CssClass="table table-borderless table-hover">
                    <columns>
                        <asp:TemplateField HeaderText="Opciones Del Administrador">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Leer" CssClass="btn form-control-sm btn-info" ID="BtnLeer" onclick="BtnLeer_Click" />
                                <asp:Button runat="server" Text="Actualizar" CssClass="btn form-control-sm btn-warning" ID="BtnActualizar" onclick="BtnActualizar_Click" />
                                <asp:Button runat="server" Text="Borrar" CssClass="btn form-control-sm btn-danger" ID="BtnBorrar" onclick="BtnBorrar_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </columns>
                </asp:Gridview>
            </div>
        </div>
    </form>
</asp:Content>
