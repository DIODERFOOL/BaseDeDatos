import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Vector;
import javax.servlet.annotation.WebServlet;

@WebServlet("/EmployeeRefresh")
public class RefreshEmpServlet extends HttpServlet{

	public void init(ServletConfig config){
		try{
			super.init(config);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		updateEmployee(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		updateEmployee(request, response);
	}

	public void updateEmployee(HttpServletRequest request, HttpServletResponse response){

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

			request.setAttribute("clientList",clientList);
			request.setAttribute("usernameList",usernameList);
			request.setAttribute("trialList",trialList);
			request.setAttribute("clientNamesList",clientNamesList);
			request.setAttribute("employeeList",employeeList);
			request.setAttribute("trialList2",trialList2);
			request.setAttribute("clientNamesList2",clientNamesList2);

			RequestDispatcher disp = getServletContext().getRequestDispatcher("/empleados.jsp");
			if(disp!=null){
				disp.forward(request,response);
			}

			stat.close();
			con.close();

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
