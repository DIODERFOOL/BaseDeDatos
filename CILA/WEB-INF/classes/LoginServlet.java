import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginUser")
public class LoginServlet extends HttpServlet{

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

			//------User login STARTS------

			//retrieve values from register's forms
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			//retrieve all registered users and store them in a vector

			ResultSet res = stat.executeQuery("SELECT * FROM users;");
			Vector<User> userList = new Vector<User>();

			while(res.next()){
				User aux = new User(res.getString("name"), res.getString("username"), res.getString("password"), res.getString("role"));
				userList.add(aux);
			}

			//compare users with info submitted by login action

			boolean loginSuccess = false;
			for(int i = 0; i<userList.size(); i++){
				if(username.equals(userList.get(i).getUsername())){
					//username exists in database
					if(password.equals(userList.get(i).getPassword())){
						//user & password combination found in mySQL table
						if(userList.get(i).getRole().equals("Super Empleado")){
							//Super Empleado Login
							loginSuccess = true;
							RequestDispatcher disp = getServletContext().getRequestDispatcher("/admins.html");
							if(disp!=null){
								disp.forward(request,response);
							}
						}
						else if(userList.get(i).getRole().equals("Empleado")){
							//Empleado regular Login
							loginSuccess = true;
							RequestDispatcher disp = getServletContext().getRequestDispatcher("/empleados.html");
							if(disp!=null){
								disp.forward(request,response);
							}
						}	
					}
				}
			}
			if(!loginSuccess){
				//No username-password combination found in database - Login ERROR
				response.sendRedirect("./index.html?userRegister=2");
			}

			stat.close();
			con.close();

			//------User login ENDS------
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
