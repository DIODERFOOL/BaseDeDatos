import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ShowTrial")
public class ShowTrialServlet extends HttpServlet{

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

			ResultSet trialContents = stat.executeQuery("select * from trial join client on idClient=CompanyId;");
			Vector<Trial> trialList = new Vector<Trial>();
			Vector<String> clientNamesList = new Vector<String>();

			while(trialContents.next()){

				//Date format correction
				String reformatDate = trialContents.getString("trialDate");
				//2018-mm-dd -> dd-mm-2018
				String day = reformatDate.substring(8);
				String month = reformatDate.substring(5,7);
				String year =  reformatDate.substring(0,4);
				reformatDate = day + "/" + month + "/" + year;
				//Date format correction ends

				Trial aux = new Trial(Long.valueOf(trialContents.getString("TrialID")), trialContents.getString("location"), reformatDate, Long.valueOf(trialContents.getString("idClient")));
				trialList.add(aux);
				String clientName = trialContents.getString("name");
				clientNamesList.add(clientName);
			}

			request.setAttribute("trialList",trialList);
			request.setAttribute("clientNamesList",clientNamesList);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/verJuicio.jsp");
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
