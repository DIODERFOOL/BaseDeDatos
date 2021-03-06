import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;
import java.util.Random;

@WebServlet("/RegisterFile")
public class NewFileServlet extends HttpServlet{

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

			//retrieve values from register's forms
			String name = request.getParameter("addName");
			String date = request.getParameter("addContacto");
			String lawsuitName = request.getParameter("fkLawsuit");
			lawsuitName = lawsuitName.substring(1, lawsuitName.length()-1);
			ResultSet resfk = stat.executeQuery("select lawsuitId from lawsuit where name = \"" + lawsuitName + "\";");
			int fkey = 1;
			resfk.next();
			fkey = Integer.valueOf(resfk.getString("lawsuitID"));

			//save values in database
			int res = stat.executeUpdate("insert into file(name, creation_date, lawsuit_id) VALUES (\"" + name + "\", \"" + date + "\", \"" + fkey + "\");");
			ResultSet res2 = stat.executeQuery("SELECT * FROM file ORDER BY idFile DESC LIMIT 1;");
			Vector<File> fileList = new Vector<File>();

			while(res2.next()){
				//Corregir formato de la fecha para impresión en el jsp
				String reformatDate = res2.getString("creation_date");
				//2018-mm-dd -> dd-mm-2018
				String day = reformatDate.substring(8);
				String month = reformatDate.substring(5,7);
				String year =  reformatDate.substring(0,4);
				reformatDate = day + "/" + month + "/" + year;
				File aux = new File(res2.getString("name"), reformatDate);
				fileList.add(aux);
			}

			stat.close();
			con.close();

			//------File creation ENDS------

			//------JSP call forward BEGINS------

			request.setAttribute("fileList",fileList);



			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/confirmacionArchivo.jsp");
			if(disp!=null){
				disp.forward(request,response);
			}
			//------JSP call forward ENDS ------


			//!!!!!!---------   DEBUGGING FINISHES - Creating a JSP with all registered files example !!!!!!---------

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
