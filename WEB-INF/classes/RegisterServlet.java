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
			String role = request.getParameter("addForma");

			//save values in database
			int res = stat.executeUpdate("insert into users(name, username, password, role) VALUES (\"" + name + "\", \"" + username + "\", \"" + password + "\", \"" + role + "\");");

			//!!!!!!---------   DEBUGGING - Creating a JSP with all registered users example !!!!!!---------


			ResultSet res2 = stat.executeQuery("SELECT * FROM users ORDER BY userID DESC LIMIT 1");
			Vector<User> userList = new Vector<User>();

			while( res2.next() ){
				User aux = new User(Long.parseLong( res2.getString("userId") ), res2.getString("name"), res2.getString("username"), res2.getString("password"), res2.getString("role"));
				userList.add(aux);
			}

			stat.close();
			con.close();

			// //------User register ENDS------

			// //------JSP call forward BEGINS------

			request.setAttribute("userList",userList);
			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/viewAlex.jsp");

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
