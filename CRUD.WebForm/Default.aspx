<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD.WebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-12">
          
            <asp:Button runat="server" OnClick="Nuevo_Click" Text="Nuevo" CssClass="btn btn-sm btn-success" />
       
        </div>
    </div>

    <div class="row">
        <div class="col-12">
          
            <asp:Button runat="server" OnClick="Nuevo_Click" Text="Nuevo" CssClass="btn btn-sm btn-success" />
       
        </div>
    </div>

    <div class="row">
        <div class="col-12">
          
            <asp:GridView ID="GVEmpleado" runat="server" CssClass="table table-bordered" AutoGenerate="false">
                <Columns>
                    <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre Completo" />
                    <asp:BoundField DataField="Departamento.Nombre" HeaderText="Nombre Completo" />
                    <asp:BoundField DataField="Sueldo" HeaderText="Sueldo" />
                    <asp:BoundField DataField="FechaContrato" HeaderText="Fecha de Contrato" />
                
                <asp:TemplateField>
                   <ItemTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("idEmpleado")%>'
                        Onclick="Editar_Click" CssClass="btb btn-sm btn-primay"
                        >Editar</asp:LinkButton>
                    
                       <asp:LinkButton runat="server" CommandArgument='<%#Eval("idEmpleado")%>'
                        Onclick="Eliminar_Click" CssClass="btb btn-sm btn-danger" OnClientClick="return confirm('Desea eliminar?')"
                        >Eliminar</asp:LinkButton>

                   </ItemTemplate>
                   </asp:TemplateField>
                
                </Columns>

            </asp:GridView>
           
        </div>
    </div>


</asp:Content>
