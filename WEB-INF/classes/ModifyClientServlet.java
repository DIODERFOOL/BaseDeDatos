import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ModifyClient")
public class ModifyClientServlet extends HttpServlet{

	public void init(ServletConfig config){
		try{
			super.init(config);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		updateAdmin(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		updateAdmin(request, response);
	}

	public void updateAdmin(HttpServletRequest request, HttpServletResponse response){

		try{

			// Client client = new Client(client.getCompanyID(),client.getName(),client.getContact(),client.getId_User());

			//------Connection to mySQL setup STARTS-------
			//credentials
			String dbbase = getServletContext().getInitParameter("base");
			String dbusuario = getServletContext().getInitParameter("usuario");
			String dbpassword = getServletContext().getInitParameter("pass");
			Class.forName("com.mysql.jdbc.Driver");

			//general setup - driver setup, connection, statement setup
			String url = "jdbc:mysql://localhost/"+dbbase+"?useSSL=false&allowPublicKeyRetrieval=true";
			Connection con = DriverManager.getConnection(url,dbusuario,dbpassword);
			Statement stat = con.createStatement();

			String id = request.getParameter("idToModify");
			String name = request.getParameter("nameToModify");
			// if(request.getParameter("contactToModify")!=null){
				String contact = request.getParameter("contactToModify");
			// }else{
			// 	String contact = client.getContact();
			// }
			// String perro = "4";

			int res = stat.executeUpdate("update client set name = \"" + name + "\" , contact = \"" + contact + "\" where CompanyId = " + id);



			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/ShowClients");

			if(disp!=null){
				disp.forward(request,response);
			}
			//------JSP call forward ENDS ------


			//!!!!!!---------   DEBUGGING FINISHES - Creating a JSP with all registered users example !!!!!!---------

			// response.sendRedirect("./index.html?userRegister=1");

		}
		catch(Exception e){
			e.printStackTrace();
			try{
    		RequestDispatcher disp =  getServletContext().getRequestDispatcher("/error.jsp");
        	if(disp!=null){
          	disp.forward(request,response);
          }
        } catch(Exception e2){

				}
		}
	}
}
