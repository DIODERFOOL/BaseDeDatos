import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CrearEmpleado")
public class CrearEmpleado extends HttpServlet{

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

      ResultSet res2 = stat.executeQuery("SELECT * FROM trial;");
      Vector<Trial> trialList = new Vector<Trial>();

			while(res2.next()){
				//Corregir formato de la fecha para impresión en el jsp
				String reformatDate = res2.getString("trialDate");
				//2018-mm-dd -> dd-mm-2018
				String day = reformatDate.substring(8);
				String month = reformatDate.substring(5,7);
				String year =  reformatDate.substring(0,4);
				reformatDate = day + "/" + month + "/" + year;
				Trial aux = new Trial(Long.valueOf(res2.getString("TrialId")), res2.getString("location"), reformatDate, Long.valueOf(res2.getString("idClient")));
				trialList.add(aux);
			}

      ResultSet res3 = stat.executeQuery("SELECT * FROM client;");
			Vector<Client> clientList = new Vector<Client>();

			while(res3.next()){
				Client aux = new Client(res3.getLong("companyID"),res3.getString("name"), res3.getString("contact"), res3.getLong("id_User"));
				clientList.add(aux);
			}

			stat.close();
			con.close();

			request.setAttribute("trialList",trialList);
      request.setAttribute("clientList",clientList);



			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/registerEmployee.jsp");

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
			}
			catch(Exception e2){
			}
		}
	}
}
