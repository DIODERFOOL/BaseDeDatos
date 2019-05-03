import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ModifyEmployee")
public class ModifyEmployeeServlet extends HttpServlet{

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
			//Modify Date
			String date = request.getParameter("dateToModify");

			//Date modified
			String role = request.getParameter("roleToModify");
			String salary = request.getParameter("salaryToModify");
			String contract = request.getParameter("contractToModify");
			String settlement = request.getParameter("settlementToModify");	
			// }else{
			// 	String contact = client.getContact();
			// }
			// String perro = "4";

			int res = stat.executeUpdate("update employee set admission_date = \"" + date + "\"  , company_role = \"" + role + "\" , name = \"" + name + "\" , salary = \"" + salary + "\" , contractCode = \"" + contract + "\" , settlement = \"" + settlement + "\" where Employee_Id = " + id);



			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/ShowEmployee");

			if(disp!=null){
				disp.forward(request,response);
			}
			//------JSP call forward ENDS ------


			//!!!!!!---------   DEBUGGING FINISHES - Creating a JSP with all registered users example !!!!!!---------

			// response.sendRedirect("./index.html?userRegister=1");

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}






