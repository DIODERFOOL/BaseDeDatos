NOTES

	String sql = "SELECT * FROM alumno;";
	String carrera = request.getParameter("carrera");
	if(!carrera.equals("")){
		sql = "SELECT * FROM alumno WHERE carrera=\"" + carrera + "\";";
	}
	ResultSet res = stat.executeQuery(sql);