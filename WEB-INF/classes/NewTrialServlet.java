import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;
import java.util.Random;

@WebServlet("/CreateTrial")
public class NewTrialServlet extends HttpServlet{

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

			//------Trial creation STARTS------

			//retrieve values from register's forms


			String address = request.getParameter("addAddress");
			String date = request.getParameter("addDate");
			String idClient = request.getParameter("fkUser");

			idClient = idClient.substring(1, idClient.length()-1);
			ResultSet resfk = stat.executeQuery("SELECT CompanyID FROM client WHERE name = \"" + idClient + "\";");
			int fkey = 1;
			resfk.next();
			fkey = Integer.valueOf(resfk.getString("CompanyID"));


			//save values in the database
			int res = stat.executeUpdate("insert into trial(location, trialDate, idClient) VALUES (\"" + address + "\", \"" + date + "\", \"" + fkey + "\");");

			//!!!!!!---------   DEBUGGING - For class presentation only - Creating a JSP with all registered users example !!!!!!---------

			ResultSet res2 = stat.executeQuery("SELECT * FROM trial ORDER BY TrialId DESC LIMIT 1;");
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

			stat.close();
			con.close();

			request.setAttribute("trialList",trialList);
			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/confirmacionJuicio.jsp");

			if(disp!=null){
				disp.forward(request,response);
			}
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
