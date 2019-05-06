public class FileQuery{

	private long idFile;
	private String name;
	private String creationDate;
	private long lawsuit_id;
	private String lawsuitName;

	public FileQuery(long idFile, String name, String creationDate, long lawsuit_id, String lawsuitName){
		this.idFile = idFile;
		this.name = name;
		this.creationDate = creationDate;
		this.lawsuit_id = lawsuit_id;
		this.lawsuitName = lawsuitName;
	}

	public void setIdFile(long idFile){
		this.idFile = idFile;
	}

	public long getIdFile(){
		return idFile;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setCreationDate(String creationDate){
		this.creationDate = creationDate;
	}

	public String getCreationDate(){
		return creationDate;
	}

	public void setLawsuit_Id(long lawsuit_id){
		this.lawsuit_id = lawsuit_id;
	}

	public long getLawsuit_Id(){
		return lawsuit_id;
	}

	public void setLawsuitName(String lawsuitName){
		this.lawsuitName = lawsuitName;
	}

	public String getLawsuitName(){
		return lawsuitName;
	}
}
