public class Client{

    private long companyID;
    private String name;
    private String contact;
    private long id_User;

    public Client(long companyID, String name, String contact, long id_User){
        this.companyID = companyID;
        this.name = name;
        this.contact = contact;
        this.id_User = id_User;
    }

    public void setCompanyID(long companyID){
        this.companyID = companyID;
    }

    public long getCompanyID(){
        return companyID;
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

    public void setId_User(long id_User){
        this.id_User = id_User;
    }

    public long getId_User(){
        return id_User;
    }
}