package App.DAO;

import App.Entities.Client;
import App.Utils.DB;
import javax.persistence.EntityManager;

public class ClientDAO {
    public static Client insert(Client c){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
        return  c;
    }
    public static void delete(Client c){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.remove(em.merge(c));
        em.getTransaction().commit();
    }
    public static Client select(Long id){
        EntityManager em = DB.getEM();
        Client c = em.find(Client.class,id);
        return  c;
    }
}
