package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Entity
public class Command implements Serializable {

    // attributs
    private Long idCommand;
    private Date dateCommand;
    private String adressLivraison;
    private int frais;
    private byte etat;
    private Client client;
    private List<DetailCommand> commandItems=new ArrayList<>() ;

    // constructors
    public Command(Long idCommand, Date dateCommand, String adressLivraison, int frais, byte etat, Client client) {
        this.idCommand = idCommand;
        this.dateCommand = dateCommand;
        this.adressLivraison = adressLivraison;
        this.frais = frais;
        this.etat = etat;
        this.client = client;
    }

    public Command(){}

    // getters and setters
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_command")
    public Long getIdCommand() {
        return idCommand;
    }

    public void setIdCommand(Long idCommand) {
        this.idCommand = idCommand;
    }

    @Column(name = "date_command")
    @Temporal(TemporalType.DATE)
    public Date getDateCommand() {
        return dateCommand;
    }

    public void setDateCommand(Date dateCommand) {
        this.dateCommand = dateCommand;
    }

    @Column(name = "adress_livraison")
    public String getAdressLivraison() {
        return adressLivraison;
    }

    public void setAdressLivraison(String adressLivraison) {
        this.adressLivraison = adressLivraison;
    }

    @Column(name = "frais")
    public int getFrais() {
        return frais;
    }

    public void setFrais(int frais) {
        this.frais = frais;
    }

    @Column(name = "etat")
    public byte getEtat() {
        return etat;
    }

    public void setEtat(byte etat) {
        this.etat = etat;
    }

    // relationships
    @ManyToOne
    public Client getClient() {
        return client;
    }
    public void setClient(Client client) {
        this.client = client;
    }

    @OneToMany(mappedBy = "command")
    public List<DetailCommand> getCommandItems() {
        return commandItems;
    }

    public void setCommandItems(List<DetailCommand> commandItems) {
        commandItems = commandItems;
    }


    // functions
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Command command = (Command) o;
        return idCommand == command.idCommand &&
                frais == command.frais &&
                etat == command.etat &&
                Objects.equals(dateCommand, command.dateCommand) &&
                Objects.equals(adressLivraison, command.adressLivraison);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCommand, dateCommand, adressLivraison, frais, etat, client, commandItems);
    }
}
