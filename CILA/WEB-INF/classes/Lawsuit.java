public class Lawsuit {
	private String name;
	private String affair;
	private String adress;
	private int trial_id;

	public Lawsuit(String name, String affair, String adress) {
		this.name = name;
		this.affair = affair;
		this.adress = adress;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setAffair(String affair){
		this.affair = affair;
	}

	public String getAffair(){
		return affair;
	}

	public void setAdress(String name){
		this.adress = adress;
	}

	public String getAdress(){
		return adress;
	}
}