package yys3005.entity;

public class StoreUser {

    private String uid;
    private String uname;
    private String account_name;
    private Integer gener;
    private String phone;
    private String email;
    private String address;

    @Override
    public String toString() {
        return "StoreUser{" +
                "uid='" + uid + '\'' +
                ", uname='" + uname + '\'' +
                ", account_name='" + account_name + '\'' +
                ", gener=" + gener +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public Integer getGener() {
        return gener;
    }

    public void setGener(Integer gener) {
        this.gener = gener;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
