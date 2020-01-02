package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
public class OrderDetail implements Serializable {

    // attributs
    @EmbeddedId
    private Product_Order_Id id = new Product_Order_Id();
    private int quantity;
    private double prix;

    public OrderDetail(){}
    public OrderDetail(Product_Order_Id id, int quantity, double prix, Order cmd, Product product) {
        this.id = id;
        this.quantity = quantity;
        this.prix = prix;
        this.order =cmd;
        this.product = product;
    }

    // relationships
    @ManyToOne
    @MapsId("idProduct")
    @JoinColumn(name = "id_produit")
    private Product product;
    @ManyToOne
    @MapsId("idCommand")
    @JoinColumn(name = "id_command")
    private Order order;


    // getter and setters
    public Product_Order_Id getId() {
        return id;
    }

    public void setId(Product_Order_Id id) {
        this.id = id;
    }

    @Column(name = "quantity")
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Column(name = "prix")
    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Product getProduct() {return product;}
    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }
    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderDetail that = (OrderDetail) o;
        return quantity == that.quantity &&
                prix == that.prix &&
                Objects.equals(id, that.id) &&
                Objects.equals(product, that.product) &&
                Objects.equals(order, that.order);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, quantity, prix, product, order);
    }
}
