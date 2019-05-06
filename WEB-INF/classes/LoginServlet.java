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
				User aux = new User(Long.valueOf(res.getString("userID")), res.getString("name"), res.getString("username"), res.getString("password"), res.getString("role"));
				userList.add(aux);
			}

			//compare users with info submitted by login action

			boolean loginSuccess = false;
			for(int i = 0; i<userList.size(); i++){
				if(username.equals(userList.get(i).getUsername())){
					//username exists in database
					if(password.equals(userList.get(i).getPassword())){
						//user & password combination found in mySQL table

						//prepare Vector to create initial .jsp page

						ResultSet clientContents = stat.executeQuery("SELECT * from client join users on id_User=userID;");
						Vector<Client> clientList = new Vector<Client>();
						Vector<String> usernameList = new Vector<String>();

						while(clientContents.next()){
							Client aux = new Client(Long.valueOf(clientContents.getString("CompanyID")), clientContents.getString("name"), clientContents.getString("contact"), Long.valueOf(clientContents.getString("id_User")));
							clientList.add(aux);
							String responsibleUsername = clientContents.getString("username");
							usernameList.add(responsibleUsername);
						}
						clientList.trimToSize();
						usernameList.trimToSize();

						if(clientList.size() > 3){
							Vector<Client> alterclientList = new Vector<Client>();
							Vector<String> alterusernameList = new Vector<String>();
							for(int j=3; j>0; j--){
								alterclientList.add(clientList.get(clientList.size()-j));
								alterusernameList.add(usernameList.get(usernameList.size()-j));
							}
							request.setAttribute("clientList",alterclientList);
							request.setAttribute("usernameList",alterusernameList);
						}
						else{
							request.setAttribute("clientList",clientList);
							request.setAttribute("usernameList",usernameList);
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

						if(trialList.size() > 3){
							Vector<Trial> altertrialList = new Vector<Trial>();
							Vector<String> alterclientNamesList = new Vector<String>();
							for(int j=3; j>0; j--){
								altertrialList.add(trialList.get(trialList.size()-j));
								alterclientNamesList.add(clientNamesList.get(clientNamesList.size()-j));
							}
							request.setAttribute("trialList",altertrialList);
							request.setAttribute("clientNamesList",alterclientNamesList);
						}
						else{
							request.setAttribute("trialList",trialList);
							request.setAttribute("clientNamesList",clientNamesList);
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

						if(employeeList.size() > 3){
							Vector<Employee> alteremployeeList = new Vector<Employee>();
							Vector<String> altertrialList2 = new Vector<String>();
							Vector<String> alterclientNamesList2 = new Vector<String>();
							for(int j=3; j>0; j--){
								alteremployeeList.add(employeeList.get(employeeList.size()-j));
								altertrialList2.add(trialList2.get(trialList2.size()-j));
								alterclientNamesList2.add(clientNamesList2.get(clientNamesList2.size()-j));
							}
							request.setAttribute("employeeList",alteremployeeList);
							request.setAttribute("trialList2",altertrialList2);
							request.setAttribute("clientNamesList2",alterclientNamesList2);
						}
						else{
							request.setAttribute("employeeList",employeeList);
							request.setAttribute("trialList2",trialList2);
							request.setAttribute("clientNamesList2",clientNamesList2);
						}

						ResultSet lawsuitContents = stat.executeQuery("select * from lawsuit join trial on trial_id = TrialId;");
						Vector<LawsuitQuery> lawsuitList = new Vector<LawsuitQuery>();

						while(lawsuitContents.next()){
							LawsuitQuery aux = new LawsuitQuery(Long.valueOf(lawsuitContents.getString("LawsuitID")), lawsuitContents.getString("name"), lawsuitContents.getString("affair"), lawsuitContents.getString("address"), Long.valueOf(lawsuitContents.getString("trial_id")), lawsuitContents.getString("location"));
							lawsuitList.add(aux);
						}

						if(lawsuitList.size() > 3){
							Vector<LawsuitQuery> alterlawsuitList = new Vector<LawsuitQuery>();
							for(int j=3; j>0; j--){
								alterlawsuitList.add(lawsuitList.get(lawsuitList.size()-j));
							}
							request.setAttribute("lawsuitList", alterlawsuitList);
						}
						else{
							request.setAttribute("lawsuitList", lawsuitList);
						}

						ResultSet fileContents = stat.executeQuery("select * from file join lawsuit on lawsuit_id = LawsuitId;");
						Vector<FileQuery> fileList = new Vector<FileQuery>();

						while(fileContents.next()){
							FileQuery aux = new FileQuery(Long.valueOf(fileContents.getString("idFile")), fileContents.getString("name"), fileContents.getString("creation_date"), Long.valueOf(fileContents.getString("lawsuit_id")), fileContents.getString("Lawsuit.name"));
							fileList.add(aux);
						}
						if(fileList.size() > 3){
							Vector<FileQuery> alterfileList = new Vector<FileQuery>();
							for(int j=3; j>0; j--){
								alterfileList.add(fileList.get(fileList.size()-j));
							}
							request.setAttribute("fileList", alterfileList);
						}
						else{
							request.setAttribute("fileList", fileList);
						}

						if(userList.get(i).getRole().equals("Super Empleado")){
							//Super Empleado Login
							loginSuccess = true;
							RequestDispatcher disp = getServletContext().getRequestDispatcher("/admins.jsp");
							if(disp!=null){
								disp.forward(request,response);
							}
						}
						else if(userList.get(i).getRole().equals("Empleado")){
							//Empleado regular Login
							loginSuccess = true;
							RequestDispatcher disp = getServletContext().getRequestDispatcher("/empleados.jsp");
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
