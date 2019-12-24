package App.DAO;

import App.Entities.Produit;
import App.Utils.DB;

import javax.persistence.EntityManager;

public class ProduitDAO {

    public static Produit insert(Produit p){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        return  p;
    }
    public static void delete(Produit p){
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.remove(em.merge(p));
        em.getTransaction().commit();
    }
    public static Produit select(Long id){
        EntityManager em = DB.getEM();
        Produit p = em.find(Produit.class,id);
        return  p;
    }


}
