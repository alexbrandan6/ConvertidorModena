using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConvertidorMoneda.Modelo
{
    public class Moneda
    {
        private int id;
        private string Descripcion;
        private int idMonedaDesde;
        private int idMonedaA;
        private float Valor;

        public Moneda() { }
        public Moneda(string Descripcion, int idMonedaDesde, int idMonedaA, float Valor)
        {
            this.Descripcion = Descripcion;
            this.idMonedaDesde = idMonedaDesde;
            this.idMonedaA = idMonedaA;
            this.Valor = Valor;
        }
        public string getDescripcion()
        {
            return this.Descripcion;
        }
        public void setDescripcion(string Descripcion)
        {
            this.Descripcion = Descripcion;
        }
        public int getIdMonedaDesde()
        {
            return this.idMonedaDesde;
        }
        public void setIdMonedaDesde(int idMonedaDesde)
        {
            this.idMonedaDesde = idMonedaDesde;
        }
        public int getIdMonedaA()
        {
            return this.idMonedaA;
        }
        public void setIdMonedaA(int idMonedaA)
        {
            this.idMonedaA = idMonedaA;
        }
        public float getValor()
        {
            return this.Valor;
        }
        public void setValor(float Valor)
        {
            this.Valor = Valor;
        }
    }
}