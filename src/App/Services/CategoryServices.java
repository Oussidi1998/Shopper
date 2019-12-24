package App.Services;

import App.Entities.Category;
import App.Entities.Produit;
import App.Utils.DB;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class CategoryServices {

    public static List<Category> getAllCategories(){
        EntityManager em = DB.getEM();
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Category> cq = cb.createQuery(Category.class);
        Root<Category> rootEntry = cq.from(Category.class);
        CriteriaQuery<Category> all = cq.select(rootEntry);
        TypedQuery<Category> allQuery = em.createQuery(all);
        return allQuery.getResultList();
    }
}
