using Backend.AccesoDatos;
using Backend.Logica.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Logica
{
	public class LogUsuario
	{
		public ResIngresarUsuario insertarUsuario(ReqIngresarUsuario req)
		{
			ResIngresarUsuario res = new ResIngresarUsuario();

			try {
				if (String.IsNullOrEmpty(req.usuario.nombre) || String.IsNullOrEmpty(req.usuario.apellidos))
				{
					res.resultado = false;
				}
				else
				{
					conexionlinqDataContext linq = new conexionlinqDataContext();
					linq.SP_INGRESARUSUARIO(req.usuario.nombre, req.usuario.apellidos);
					res.resultado = true;
				}
			}
			catch(Exception ex)
			{
				res.resultado=false;
			}
			return res;

		}
	}
}
