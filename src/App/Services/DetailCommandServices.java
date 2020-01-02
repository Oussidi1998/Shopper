package App.Services;

import App.Entities.OrderDetail;
import App.Utils.DB;
import javax.persistence.EntityManager;

public class DetailCommandServices {
    public final EntityManager em = DB.getEM();

    public OrderDetail persistCommandItem(OrderDetail item){

        em.getTransaction().begin();
        em.merge(item);
        em.getTransaction().commit();
        OrderDetail itemCommand = em.find(OrderDetail.class,item.getId());
        return itemCommand;

    }



}
