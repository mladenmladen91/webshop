
package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class OrderList {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private int id;


private String name;
private double price;



@ManyToOne(targetEntity = OrderDetails.class)
private OrderDetails orderdetails;

    public OrderDetails getOrderdetails() {
        return orderdetails;
    }

    public void setOrderdetails(OrderDetails orderdetails) {
        this.orderdetails = orderdetails;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

  
    
}
