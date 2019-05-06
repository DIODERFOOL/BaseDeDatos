public class LawsuitQuery{

	private long lawsuitID;
	private String name;
	private String affair;
	private String address;
	private long trial_id;
	private String trialLocation;

	public LawsuitQuery(long lawsuitID, String name, String affair, String address, long trial_id, String trialLocation){
		this.lawsuitID = lawsuitID;
		this.name = name;
		this.affair = affair;
		this.address = address;
		this.trial_id = trial_id;
		this.trialLocation = trialLocation;
	}

	public void setLawsuitID(long lawsuitID){
		this.lawsuitID = lawsuitID;
	}

	public long getLawsuitID(){
		return lawsuitID;
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

	public void setAddress(String address){
		this.address = address;
	}

	public String getAddress(){
		return address;
	}

	public void setTrial_id(long trial_id){
		this.trial_id = trial_id;
	}

	public long getTrial_id(){
		return trial_id;
	}

	public void setTrialLocation(String trialLocation){
		this.trialLocation = trialLocation;
	}

	public String getTrialLocation(){
		return trialLocation;
	}
}
