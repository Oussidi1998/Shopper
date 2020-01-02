package App.Services;

import App.Entities.Category;
import App.Utils.DB;
import javax.persistence.EntityManager;
import java.util.List;

public class CategoryServices {

    public final EntityManager em = DB.getEM();

    public List<Category> getAllCategories(){
        return  (List<Category>) em.createQuery("select c from Category c").getResultList();
    }


    public Category getAllCategoryById(Long category) {
        return  em.find(Category.class,category);
    }
}
