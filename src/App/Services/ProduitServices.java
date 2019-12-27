package App.Services;

import App.Entities.Category;
import App.Entities.Produit;
import App.Utils.DB;
import javax.persistence.EntityManager;
import java.util.List;

public class ProduitServices {

    public final EntityManager em = DB.getEM();

    public List<Produit> getAllProducts(){
       return (List<Produit>) em.createQuery("select p from Produit p").getResultList();
    }

    public List<Produit> getListProduitByCatgeory(Long idCat){
       Category cat = em.find(Category.class,idCat);
       return cat.getProduitList();
    }

    public Produit getProductById(Long id){
        Produit produit = em.find(Produit.class,id);
        if (produit==null)
            return new Produit();
        return produit;
    }

}
