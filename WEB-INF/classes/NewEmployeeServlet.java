import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;
import java.util.Random;

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
			double salary = Double.parseDouble(request.getParameter("addSalary"));
			double settlement = Double.parseDouble(request.getParameter("addSettlement"));
			String admissionDate = request.getParameter("addAdmisDate");
			String contractCode = request.getParameter("addContractCode");
			String role = request.getParameter("addForma");
			String idTRial = request.getParameter("fkTrial");
			String company_id = request.getParameter("fkClient");

			idTRial = idTRial.substring(1, idTRial.length()-1);
			ResultSet resfk1 = stat.executeQuery("SELECT TrialId FROM trial WHERE location = \"" + idTRial + "\";");
			int fkey = 1;
			resfk1.next();
			fkey = Integer.valueOf(resfk1.getString("TrialId"));

			company_id = company_id.substring(1, company_id.length()-1);
			ResultSet resfk = stat.executeQuery("SELECT CompanyID FROM client WHERE name = \"" + company_id + "\";");
			int fkey1 = 1;
			resfk.next();
			fkey1 = Integer.valueOf(resfk.getString("CompanyId"));

			//save values in database
			int res = stat.executeUpdate("insert into employee(name, salary, settlement, admission_date, contractCode, company_role, idTrial, company_id) VALUES (\"" + name + "\", \"" + salary + "\", \"" + settlement + "\", \"" + admissionDate + "\" , \"" + contractCode + "\" , \"" + role + "\",  \"" + fkey + "\",  \"" + fkey1 + "\");");

			//!!!!!!---------   DEBUGGING - Creating a JSP with all registered users example !!!!!!---------


			ResultSet res2 = stat.executeQuery("SELECT * FROM employee ORDER BY Employee_Id DESC LIMIT 1;");
			Vector<Employee> employeeList = new Vector<Employee>();

			while(res2.next()){

				String reformatDate = res2.getString("admission_date");
				//2018-mm-dd -> dd-mm-2018
				String day = reformatDate.substring(8);
				String month = reformatDate.substring(5,7);
				String year =  reformatDate.substring(0,4);
				reformatDate = day + "/" + month + "/" + year;

				Employee aux = new Employee(Long.valueOf(res2.getString("Employee_Id")), reformatDate, res2.getString("company_role"), res2.getString("name"), Double.valueOf(res2.getString("salary")), Long.valueOf(res2.getString("idTrial")), res2.getString("contractCode"), Double.valueOf(res2.getString("settlement")), Long.valueOf(res2.getString("company_id")));
				employeeList.add(aux);
			}

			stat.close();
			con.close();

			// //------User register ENDS------

			// //------JSP call forward BEGINS------

			request.setAttribute("employeeList",employeeList);
			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/confirmacionEmpleado.jsp");

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
