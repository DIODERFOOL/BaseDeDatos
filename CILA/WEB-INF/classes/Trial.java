public class Trial{
	
	private String address;
	private String date;

	public Trial(String address, String date){
		this.address = address;
		this.date = date;
	}

	public void setAddress(String address){
		this.address = address;
	}

	public String getAddress(){
		return address;
	}

	public void setDate(String date){
		this.date = date;
	}

	public String getDate(){
		return date;
	}

}