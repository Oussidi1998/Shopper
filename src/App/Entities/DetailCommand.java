package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "detail")
public class DetailCommand implements Serializable {

    // attributs
    @EmbeddedId
    private Produit_Command_Id id;
    private int quantity;
    private int prix;

    // relationships
    @ManyToOne
    @MapsId("idProduit")
    @JoinColumn(name = "produit_id_produit")
    private Produit produit;
    @ManyToOne
    @MapsId("idCommand")
    @JoinColumn(name = "command_id_command")
    private Command command;


    // getter and setters
    @Column(name = "quantity")
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Column(name = "prix")
    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public Produit getProduit() {return produit;}
    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public Command getCommand() {
        return command;
    }
    public void setCommand(Command command) {
        this.command = command;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DetailCommand that = (DetailCommand) o;
        return quantity == that.quantity &&
                prix == that.prix &&
                Objects.equals(id, that.id) &&
                Objects.equals(produit, that.produit) &&
                Objects.equals(command, that.command);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, quantity, prix, produit, command);
    }
}
