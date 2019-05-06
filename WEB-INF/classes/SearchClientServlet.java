import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/SearchClient")
public class SearchClientServlet extends HttpServlet{

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

// 			String name = request.getParameter("nameForSearch");

// 			int res = stat.executeUpdate("select * from client where name like \"%" + name + "%\";");

// 			//select * from saleslog where status like "%Pending%";




// 			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/ShowClients");

// 			if(disp!=null){
// 				disp.forward(request,response);
// 			}
// 			//------JSP call forward ENDS ------


// 			//!!!!!!---------   DEBUGGING FINISHES - Creating a JSP with all registered users example !!!!!!---------

// 			// response.sendRedirect("./index.html?userRegister=1");

// 		}
// 		catch(Exception e){
// 			e.printStackTrace();
// 		}
// 	}
// }

			String name = request.getParameter("nameForSearch");

			ResultSet clientContentsTwo = stat.executeQuery("SELECT * from client join users on id_User=userID where client.name = \"" + name + "\";");
			Vector<Client> clientListShowTwo = new Vector<Client>();
			Vector<String> usernameListShow = new Vector<String>();

			while(clientContentsTwo.next()){
				Client aux = new Client(Long.valueOf(clientContentsTwo.getString("CompanyID")), clientContentsTwo.getString("name"), clientContentsTwo.getString("contact"), Long.valueOf(clientContentsTwo.getString("id_User")));
				clientListShowTwo.add(aux);
				String responsibleUsername = clientContentsTwo.getString("username");
				usernameListShow.add(responsibleUsername);
			}


			request.setAttribute("clientListShowTwo",clientListShowTwo);
			request.setAttribute("usernameListShow",usernameListShow);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/ShowClients");
			if(disp!=null){
				disp.forward(request,response);
			}

			stat.close();
			con.close();

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}






