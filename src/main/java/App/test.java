package App;

import App.Entities.Product;
import App.Utils.DB;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class test {
    public static void main(String[] args) {
        EntityManager em = DB.getEM();
        em.getTransaction().begin();
        em.find(Product.class,2L).setImage(getImageByte("C:\\xampp\\htdocs\\TpMcw\\e-commerce\\produits\\pc-portable-core-i5-lenovo.jpg"));
        em.getTransaction().commit();
    }

    private static byte[] getImageByte(String uri){
        Path path = Paths.get(uri);
        byte[] byteArray = null;
        try {
            byteArray = Files.readAllBytes(path);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return byteArray;
    }
}
