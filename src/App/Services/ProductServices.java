package App.Services;

import App.Entities.Category;
import App.Entities.Client;
import App.Entities.Product;
import App.Utils.DB;
import javax.persistence.EntityManager;
import java.util.List;

public class ProductServices {

    public final EntityManager em = DB.getEM();

    public List<Product> getAllProducts(){
       return (List<Product>) em.createQuery("select p from Product p").getResultList();
    }

    public List<Product> getListProduitByCatgeory(Long idCat){
       Category cat = em.find(Category.class,idCat);
       return cat.getProductList();
    }

    public Product getProductById(Long id){
        Product product = em.find(Product.class,id);
        if (product ==null)
            return new Product();
        return product;
    }

    public Product addProduct(String label,String description,byte[] image,double prix,double promo,Category cat){
        /*Product prExist = ProductAlreadyExist(label);
        if (prExist!=null){
            return  null;
        }*/
        Product product= new Product(label,description,prix,image,promo,cat);
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();

        return product;
    }

}
