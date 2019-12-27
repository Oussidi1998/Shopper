package App.Controllers;

import App.Entities.Category;
import App.Entities.Produit;
import App.Services.CategoryServices;
import App.Services.ProduitServices;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        ProduitServices serviceProducts = new ProduitServices();
        CategoryServices serviceCats = new CategoryServices();

        String idProduct = req.getParameter("id");
         if (idProduct!=null){
            Produit product = serviceProducts.getProductById(Long.decode(idProduct));
            req.setAttribute("product",product);
             System.out.println(product.getLabel());
            req.getRequestDispatcher("Views/Product.jsp").forward(req,res);
        }else
        {
            List<Produit> listProduits = serviceProducts.getAllProducts();
            List<Category> listCategories = serviceCats.getAllCategories();
            req.setAttribute("produits",listProduits);
            req.setAttribute("categories",listCategories);
            req.getRequestDispatcher("Views/Home.jsp").forward(req,res);
        }



    }

}
