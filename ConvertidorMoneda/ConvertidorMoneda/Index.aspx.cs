using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConvertidorMoneda;
using ConvertidorMoneda.Modelo;
using ConvertidorMoneda.Repositorio;

namespace ConvertidorMoneda
{
    public partial class Index : System.Web.UI.Page
    {
        AccesoDatos acc = new AccesoDatos();
        Moneda moneda = new Moneda();
        MonedaRepositorio monedaRepositorio = new MonedaRepositorio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlMonedaDesde.DataSource = acc.EjecutarScript("SELECT * FROM tblMoneda ORDER BY Descripcion ASC");
                    ddlMonedaDesde.DataBind();

                    ddlMonedaA.DataSource = acc.EjecutarScript("SELECT * FROM tblMoneda ORDER BY Descripcion ASC");
                    ddlMonedaA.DataBind();

                    string stQuery = "SELECT mpm.id, m.Descripcion AS Moneda, mpm.Descripcion AS Descripcion, mpm.idMonedaDesde, mpm.idMonedaA, mpm.Valor " +
                                     "FROM tblMonedaPorMoneda mpm " +
                                     "INNER JOIN " +
                                     "tblMoneda m " +
                                     "ON m.id = mpm.idMonedaDesde " +
                                     "ORDER BY m.Descripcion ASC ";
                    rptMonedaPorMoneda.DataSource = acc.EjecutarScript(stQuery);
                    rptMonedaPorMoneda.DataBind();
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
                moneda.setIdMonedaDesde(int.Parse(ddlMonedaDesde.SelectedValue));
                moneda.setIdMonedaA(int.Parse(ddlMonedaA.SelectedValue));
                DataSet ds = monedaRepositorio.ObtenerMonedaPorMoneda(moneda);
                float valorA = float.Parse(ds.Tables[0].Rows[0][0].ToString());
                float valorDesde = float.Parse(txtMonedaIngresada.Text);

                lblResultado.InnerText = "La conversion es de: " + valorA * valorDesde;
                containerResultado.Visible = true;
            }
            catch(Exception ex)
            {

            }
        }
    }
}