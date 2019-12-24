package App.DAO;

import App.Entities.Command;
import App.Utils.DB;
import javax.persistence.EntityManager;

public class CommandDAO {
    public static Command insert(Command c){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
        return  c;
    }
    public static void delete(Command c){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.remove(em.merge(c));
        em.getTransaction().commit();
    }
    public static Command select(Long id){
        EntityManager em = DB.getEM();
        Command c = em.find(Command.class,id);
        return  c;
    }
}
