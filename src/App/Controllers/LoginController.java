package App.Controllers;

import App.Entities.Category;
import App.Entities.Client;
import App.Entities.Product;
import App.Services.CategoryServices;
import App.Services.ClientServices;
import App.Services.ProductServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (req.getParameter("login")!=null){
            String mail = req.getParameter("email");
            String pwd = req.getParameter("pwd");

            ClientServices service = new ClientServices();
            Client user = service.login(mail, pwd);
            if (user != null){
                HttpSession session = req.getSession();
                String fullname = user.getNom()+"_"+user.getPrenom();
                session.setAttribute("user",fullname);
                session.setAttribute("userAddress",user.getAdresse());
                session.setAttribute("userID",user.getIdClient());
                System.out.println(fullname);
            }else{
                req.setAttribute("msg","Email or Password Incorrect");
            }
        }

        if (req.getAttribute("msg")!=null){
            ProductServices serviceProducts = new ProductServices();
            CategoryServices serviceCats = new CategoryServices();
            List<Product> listProducts = serviceProducts.getAllProducts();
            List<Category> listCategories = serviceCats.getAllCategories();
            req.setAttribute("products", listProducts);
            req.setAttribute("categories",listCategories);
            req.getRequestDispatcher("Views/Home.jsp").forward(req,res);
        }else{
            String previousUrl = req.getHeader("referer");
            res.sendRedirect(previousUrl);
        }

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("home");
    }
}
