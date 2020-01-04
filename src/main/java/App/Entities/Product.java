package App.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
public class Product implements Serializable {

    // attributs
    private Long idProduct;
    private String label;
    private String description;
    private double prix;
    private  byte[] image;
    private String base64Image;
    private double promo;
    @JsonIgnore // to break the infinite recursion when serializing items in panier
    private Category category;
    @JsonIgnore // to break the infinite recursion when serializing items in panier
    private List<OrderDetail> listProductInCommands =new ArrayList<>() ;

    // constructors
    public Product(String label, String description, double prix, byte[] image, double promo, Category category) {
        this.label = label;
        this.description = description;
        this.prix = prix;
        this.image = image;
        this.promo = promo;
        this.category = category;
    }

    public Product(){}

    // getters and setters
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_produit")
    public Long getIdProduct() {
        return idProduct;
    }
    public void setIdProduct(Long idProduit) {
        this.idProduct = idProduit;
    }

    @Transient
    public String getBase64Image() {
        base64Image = Base64.getEncoder().encodeToString(this.image);
        return base64Image;
    }

    @Column(name = "label")
    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "prix")
    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    @Lob
    @Column(name = "image")
    @Basic(fetch = FetchType.LAZY)
    public  byte[] getImage() {
        return image;
    }

    public void setImage( byte[] image) {
        this.image = image;
    }

    @Column(name = "promo")
    public double getPromo() {
        return promo;
    }

    public void setPromo(double promo) {
        this.promo = promo;
    }

    // relationships
    @OneToMany(mappedBy = "product")
    @JsonIgnore
    public List<OrderDetail> getCommandItems() {
        return listProductInCommands;
    }
    public void setCommandItems(List<OrderDetail> items) {
        listProductInCommands = items;
    }

    @ManyToOne
    @JoinColumn(name = "id_category")
    @JsonIgnore
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }


    // functions
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return idProduct == product.idProduct &&
                prix == product.prix &&
                promo == product.promo &&
                Objects.equals(label, product.label) &&
                Objects.equals(description, product.description) &&
                Objects.equals(image, product.image);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(idProduct, label, description, prix, base64Image, promo, category, listProductInCommands);
        result = 31 * result + Arrays.hashCode(image);
        return result;
    }
}
