<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="CRUD.Pages.CRUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    CRUD
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <br />
     <div class="mx-auto" style="width:250px">
         <asp:Label runat="server" CssClass="h2" ID="lblTitulo">
         </asp:Label>
     </div>
     <form runat="server" class="h-100 d-flex align-items-center justify-content-center">
         <div>
             <div class="mb-3">
              <label class="form-label d-block">Nombre</label>
              <asp:Textbox runat="server" CssClass="form-control" ID="tbNombre"></asp:Textbox>
         </div>
        <div class="mb-3">
             <label class="form-label d-block">Edad</label>
             <asp:Textbox runat="server" CssClass="form-control" ID="tbEdad"></asp:Textbox>
        </div>
        <div class="mb-3">
             <label class="form-label d-block">Email</label>
             <asp:Textbox runat="server" CssClass="form-control" ID="tbEmail"></asp:Textbox>
        </div>
        <div class="mb-3">
             <label class="form-label d-block">Fecha de nacimiento</label>
             <asp:Textbox runat="server" TextMode="Date" CssClass="form-control" ID="tbFechana"></asp:Textbox>
        </div>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnCrear" Text="Crear" Visible="false" OnClick="btnCrear_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnActual" Text="Actualizar" Visible="false" OnClick="btnActual_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnBorrar" Text="Borrar" Visible="false" OnClick="btnBorrar_Click"/>
            <asp:Button runat="server" CssClass="btn btn-primary btn-dark" ID="btnVolver" Text="Volver" Visible="true" OnClick="btnVolver_Click"/>
         </div>
     </form>
</asp:Content>
