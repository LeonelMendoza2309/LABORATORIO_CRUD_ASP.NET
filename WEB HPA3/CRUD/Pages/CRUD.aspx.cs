using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD.Pages
{
    public partial class CRUD : System.Web.UI.Page
    {
        readonly MySqlConnection con = new MySqlConnection(
            ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        public static string sid = "-1";
        public static string sopc = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    sid = Request.QueryString["id"].ToString();
                    CargarDatos();
                }

                if (Request.QueryString["op"] != null)
                {
                    sopc = Request.QueryString["op"].ToString();

                    switch (sopc)
                    {
                        case "C":
                            this.lblTitulo.Text = "Ingresar nuevo ususario";
                            this.btnCrear.Visible = true;
                            break;

                        case "L":
                            this.lblTitulo.Text = "Consulta de ususario";
                            break;

                        case "A":
                            this.lblTitulo.Text = "Modificar ususario";
                            this.btnActual.Visible = true;
                            break;

                        case "B":
                            this.lblTitulo.Text = "Borrar Usuario";
                            this.btnBorrar.Visible = true;
                            break;
                    }
                }
            }
        }

        void CargarDatos()
        {
            con.Open();

            MySqlDataAdapter da = new MySqlDataAdapter("sp_read", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@p_Id", MySqlDbType.Int32).Value = sid;

            DataSet ds = new DataSet();
            ds.Clear();

            da.Fill(ds);

            DataTable dt = ds.Tables[0];
            DataRow row = dt.Rows[0];

            tbNombre.Text = row[1].ToString();
            tbEdad.Text = row[2].ToString();
            tbEmail.Text = row[3].ToString();

            DateTime d = (DateTime)row[4];
            tbFechana.Text = d.ToString("yyyy-MM-dd");

            con.Close();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            DateTime fecha;

            if (!DateTime.TryParseExact(
                tbFechana.Text,
                "yyyy-MM-dd",
                System.Globalization.CultureInfo.InvariantCulture,
                System.Globalization.DateTimeStyles.None,
                out fecha))
            {
                Response.Write("La fecha ingresada no es válida.");
                return;
            }

            MySqlCommand cmd = new MySqlCommand("sp_create", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@p_Nombre", MySqlDbType.VarChar).Value = tbNombre.Text;
            cmd.Parameters.Add("@p_Edad", MySqlDbType.Int32).Value = Convert.ToInt32(tbEdad.Text);
            cmd.Parameters.Add("@p_Correo", MySqlDbType.VarChar).Value = tbEmail.Text;
            cmd.Parameters.Add("@p_Fecha", MySqlDbType.Date).Value = fecha;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Index.aspx");
        }

        protected void btnActual_Click(object sender, EventArgs e)
        {
            DateTime fecha;

            if (!DateTime.TryParseExact(
                tbFechana.Text,
                "yyyy-MM-dd",
                System.Globalization.CultureInfo.InvariantCulture,
                System.Globalization.DateTimeStyles.None,
                out fecha))
            {
                Response.Write("La fecha ingresada no es válida.");
                return;
            }

            MySqlCommand cmd = new MySqlCommand("sp_update", con);

            con.Open();

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@p_Id_Usuario", MySqlDbType.Int32).Value = Convert.ToInt32(sid);
            cmd.Parameters.Add("@p_Nombre", MySqlDbType.VarChar).Value = tbNombre.Text;
            cmd.Parameters.Add("@p_Edad", MySqlDbType.Int32).Value = Convert.ToInt32(tbEdad.Text);
            cmd.Parameters.Add("@p_Correo", MySqlDbType.VarChar).Value = tbEmail.Text;
            cmd.Parameters.Add("@p_Fecha_Nacimiento", MySqlDbType.Date).Value = fecha;

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("Index.aspx");
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            MySqlCommand cmd = new MySqlCommand("sp_delete", con);

            con.Open();

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@p_Id_Usuario", MySqlDbType.Int32).Value = Convert.ToInt32(sid);

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("Index.aspx");
        }
    }
}