//import sql library
import java.sql.*;

public class DBConnection{
	public static void main(String[] args) {
		//Always inside a Try & Catch
		try{
			//Connecting 
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/proyect";
            Connection con = DriverManager.getConnection(url,"root", "ThetaOmegaSigma1234!");
            //Create statement
            Statement stat = con.createStatement();

            //INSERT INTO [table] ([column], [column]) VALUES ('[value]', [value]');	
            //stat.executeUpdate("INSERT INTO user ();");

            /*ResultSet res = stat.executeQuery("SELECT * FROM empresa;");
            while(res.next()){
                String nombre = res.getString("nombre");
                Sting tipo = res.getString(2);
                System.out.println(nombre + "   -   " + tipo);
            }*/


			//Close connection
            stat.close();
            con.close();

		}
		catch(Exception e){
            e.printStackTrace();
        }
	}
}