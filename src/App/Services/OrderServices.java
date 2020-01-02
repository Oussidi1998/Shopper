package App.Services;

import App.Entities.Order;
import App.Utils.DB;

import javax.persistence.EntityManager;
import java.util.List;

public class OrderServices {
    public final EntityManager em = DB.getEM();

    public Order creatCommand(Order cmd){
        em.getTransaction().begin();
        em.persist(cmd);
        em.flush();
        em.getTransaction().commit();
        return em.find(Order.class,cmd.getIdCommand());
    }

    public List<Order> getAllOrders() {
        return  (List<Order>) em.createQuery("select o from Order o").getResultList();
    }
}
