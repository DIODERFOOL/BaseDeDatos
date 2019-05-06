import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AdminRefresh")
public class RefreshServlet extends HttpServlet{

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

			//------Connection to mySQL setup ENDS----------

			ResultSet clientContents = stat.executeQuery("SELECT * from client join users on id_User=userID;");
			Vector<Client> clientList = new Vector<Client>();
			Vector<String> usernameList = new Vector<String>();

			while(clientContents.next()){
				Client aux = new Client(Long.valueOf(clientContents.getString("CompanyID")), clientContents.getString("name"), clientContents.getString("contact"), Long.valueOf(clientContents.getString("id_User")));
				clientList.add(aux);
				String responsibleUsername = clientContents.getString("username");
				usernameList.add(responsibleUsername);
			}

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

			ResultSet employeeContents = stat.executeQuery("select * from employee, trial, client where idTrial = TrialId and idClient = CompanyId;");
			Vector<Employee> employeeList = new Vector<Employee>();
			Vector<String> trialList2 = new Vector<String>();
			Vector<String> clientNamesList2 = new Vector<String>();

			while(employeeContents.next()){

				//Date format correction
				String reformatDate = employeeContents.getString("admission_date");
				//2018-mm-dd -> dd-mm-2018
				String day = reformatDate.substring(8);
				String month = reformatDate.substring(5,7);
				String year =  reformatDate.substring(0,4);
				reformatDate = day + "/" + month + "/" + year;
				//Date format correction ends

				Employee aux = new Employee(Long.valueOf(employeeContents.getString("Employee_Id")), reformatDate, employeeContents.getString("company_role"), employeeContents.getString("name"), Double.valueOf(employeeContents.getString("salary")), Long.valueOf(employeeContents.getString("idTrial")), employeeContents.getString("contractCode"), Double.valueOf(employeeContents.getString("settlement")), Long.valueOf(employeeContents.getString("company_id")));
				employeeList.add(aux);
				String trialDate = employeeContents.getString("trialDate");
				trialList2.add(trialDate);
				String clientName2 = employeeContents.getString("client.name");
				clientNamesList2.add(clientName2);
			}

			ResultSet lawsuitContents = stat.executeQuery("select * from lawsuit join trial on trial_id = TrialId;");
			Vector<LawsuitQuery> lawsuitList = new Vector<LawsuitQuery>();

			while(lawsuitContents.next()){
				LawsuitQuery aux = new LawsuitQuery(Long.valueOf(lawsuitContents.getString("LawsuitID")), lawsuitContents.getString("name"), lawsuitContents.getString("affair"), lawsuitContents.getString("address"), Long.valueOf(lawsuitContents.getString("trial_id")), lawsuitContents.getString("location"));
				lawsuitList.add(aux);
			}

			ResultSet fileContents = stat.executeQuery("select * from file join lawsuit on lawsuit_id = LawsuitId;");
			Vector<FileQuery> fileList = new Vector<FileQuery>();

			while(fileContents.next()){
				FileQuery aux = new FileQuery(Long.valueOf(fileContents.getString("idFile")), fileContents.getString("name"), fileContents.getString("creation_date"), Long.valueOf(fileContents.getString("lawsuit_id")), fileContents.getString("Lawsuit.name"));
				fileList.add(aux);
			}

			request.setAttribute("clientList",clientList);
			request.setAttribute("usernameList",usernameList);
			request.setAttribute("trialList",trialList);
			request.setAttribute("clientNamesList",clientNamesList);
			request.setAttribute("employeeList",employeeList);
			request.setAttribute("trialList2",trialList2);
			request.setAttribute("clientNamesList2",clientNamesList2);
			request.setAttribute("lawsuitList", lawsuitList);
			request.setAttribute("fileList", fileList);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/admins.jsp");
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
