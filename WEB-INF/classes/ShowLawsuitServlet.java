import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ShowLawsuit")
public class ShowLawsuitServlet extends HttpServlet{

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

			ResultSet lawsuitContents = stat.executeQuery("select * from lawsuit join trial on trial_id = TrialId;");
			Vector<LawsuitQuery> lawsuitList = new Vector<LawsuitQuery>();

			while(lawsuitContents.next()){
				LawsuitQuery aux = new LawsuitQuery(Long.valueOf(lawsuitContents.getString("LawsuitID")), lawsuitContents.getString("name"), lawsuitContents.getString("affair"), lawsuitContents.getString("address"), Long.valueOf(lawsuitContents.getString("trial_id")), lawsuitContents.getString("location"));
				lawsuitList.add(aux);
			}
			request.setAttribute("lawsuitList",lawsuitList);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/verDemanda.jsp");
			if(disp!=null){
				disp.forward(request,response);
			}

			stat.close();
			con.close();

		}
		catch(Exception e){
			e.printStackTrace();
			RequestDispatcher disp =  getServletContext().getRequestDispatcher("/error.jsp");
		}
	}
}
