public class Client{

	private String name;
	private String contact;

	public Client(String name, String contact){
		this.name = name;
		this.contact = contact;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setContact(String contact){
		this.contact = contact;
	}

	public String getContact(){
		return contact;
	}


}