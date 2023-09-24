<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CRUD.WebForm.Contact" %>

<%--Instanciar objeto query de fechas --%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
      

    <script type="text/javascript">
        $(function () {
       
            $('#txtFecha').timepicker({
             // options here
             });
 });

    </script>


    <asp:Label ID="lblTitulo" runat="server" CssClass="fs-4 fw-bold"></asp:Label>
<div class="mb-3">
    <Label CssClass="form-label" >Nombre Completo</Label>
    <asp:TextBox ID="TextNombreCompleto" runat="server" CssClass="form-control"></asp:TextBox>
</div>
    <div class="mb-3">
        <Label  Class="form-label">Departamento</Label>
        <asp:DropDownList ID="ddDepartamento" runat="server" CssClass="
            "></asp:DropDownList>
    </div>
    <div class="mb-3">
        <Label CssClass="form-label" >Sueldo</Label>
        <asp:TextBox ID="TextSueldo" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    </div>
    <div class="mb-3">
        <Label CssClass="form-label">Fecha de Contrato</Label>
        <asp:TextBox ID="TextFechaContrato" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>

    <asp:Button ID="btnSubmit" runat="server" Text="Enviar" CssClass="btn btn-sm btn-primary" OnClick="btnSubmit_Click" />
    <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx" CssClass="btn btn-sm btn-warning">Volver</asp:LinkButton>

    <div>
        <Label CssClass="form-label">Esto es prueba de calendario</Label>
          <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
    </div>
</asp:Content>
