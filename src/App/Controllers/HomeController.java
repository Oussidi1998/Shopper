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

@WebServlet(urlPatterns = {"/home",""})
public class HomeController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        List<Produit> listProduits = ProduitServices.getAllProducts();
        /*String category = req.getParameter("cat");
        if (!category.equals(null)){
            listProduits = ProduitServices.getListProduitByCatgeory(Long.decode(category));
        }*/
        List<Category> listCategories = CategoryServices.getAllCategories();

        req.setAttribute("produits",listProduits);
        req.setAttribute("categories",listCategories);
        req.getRequestDispatcher("Views/Home.jsp").forward(req,res);
    }

}
