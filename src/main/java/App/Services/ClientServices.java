package App.Services;

import App.Entities.Category;
import App.Entities.Client;
import App.Utils.DB;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import java.io.IOException;
import java.util.List;

public class ClientServices {
    private final EntityManager em = DB.getEM();
    public Client login(String mail, String password){
        TypedQuery<Client> query = em.createQuery("select c from Client c where c.email=:mail and c.password=:pwd",Client.class);
        query.setParameter("mail",mail);
        query.setParameter("pwd",password);
        try {
            return query.getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    public Client Register(String nom, String prenom, String mail, String pwd, String gender, String pays, String city, int zipcode, String address) throws IOException {
        Client client = UserAlreadyExist(mail);
        if (client!=null){
            return  null;
        }
        client = new Client(nom,prenom,gender,mail,pwd,address,pays,city,zipcode);

        em.getTransaction().begin();
        em.persist(client);
        em.getTransaction().commit();
        em.close();

        return client;
    }

    private Client UserAlreadyExist(String mail){
        TypedQuery<Client> query = em.createQuery("select c from Client c where c.email=:mail",Client.class);
        query.setParameter("mail",mail);
        try{
            return query.getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    public  Client getClientById(Long id){
        Client cl = em.find(Client.class,id);
        return cl;
    }

    public List<Client> getAllClients() {
        return  (List<Client>) em.createQuery("select c from Client c").getResultList();
    }
}
