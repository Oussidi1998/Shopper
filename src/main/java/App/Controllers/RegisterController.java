package App.Controllers;

import App.Entities.Category;
import App.Entities.Client;
import App.Entities.Product;
import App.Services.CategoryServices;
import App.Services.ClientServices;
import App.Services.ProductServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        if (req.getParameter("register") != null){
            String nom = req.getParameter("nom");
            String prenom = req.getParameter("prenom");
            String mail = req.getParameter("email");
            String gender = req.getParameter("gender");
            int zipcode = Integer.parseInt(req.getParameter("zipcode"));
            String pays = req.getParameter("country");
            String city = req.getParameter("city");
            String address = req.getParameter("address");
            String pwd = req.getParameter("pwd");

            ClientServices service = new ClientServices();
            Client user = service.Register(nom,prenom,mail,pwd,gender,pays,city,zipcode,address);
            if (user != null){
                req.setAttribute("msg","your account has been created you login now with email and password provided");
            }else{
                req.setAttribute("msg","There was an error while trying creating you account ,Try Again");
            }
        }else{
            req.setAttribute("msg","There was an error, Try Again");
        }

        ProductServices serviceProducts = new ProductServices();
        CategoryServices serviceCats = new CategoryServices();
        List<Product> listProducts = serviceProducts.getAllProducts();
        List<Category> listCategories = serviceCats.getAllCategories();
        req.setAttribute("products", listProducts);
        req.setAttribute("categories",listCategories);
        req.getRequestDispatcher("Views/Home.jsp").forward(req,res);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("home");
    }
}
