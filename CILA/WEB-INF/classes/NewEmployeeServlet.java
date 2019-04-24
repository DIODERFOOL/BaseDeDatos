import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/RegisterEmployee")
public class NewEmployeeServlet extends HttpServlet{

	public void init(ServletConfig config){
		try{
			super.init(config);
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{

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

			//------Connection to mySQL setup ENDS----------

			//------User register STARTS------

			//retrieve values from register's forms
			String name = request.getParameter("addName");
			// String username = request.getParameter("addUser");
			// String password = request.getParameter("addPW");
			String salary = request.getParameter("addSalary");
			String settlement = request.getParameter("addSettlement");
			String admissionDate = request.getParameter("addAdmisDate");
			String contractCode = request.getParameter("addContractCode");
			String role = request.getParameter("addForma");

			//save values in database
			int res = stat.executeUpdate("insert into employee(name, salary, settlement, admission_date, contractCode, company_role) VALUES (\"" + name + "\", \"" + salary + "\", \"" + settlement + "\", \"" + admissionDate + "\" , \"" + contractCode + "\" , \"" + role + "\");");

			//!!!!!!---------   DEBUGGING - Creating a JSP with all registered users example !!!!!!---------


			ResultSet res2 = stat.executeQuery("SELECT * FROM employee;");
			Vector<Employee> employeeList = new Vector<Employee>();

			while(res2.next()){
				Employee aux = new Employee(res2.getString("name"), res2.getString("salary"), res2.getString("settlement"), res2.getString("admissionDate"), res2.getString("contractCode"), res2.getString("role"));
				employeeList.add(aux);
			}

			stat.close();
			con.close();

			// //------User register ENDS------

			// //------JSP call forward BEGINS------

			request.setAttribute("employeeList",employeeList);
			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/showRegisteredEmployee.jsp");

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
