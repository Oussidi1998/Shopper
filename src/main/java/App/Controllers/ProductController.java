package App.Controllers;

import App.Entities.Product;
import App.Services.ProductServices;
import App.Utils.PanierItem;
import App.Utils.Util;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Long idProduit =Long.decode(req.getParameter("id_produit"));
        int qte=  Integer.parseInt(req.getParameter("qte"));
        ProductServices service = new ProductServices();
        Product product = service.getProductById(idProduit);
        PanierItem item = new PanierItem(idProduit, product.getLabel(), product.getPrix()- product.getPrix()* product.getPromo()/100,qte);

        Cookie cookiePanier  = Util.getCookie(req,"panier");
        // check if the cookie exist or not
        if (cookiePanier==null){
            System.out.println("cookie panier doesn't exist");
            List<PanierItem> list = new ArrayList<>();
            list.add(item);
            Cookie panier = new Cookie("panier", URLEncoder.encode(new ObjectMapper().writeValueAsString(list),"UTF-8"));
            res.addCookie(panier);
        }else{
            System.out.println("cookie panier already exist");
            // get panier items in cookie
            List<PanierItem> panierItems = new ObjectMapper().readValue(URLDecoder.decode(cookiePanier.getValue(),"UTF-8"),new TypeReference<List<PanierItem>>(){});
            // check item exist panier
            if (panierItems.contains(item)){
                System.out.println("item already exist in panier");
                int itemIndex=panierItems.indexOf(item);
                panierItems.get(itemIndex).setQte(item.getQte()+qte);
            }else{
                System.out.println("item added to panier");
                panierItems.add(item);
            }
            // serialize thing and store it again im cookie
            cookiePanier.setValue(URLEncoder.encode(new ObjectMapper().writeValueAsString(panierItems),"UTF-8"));
            res.addCookie(cookiePanier);
        }

        res.sendRedirect("cart");

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        ProductServices serviceProducts = new ProductServices();

        String idProduct = req.getParameter("id");
         if (idProduct!=null){
            Product product = serviceProducts.getProductById(Long.decode(idProduct));
            req.setAttribute("product",product);
            System.out.println(product.getLabel());
            req.getRequestDispatcher("Views/Product.jsp").forward(req,res);
        }else
        {
            res.sendRedirect("home");
        }

    }


}
