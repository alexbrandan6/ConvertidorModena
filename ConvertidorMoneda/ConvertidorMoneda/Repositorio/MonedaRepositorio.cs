using ConvertidorMoneda.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ConvertidorMoneda.Repositorio
{
    public class MonedaRepositorio
    {
        public DataSet ObtenerMonedaPorMoneda(Moneda moneda)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosObtenerMonedaPorMoneda(ref datos, moneda);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Obtener_MonedaPorMoneda");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosObtenerMonedaPorMoneda(ref SqlCommand datos, Moneda moneda)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idMonedaDesde", SqlDbType.Int);
            SqlParametros.Value = moneda.getIdMonedaDesde();

            SqlParametros = datos.Parameters.Add("@idMonedaA", SqlDbType.Int);
            SqlParametros.Value = moneda.getIdMonedaA();
        }
    }
}