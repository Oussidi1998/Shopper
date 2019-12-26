package App.Services;

import App.Entities.Category;
import App.Entities.Produit;
import App.Utils.DB;

import javax.persistence.EntityManager;
import java.util.List;

public class ProduitServices {

    public static final EntityManager em = DB.getEM();

    public static List<Produit> getAllProducts(){
        List<Produit> list = em.createQuery("select p from Produit p").getResultList();
        return list;
    }

    public static List<Produit> getListProduitByCatgeory(Long idCat){
        Category cat = em.find(Category.class,idCat);
        return cat.getProduitList();
    }

}
