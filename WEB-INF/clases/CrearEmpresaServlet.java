import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.annotation.WebServlet;

@WebServlet("/CrearEmpresaServlet")
public class CrearEmpresaServlet extends HttpServlet{

	public void init(ServletConfig config){
		try{
			super.init(config);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){

		try{
			String nombre = request.getParameter("addName");
			String contacto = request.getParameter("addContacto");
			String forma = request.getParameter("addForma");

			response.setContentType("text/html");
			PrintWriter pw = response.getWriter();

			request.setAttribute("response", nombre);
			request.setAttribute("response", contacto);
			request.setAttribute("response", forma);

			RequestDispatcher dispatcher= getServletContext().getRequestDispatcher("/showPruebas.jsp");

			if(dispatcher!=null){
				dispatcher.forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}