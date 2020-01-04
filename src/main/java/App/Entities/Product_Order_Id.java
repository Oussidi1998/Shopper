package App.Entities;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class Product_Order_Id implements Serializable {

    @Column(name = "id_produit")
    private Long idProduct;
    @Column(name = "id_command")
    private Long idCommand;

    public Product_Order_Id(){}

    public Product_Order_Id(Long idProduit, Long idCommand) {
        this.idProduct = idProduit;
        this.idCommand = idCommand;
    }

    public Long getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Long idProduit) {
        this.idProduct = idProduit;
    }

    public Long getIdCommand() {
        return idCommand;
    }

    public void setIdCommand(Long idCommand) {
        this.idCommand = idCommand;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product_Order_Id that = (Product_Order_Id) o;
        return Objects.equals(idProduct, that.idProduct) &&
                Objects.equals(idCommand, that.idCommand);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduct, idCommand);
    }
}
