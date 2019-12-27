package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
public class Produit implements Serializable {

    // attributs
    private Long idProduit;
    private String label;
    private String description;
    private int prix;
    private  byte[] image;
    private String base64Image;
    private int promo;
    private Category category;
    private List<DetailCommand> listProductInCommands =new ArrayList<>() ;

    // constructors
    public Produit(Long idProduit, String label, String description, int prix, byte[] image, String base64Image, int promo, Category category) {
        this.idProduit = idProduit;
        this.label = label;
        this.description = description;
        this.prix = prix;
        this.image = image;
        this.base64Image = base64Image;
        this.promo = promo;
        this.category = category;
    }

    public Produit(){}

    // getters and setters
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_produit")
    public Long getIdProduit() {
        return idProduit;
    }
    public void setIdProduit(Long idProduit) {
        this.idProduit = idProduit;
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
    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
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
    public int getPromo() {
        return promo;
    }

    public void setPromo(int promo) {
        this.promo = promo;
    }

    // relationships
    @OneToMany(mappedBy = "produit")
    public List<DetailCommand> getCommandItems() {
        return listProductInCommands;
    }
    public void setCommandItems(List<DetailCommand> items) {
        listProductInCommands = items;
    }

    @ManyToOne
    @JoinColumn(name = "id_category")
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
        Produit produit = (Produit) o;
        return idProduit == produit.idProduit &&
                prix == produit.prix &&
                promo == produit.promo &&
                Objects.equals(label, produit.label) &&
                Objects.equals(description, produit.description) &&
                Objects.equals(image, produit.image);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(idProduit, label, description, prix, base64Image, promo, category, listProductInCommands);
        result = 31 * result + Arrays.hashCode(image);
        return result;
    }
}
