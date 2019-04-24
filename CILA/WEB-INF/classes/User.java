public class User{
	
	private long userID;
	private String name;
	private String username;
	private String password;
	private String role;

	public User(long userID, String name, String username, String password, String role){
		this.userID = userID;
		this.name = name;
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public void setUserID(long userID){
		this.userID = userID;
	}

	public long getUserID(){
		return userID;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setUsername(String username){
		this.username = username;
	}

	public String getUsername(){
		return username;
	}

	public void setPassword(String name){
		this.password = password;
	}

	public String getPassword(){
		return password;
	}

	public void setRole(String role){
		this.role = role;
	}

	public String getRole(){
		return role;
	}


}