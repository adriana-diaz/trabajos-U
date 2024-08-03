using prueba.Modelos.Request;
using prueba.Modelos.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq;
using prueba.AccesoDatos;
using prueba.Modelos.Entidades;

namespace prueba.Logica
{
    public class LogProyecto
    {
        public ResInsertarUsuario insertarUsuario(ReqInsertarUsuario req)
        {
            ResInsertarUsuario res = new ResInsertarUsuario();

            try 
            {
                if (req == null)
                {
                    res.resultado = false;
                    res.error = "Bad request";
                }
                else
                {
                    if (req.usuario.id_usuario == 0)
                    {
                        res.resultado = false;
                        res.error = "Usuario Incorrecto";
                    }
                    else if (String.IsNullOrEmpty(req.usuario.nombre))
                    {
                        res.resultado = false;
                        res.error = "Nombre Incorrecto";

                    }
                    else if (String.IsNullOrEmpty(req.usuario.email))
                    {
                        res.resultado = false;
                        res.error = "Email Incorrecto";
                    }
                    else if (String.IsNullOrEmpty(req.usuario.password))
                    {
                        res.resultado = false;
                        res.error = "Password Incorrecto";
                    }
                    else
                    {
                        int? returnId = 0;
                        int? errorId = 0;
                        string errorDescripcion = "";

                        ConexionLINQDataContext miLinq = new ConexionLINQDataContext();
                        miLinq.SP_INGRESAR_USUARIO(req.usuario.id_usuario, req.usuario.nombre, req.usuario.email, req.usuario.password, ref returnId, ref errorId, ref errorDescripcion);
                        if (returnId <= 0 || returnId == null)
                        {

                            res.resultado = false;
                            res.error = errorDescripcion;
                        }
                        else
                        {
                            //todo paso bien

                            res.resultado = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.error = "500- Error Interno";
            }

            return res;
        }

        public ResLogin entrarlogin(ReqLogin req)
        {
            ResLogin res = new ResLogin();

            try
            {
                if (req == null)
                {
                    res.resultado = false;
                    res.error = "Bad request";
                }
                else
                {
                    if (String.IsNullOrEmpty(req.login.email))
                    {
                        res.resultado = false;
                        res.error = "Correo Incorrecto";
                    }
                    else if (String.IsNullOrEmpty(req.login.password))
                    {
                        res.resultado = false;
                        res.error = "Password Incorrecto";

                    }
                    else
                    {
                        string apellidos = "";
                        string nombre = "";
                        int? estado = 0;
                        int? id_usuario = 0;
                        int? returnId = 0;
                        int? errorId = 0;
                        string errorDescripcion = "";
                        long? sesion_id = 0;
                        

                        ConexionLINQDataContext miLinq = new ConexionLINQDataContext();
                        miLinq.SP_LOGIN_USUARIO(req.login.email,req.login.password,ref sesion_id, ref errorId, ref errorDescripcion);
                        if (returnId <= 0 || returnId == null)
                            //{

                            //    res.resultado = false;
                            //    res.error = errorDescripcion;
                            //}
                            //else
                            //{
                            //    //todo paso bien

                            res.resultado = true;
                        //}
                    }
                }
            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.error = "500- Error Interno";
            }

            return res;
        }


        public ResSalirLogin salirlogin(ReqSalirLogin req)
        {
            ResSalirLogin res = new ResSalirLogin();

            try
            {
                if (req == null)
                {
                    res.resultado = false;
                    res.error = "Bad request";
                }
                else
                {
                    if (String.IsNullOrEmpty(req.sesion.sesion))
                    {
                        res.resultado = false;
                        res.error = "Sesion Incorrecta";
                    }
                    else
                    {

                        conexionLinqDataContext miLinq = new conexionLinqDataContext();
                        miLinq.SP_CERRAR_SESION(req.sesion.sesion);
                        //todo paso bien

                        res.resultado = true;

                    }
                }
            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.error = "500- Error Interno";
            }

            return res;
        }


        public ResAgregarProducto AgregarUsuario(ReqAgregarProducto req)
        {
            ResAgregarProducto res = new ResAgregarProducto();

            try
            {
                if (req == null)
                {
                    res.resultado = false;
                    res.error = "Bad request";
                }
                else
                {
                    if (String.IsNullOrEmpty(req.producto.nombre))
                    {
                        res.resultado = false;
                        res.error = "Nombre Incorrecto";

                    }
                    else if (String.IsNullOrEmpty(req.producto.descripcion))
                    {
                        res.resultado = false;
                        res.error = "Descripcion Incorrecta";
                    }
                    if (req.producto.precio == 0)
                    {
                        res.resultado = false;
                        res.error = "Precio Incorrecto";
                    }
                    else if (String.IsNullOrEmpty(req.producto.nombre_categoria))
                    {
                        res.resultado = false;
                        res.error = "Categoria Incorrecta";
                    }

                    else
                    {
                        int? returnId = 0;
                        int? errorId = 0;
                        string errorDescripcion = "";

                        ConexionLINQDataContext miLinq = new ConexionLINQDataContext();
                        miLinq.SP_INGRESAR_USUARIO(req.usuario.id_usuario, req.usuario.nombre, req.usuario.email, req.usuario.password, ref returnId, ref errorId, ref errorDescripcion);
                        if (returnId <= 0 || returnId == null)
                        {

                            res.resultado = false;
                            res.error = errorDescripcion;
                        }
                        else
                        {
                            //todo paso bien

                            res.resultado = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.error = "500- Error Interno";
            }

            return res;
        }

    }
}

