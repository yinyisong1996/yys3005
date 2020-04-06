package yys3005.entity;

public class Author {

    private String auther_id;
    private String auther_name;
    private String bank_card;
    private Integer gener;
    private String address;
    private Double money;


    @Override
    public String toString() {
        return "Author{" +
                "auther_id=" + auther_id +
                ", auther_name='" + auther_name + '\'' +
                ", bank_card='" + bank_card + '\'' +
                ", gener=" + gener +
                ", address='" + address + '\'' +
                ", money=" + money +
                '}';
    }


    public String getAuther_id() {
        return auther_id;
    }

    public void setAuther_id(String auther_id) {
        this.auther_id = auther_id;
    }

    public String getAuther_name() {
        return auther_name;
    }

    public void setAuther_name(String auther_name) {
        this.auther_name = auther_name;
    }

    public String getBank_card() {
        return bank_card;
    }

    public void setBank_card(String bank_card) {
        this.bank_card = bank_card;
    }

    public Integer getGener() {
        return gener;
    }

    public void setGener(Integer gener) {
        this.gener = gener;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}
