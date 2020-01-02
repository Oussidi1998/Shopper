package App.Controllers;

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

@WebServlet(urlPatterns = "/cart")
public class CartController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        Cookie cookiePanier = Util.getCookie(req,"panier");
        List<PanierItem> panierItems=null;
        if (cookiePanier!=null){
            panierItems = new ObjectMapper().readValue(URLDecoder.decode(cookiePanier.getValue(),"UTF-8"),new TypeReference<List<PanierItem>>(){});
            if (req.getParameter("refreshCart")!=null && req.getParameter("refreshCart").equals("refreshCart")){

                String[] ids =  new String[panierItems.size()];
                String[] qts =  new String[panierItems.size()];

                for (int i=0;i<ids.length;i++){
                    ids[i]=req.getParameter("id_product_"+i);
                    qts[i]=req.getParameter("qt_"+i);
                }
                int i = 0;
                for (PanierItem item:panierItems) {
                   if (item.getIdProduct().equals(Long.decode(ids[i]))){
                       item.setQte(Integer.parseInt(qts[i]));
                   }
                    i++;
                }
                cookiePanier.setValue(URLEncoder.encode(new ObjectMapper().writeValueAsString(panierItems),"UTF-8"));
                res.addCookie(cookiePanier);
            }
        }

        req.setAttribute("panierItems",panierItems );
        req.getRequestDispatcher("Views/Cart.jsp").forward(req,res);

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // delete item in the cart
        if (req.getParameter("sup")!=null){
            if (!req.getParameter("sup").isEmpty()){
                Long panierItemId = Long.decode(req.getParameter("sup"));
                Cookie cookiePanier = Util.getCookie(req,"panier");
                if (cookiePanier!=null){
                    List<PanierItem> panierItems = new ObjectMapper().readValue(URLDecoder.decode(cookiePanier.getValue(),"UTF-8"),new TypeReference<List<PanierItem>>(){});
                    PanierItem itemToDelete=null;
                    for (PanierItem item:panierItems) {
                        if (item.getIdProduct().equals(panierItemId)){
                            itemToDelete = item;
                            break;
                        }
                    }

                    panierItems.remove(itemToDelete);
                    cookiePanier.setValue(URLEncoder.encode(new ObjectMapper().writeValueAsString(panierItems),"UTF-8"));
                    res.addCookie(cookiePanier);
                }
            }
        }


        // to empty the cart
        if (req.getParameter("empty")!=null){
            if (req.getParameter("empty").equals("1")){
                Cookie cookiePanier = new Cookie("panier", null);
                cookiePanier.setMaxAge(0);
                res.addCookie(cookiePanier);
                System.out.println("deleted");
            }
        }else{
            Cookie panier = Util.getCookie(req,"panier");
            if (panier!=null){
                ArrayList<PanierItem> panierItems = new ObjectMapper().readValue(URLDecoder.decode(panier.getValue(),"UTF-8"),new TypeReference<ArrayList<PanierItem>>(){});
                req.setAttribute("panierItems",panierItems );
            }

        }

        req.getRequestDispatcher("Views/Cart.jsp").forward(req,res);
    }

}
