package App.Entities;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class Produit_Command_Id  implements Serializable {

    @Column(name = "id_produit")
    private Long idProduit;
    @Column(name = "id_command")
    private Long idCommand;

    public Produit_Command_Id(){}

    public Produit_Command_Id(Long idProduit, Long idCommand) {
        this.idProduit = idProduit;
        this.idCommand = idCommand;
    }

    public Long getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(Long idProduit) {
        this.idProduit = idProduit;
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
        Produit_Command_Id that = (Produit_Command_Id) o;
        return Objects.equals(idProduit, that.idProduit) &&
                Objects.equals(idCommand, that.idCommand);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduit, idCommand);
    }
}
