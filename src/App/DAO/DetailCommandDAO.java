package App.DAO;

import App.Entities.DetailCommand;
import App.Utils.DB;

import javax.persistence.EntityManager;

public class DetailCommandDAO {

    public static DetailCommand insert(DetailCommand d){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.persist(d);
        em.getTransaction().commit();
        return  d;
    }
    public static void delete(DetailCommand d){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.remove(em.merge(d));
        em.getTransaction().commit();
    }
    public static DetailCommand select(Long id){
        EntityManager em = DB.getEM();
        DetailCommand d = em.find(DetailCommand.class,id);
        return  d;
    }
}
