public class Trial{
	
	private long trialID;
	private String location;
	private String trialDate;
	private long idClient;

	public Trial(long trialID, String location, String trialDate, long idClient){
		this.trialID = trialID;
		this.location = location;
		this.trialDate = trialDate;
		this.idClient = idClient;
	}

	public void setTrialID(long trialID){
		this.trialID = trialID;
	}

	public long getTrialID(){
		return trialID;
	}

	public void setLocation(String location){
		this.location = location;
	}

	public String getLocation(){
		return location;
	}

	public void setTrialDate(String trialDate){
		this.trialDate = trialDate;
	}

	public String getTrialDate(){
		return trialDate;
	}

	public void setIdClient(long idClient){
		this.idClient = idClient;
	}

	public long getIdClient(){
		return idClient;
	}
}