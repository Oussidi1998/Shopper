package App.Controllers;

import App.Entities.Category;
import App.Entities.Product;
import App.Services.CategoryServices;
import App.Services.ProductServices;
import App.Utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/products")
@MultipartConfig
public class AdminProductsController extends HttpServlet {
    private final ProductServices productServices  = new ProductServices();
    private final  CategoryServices categoryServices =  new CategoryServices();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // add product
        if (req.getParameter("ajouter")!=null){
            double prix=  Double.parseDouble(req.getParameter("prix"));
            String label=  req.getParameter("label");
            String description=  req.getParameter("description");
            double promo=  Double.parseDouble(req.getParameter("promo"));
            Part filepart = req.getPart("image");
            byte[] image = Util.getImageByte(filepart.getName());

            Category category = categoryServices.getAllCategoryById(Long.decode(req.getParameter("category")));

            Product pro = productServices.addProduct(label,description,image,prix,promo,category);
            if (pro!=null){
                req.setAttribute("msg","The product has been added");
            }else{
                req.setAttribute("msg","There was an error while adding the product");
            }

            req.getRequestDispatcher("../Views/AdminProducts.jsp").forward(req,resp);

        }

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> listProducts = productServices.getAllProducts();
        List<Category> listCats = categoryServices.getAllCategories();
        req.setAttribute("products",listProducts);
        req.setAttribute("cats",listCats);
        req.getRequestDispatcher("../Views/AdminProducts.jsp").forward(req,resp);
    }
}
