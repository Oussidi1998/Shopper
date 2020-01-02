package App.Controllers;

import App.Entities.Category;
import App.Entities.Product;
import App.Services.CategoryServices;
import App.Services.ProductServices;
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

        // for logout
        if (req.getParameter("logout")!=null && req.getParameter("logout").equals("yes")){
            req.getSession().invalidate();
        }

        ProductServices serviceProducts = new ProductServices();
        CategoryServices serviceCats = new CategoryServices();

        List<Product> listProducts = serviceProducts.getAllProducts();
        List<Category> listCategories = serviceCats.getAllCategories();

        // get products of specific category
        String category = req.getParameter("cat");
        if (category!=null && category.length()>=1){
            listProducts = serviceProducts.getListProduitByCatgeory(Long.decode(category));
        }

        System.out.println(listProducts.size());
        System.out.println(listCategories.size());

        req.setAttribute("products", listProducts);
        req.setAttribute("categories",listCategories);
        req.getRequestDispatcher("Views/Home.jsp").forward(req,res);
    }



}
