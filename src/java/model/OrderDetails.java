
package model;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class OrderDetails {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
private String address;
private String contact;

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
    
   @OneToMany(targetEntity = OrderList.class, mappedBy = "orderdetails", fetch = FetchType.EAGER) 
   private List<OrderList>ol;

    public List<OrderList> getOl() {
        return ol;
    }

    public void setOl(List<OrderList> ol) {
        this.ol = ol;
    }

    
}
