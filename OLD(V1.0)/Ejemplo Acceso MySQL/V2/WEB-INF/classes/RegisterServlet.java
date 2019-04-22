import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/RegisterUser")
public class RegisterServlet extends HttpServlet{

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
			String username = request.getParameter("addUser");
			String password = request.getParameter("addPW");

			//save values in database
			int res = stat.executeUpdate("insert into users(name, username, password) VALUES (\"" + name + "\", \"" + username + "\", \"" + password + "\");");

			//!!!!!!---------   DEBUGGING - Creating a JSP with all registered users example !!!!!!---------


			// ResultSet res2 = stat.executeQuery("SELECT * FROM users;");
			// Vector<User> userList = new Vector<User>();

			// while(res2.next()){
			// 	User aux = new User(res2.getString("name"), res2.getString("username"), res2.getString("password"));
			// 	userList.add(aux);
			// }

			// stat.close();
			// con.close();

			// //------User register ENDS------

			// //------JSP call forward BEGINS------

			// request.setAttribute("userList",userList);
			// RequestDispatcher disp =  getServletContext().getRequestDispatcher("/showRegisteredUsers.jsp");

			// if(disp!=null){
			// 	disp.forward(request,response);
			// }
			//------JSP call forward ENDS ------


			//!!!!!!---------   DEBUGGING FINISHES - Creating a JSP with all registered users example !!!!!!---------

			response.sendRedirect("./index.html?userRegister=1");

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
