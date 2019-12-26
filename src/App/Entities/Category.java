package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
public class Category implements Serializable {

    // attributs
    private Long idCategory;
    private String category;
    private List<Produit> produitList;


    // relationships
    @OneToMany(mappedBy = "category")
    public List<Produit> getProduitList() {
        return produitList;
    }

    public void setProduitList(List<Produit> produitList) {
        this.produitList = produitList;
    }

    // constructors
    public Category(){}
    public Category(Long idCategory, String category) {
        this.idCategory = idCategory;
        this.category = category;
    }

    // getter and setters
    @Id
    @Column(name = "id_category")
    public Long getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(Long idCategory) {
        this.idCategory = idCategory;
    }

    @Column(name = "category")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    // functions
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category1 = (Category) o;
        return idCategory == category1.idCategory &&
                Objects.equals(category, category1.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCategory, category, produitList);
    }
}
