using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using CRUD.EntityLayer;
using CRUD.BusinessLayer;
using System.Globalization;

namespace CRUD.WebForm
{
    public partial class Contact : Page
    {
        private static int idEmpleado = 0;
        DepartamentoBL departamentoBL = new DepartamentoBL();
        EmpleadoBL empleadoBL = new EmpleadoBL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["idEmpleado"] != null)
                {
                    idEmpleado = Convert.ToInt32(Request.QueryString["idEmpleado"].ToString());
                    if (idEmpleado != 0)
                    {
                        lblTitulo.Text = "Editar Empleado";
                        btnSubmit.Text = "Actualizar";

                        Empleado empleado = empleadoBL.Obterner(idEmpleado);
                        TextNombreCompleto.Text = empleado.NombreCompleto;
                        CargarDepartamentos(empleado.Departamento.IdDepartamento.ToString()
                            );
                        TextSueldo.Text = empleado.Sueldo.ToString();
                        TextFechaContrato.Text = Convert.ToDateTime(empleado.FechaContrato, new CultureInfo("es-PE")).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        lblTitulo.Text = "Nuevo Empleado";
                        btnSubmit.Text = "Actualizar";
                        CargarDepartamentos();
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

        private void CargarDepartamentos(String idDepartamento="")
        {

            List<Departamento> listaDepartamentos = departamentoBL.Lista();
           
            var departamentosActivos = listaDepartamentos.Where(depto => depto.estado == "Activo").ToList();

            foreach (var departamento in departamentosActivos)
             {
                ddDepartamento.DataTextField = "Nombre";
                ddDepartamento.DataValueField = "idDepartamento";
                ddDepartamento.DataSource = departamentosActivos;
                ddDepartamento.DataBind();
            }
                

            if (idDepartamento != "")
                ddDepartamento.SelectedValue = idDepartamento;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Empleado entidad = new Empleado()
            {
                IdEmpleado = idEmpleado,
                NombreCompleto = TextNombreCompleto.Text,
                Departamento = new Departamento()
                {
                    IdDepartamento = Convert.ToInt32(ddDepartamento.SelectedValue)
                },
                Sueldo = Convert.ToDecimal(TextSueldo.Text, new CultureInfo("es-PE")),
                FechaContrato = TextFechaContrato.Text
            };

            bool respuesta;
            if (idEmpleado != 0)
                respuesta = empleadoBL.Editar(entidad);
            else
                respuesta = empleadoBL.Crear(entidad);
            if (respuesta)
                Response.Redirect("~/Default.aspx");
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scrip", "alert('No se pudo ejecutar la operacion)", true);
        }
    }
}