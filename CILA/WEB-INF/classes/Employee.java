public class Employee{

    private long employeeID;
    private String admissionDate;
    private String companyRole;
    private String name;
    private double salary;
    private long idTrial;
    private String contractCode;
    private double settlement;
    private long companyID;

    public Employee(long employeeID, String admissionDate, String companyRole, String name, double salary, long idTrial, String contractCode, double settlement, long companyID){
        this.employeeID = employeeID;
        this.admissionDate = admissionDate;
        this.companyRole = companyRole;
        this.name = name;
        this.salary = salary;
        this.idTrial = idTrial;
        this.contractCode = contractCode;
        this.settlement = settlement;
        this.companyID = companyID;
    }

    public void setEmployeeID(long employeeID){
        this.employeeID = employeeID;
    }

    public long getEmployeeID(){
        return employeeID;
    }

    public void setAdmissionDate(String admissionDate){
        this.admissionDate = admissionDate;
    }

    public String getAdmissionDate(){
        return admissionDate;
    }

    public void setCompanyRole(String companyRole){
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

    public void setSalary(double salary){
        this.salary = salary;
    }

    public double getSalary(){
        return salary;
    }

    public void setIdTrial(long idTrial){
        this.idTrial = idTrial;
    }

    public long getIdTrial(){
        return idTrial;
    }

    public void setContractCode(String contractCode){
        this.contractCode = contractCode;
    }

    public String getContractCode(){
        return contractCode;
    }

    public void setSettlement(double settlement){
        this.settlement = settlement;
    }

    public double getSettlement(){
        return settlement;
    }

    public void setCompanyID(long companyID){
        this.companyID = companyID;
    }

    public long getCompanyID(){
        return companyID;
    }

}
