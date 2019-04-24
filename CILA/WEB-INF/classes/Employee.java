public class Employee{
	private String admissionDate;
	private String companyRole;
	private String name;
	private String salary; //to be double
	private String contractCode;
	private String settlement; //to be double
	//companyID || trialID

	public Employee(String name, String salary, String settlement, String admissionDate, String contractCode, String companyRole){
		this.name = name;
		this.salary = salary;
		this.settlement = settlement;
		this.admissionDate = admissionDate;
		this.contractCode = contractCode;
		this.companyRole = companyRole;
	}

	public void setDate(String admissionDate){
		this.admissionDate = admissionDate;
	}

	public String getDate(){
		return admissionDate;
	}

	public void setCompanyRole(){
		this.companyRole = companyRole;
	}

	public String getCompanyRole(){
		return companyRole;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setSalary(String salary){
		this.salary = salary;
	}

	public String getSalaty(){
		return salary;
	}

	public void setContractCode(String contractCode){
		this.contractCode = contractCode;
	}

	public String getContractCode(){
		return contractCode;
	}

	public void setSettlement(String settlement){
		this.settlement = settlement;
	}

	public String getSettlement(){
		return settlement;
	}



}