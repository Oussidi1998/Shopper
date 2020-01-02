package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "t_order")
public class Order implements Serializable {

    // attributs
    private Long idCommand;
    private Date dateCommand;
    private String adressLivraison;
    private double frais;
    private byte etat;
    private Client client;
    private List<OrderDetail> commandItems=new ArrayList<>() ;

    // constructors
    public Order(Date dateCommand, String adressLivraison, double frais, Client client) {
        this.dateCommand = dateCommand;
        this.adressLivraison = adressLivraison;
        this.frais = frais;
        this.etat = 0;
        this.client = client;
    }

    public Order(){}

    // getters and setters
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
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
    public double getFrais() {
        return frais;
    }

    public void setFrais(double frais) {
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
    @JoinColumn(name = "id_client")
    public Client getClient() {
        return client;
    }
    public void setClient(Client client) {
        this.client = client;
    }

    @OneToMany(mappedBy = "order")
    public List<OrderDetail> getCommandItems() {
        return commandItems;
    }

    public void setCommandItems(List<OrderDetail> commandItems) {
        commandItems = commandItems;
    }


    // functions
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return idCommand == order.idCommand &&
                frais == order.frais &&
                etat == order.etat &&
                Objects.equals(dateCommand, order.dateCommand) &&
                Objects.equals(adressLivraison, order.adressLivraison);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCommand, dateCommand, adressLivraison, frais, etat, client, commandItems);
    }
}
