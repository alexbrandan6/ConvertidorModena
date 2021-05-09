using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConvertidorMoneda;

namespace ConvertidorMoneda
{
    public partial class Index : System.Web.UI.Page
    {
        AccesoDatos acc = new AccesoDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlMoneda.DataSource = acc.EjecutarScript("SELECT * FROM tblMoneda");
                    ddlMoneda.DataBind();
                }
                catch(Exception ex)
                {

                }
            }
        }

        protected void btnConvertir_Click(object sender, EventArgs e)
        {
            try
            {
                double resultado = double.Parse(txtMonedaIngresada.Text) * double.Parse(ddlMoneda.SelectedValue);
                lblResultado.InnerText = resultado.ToString();
                alertResultado.Visible = true;
            }
            catch(Exception ex)
            {

            }
        }
    }
}