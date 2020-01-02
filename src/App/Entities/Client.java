package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
public class Client implements Serializable {

    // attributs
    private Long idClient;
    private String nom;
    private String prenom;
    private String civil;
    private String email;
    private String password;
    private String adresse;
    private String pays;
    private String ville;
    private int zipcode;
    private List<Order> orderList;


    // relationships
    @OneToMany(mappedBy = "client")
    public List<Order> getOrderList() {
        return orderList;
    }
    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    // constructors
    public  Client(){}
    public Client(String nom, String prenom, String gender, String mail, String pwd, String address, String pays, String city, int zipcode) {
        this.nom = nom;
        this.prenom = prenom;
        this.civil = gender;
        this.email = mail;
        this.password = pwd;
        this.adresse = address;
        this.pays = pays;
        this.ville = city;
        this.zipcode = zipcode;
    }
    public Client(Long idClient, String nom, String prenom, String civil, String email, String password, String adresse, String pays, String ville, int zipcode) {
        this(nom,prenom,civil,email,password,adresse,pays,ville,zipcode);
        this.idClient = idClient;
    }

    // getter and setters
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id_client")
    public Long getIdClient() {
        return idClient;
    }

    public void setIdClient(Long idClient) {
        this.idClient = idClient;
    }

    @Column(name = "nom")
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Column(name = "prenom")
    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Column(name = "civil")
    public String getCivil() {
        return civil;
    }

    public void setCivil(String civil) {
        this.civil = civil;
    }

    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "adresse")
    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    @Column(name = "pays")
    public String getPays() {
        return pays;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    @Column(name = "ville")
    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    @Column(name = "zipcode")
    public int getZipcode() {
        return zipcode;
    }

    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    // functions
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Client client = (Client) o;
        return idClient == client.idClient &&
                zipcode == client.zipcode &&
                Objects.equals(nom, client.nom) &&
                Objects.equals(prenom, client.prenom) &&
                Objects.equals(civil, client.civil) &&
                Objects.equals(email, client.email) &&
                Objects.equals(password, client.password) &&
                Objects.equals(adresse, client.adresse) &&
                Objects.equals(pays, client.pays) &&
                Objects.equals(ville, client.ville);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idClient, nom, prenom, civil, email, password, adresse, pays, ville, zipcode, orderList);
    }
}
