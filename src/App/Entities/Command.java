package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
public class Command implements Serializable {
    private Long idCommand;
    private Date dateCommand;
    private int idClient;
    private String adressLivraison;
    private int frais;
    private byte etat;
    private Client client;
    @ManyToOne
    public Client getClient() {
        return client;
    }
    public void setClient(Client client) {
        this.client = client;
    }

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

    @Column(name = "id_client")
    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Command command = (Command) o;
        return idCommand == command.idCommand &&
                idClient == command.idClient &&
                frais == command.frais &&
                etat == command.etat &&
                Objects.equals(dateCommand, command.dateCommand) &&
                Objects.equals(adressLivraison, command.adressLivraison);
    }

}
