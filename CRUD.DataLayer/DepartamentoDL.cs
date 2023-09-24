using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CRUD.EntityLayer;
using System.Data.SqlClient;

namespace CRUD.DataLayer
{
    public class DepartamentoDL
    {
        public List<Departamento> Lista()
        {
            List<Departamento> lista = new List<Departamento>();

            using(SqlConnection oConexion=new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM fn_departamentos()",oConexion);
                cmd.CommandType = CommandType.Text;
                try {
                    oConexion.Open();
                    using(SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Departamento
                            {
                                IdDepartamento = Convert.ToInt32(dr["IdDepartamento"].ToString()),
                                Nombre = dr["Nombre"].ToString(),
                                estado = dr["estado"].ToString()
                            }) ;
                        }
                    }

                    return lista;

                } catch (Exception ex){
                    throw ex;
                }
            }
        }
    }
}
