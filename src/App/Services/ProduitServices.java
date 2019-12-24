package App.Services;

import App.Entities.Produit;
import App.Utils.DB;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class ProduitServices {

    public static List<Produit> getAllProducts(){
        EntityManager em = DB.getEM();
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Produit> cq = cb.createQuery(Produit.class);
        Root<Produit> rootEntry = cq.from(Produit.class);
        CriteriaQuery<Produit> all = cq.select(rootEntry);
        TypedQuery<Produit> allQuery = em.createQuery(all);
        return allQuery.getResultList();
    }
}
