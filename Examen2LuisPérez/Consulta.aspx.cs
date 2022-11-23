using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2LuisPérez
{
    public partial class Consulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["SistemaVentasConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select Cajeros.nombre, productos.Nombre, MRegistradoras.Codigo_Maquina from Ventas  inner join Cajeros  on  Cajeros.Codigo_Cajero = Ventas.Cajero inner join productos  on  productos.Codigo_Producto = Ventas.Producto inner join MRegistradoras on MRegistradoras.Codigo_Maquina = Ventas.Maquina "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["SistemaVentasConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" insert into Ventas values  ( " + TCajero.Text + ", " +TMaquina.Text+ ", '" + TProducto.Text + "'  )", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }
    }
    }
