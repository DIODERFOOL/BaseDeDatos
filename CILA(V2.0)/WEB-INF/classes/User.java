public class User{
	
	private String name;
	private String username;
	private String password;
	private String role;

	public User(String name, String username, String password, String role){
		this.name = name;
		this.username = username;
		this.password = password;
		this.role = role;
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