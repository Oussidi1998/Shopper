package App;

import App.Entities.Produit;
import App.Services.ProduitServices;
import App.Utils.DB;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class test {
    public static void main(String[] args) {
        //EntityManager em = DB.getEM();
        //em.getTransaction().begin();
        //em.find(Produit.class,20L).setImage(getCover("C:\\xampp\\htdocs\\TpMcw\\e-commerce\\produits\\thumb_machine-a-laver-7kg-800t-silver-awg7080s.jpg"));
        //em.getTransaction().commit();

        //List<Produit> listProduits = ProduitServices.getListProduitByCatgeory(Long.decode("1"));
        //System.out.println(listProduits.get(0).getLabel());
    }

    public static byte[] getCover(String uri){
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
