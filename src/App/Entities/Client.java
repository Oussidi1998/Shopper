package App.Entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Arrays;
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
    private String username;
    private String password;
    private String adresse;
    private String pays;
    private String ville;
    private int zipcode;
    private byte[] avatar;
    private List<Command> commandList;

    // relationships
    @OneToMany(mappedBy = "client")
    public List<Command> getCommandList() {
        return commandList;
    }
    public void setCommandList(List<Command> commandList) {
        this.commandList = commandList;
    }

    // constructors
    public  Client(){}
    public Client(Long idClient, String nom, String prenom, String civil, String email, String username, String password, String adresse, String pays, String ville, int zipcode, byte[] avatar) {
        this.idClient = idClient;
        this.nom = nom;
        this.prenom = prenom;
        this.civil = civil;
        this.email = email;
        this.username = username;
        this.password = password;
        this.adresse = adresse;
        this.pays = pays;
        this.ville = ville;
        this.zipcode = zipcode;
        this.avatar = avatar;
    }

    // getter and setters
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
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

    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name = "avatar")
    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
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
                Objects.equals(username, client.username) &&
                Objects.equals(password, client.password) &&
                Objects.equals(adresse, client.adresse) &&
                Objects.equals(pays, client.pays) &&
                Objects.equals(ville, client.ville) &&
                Objects.equals(avatar, client.avatar);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(idClient, nom, prenom, civil, email, username, password, adresse, pays, ville, zipcode, commandList);
        result = 31 * result + Arrays.hashCode(avatar);
        return result;
    }
}
