package App.Controllers;

import App.Entities.*;
import App.Services.ClientServices;
import App.Services.OrderServices;
import App.Services.DetailCommandServices;
import App.Services.ProductServices;
import App.Utils.PanierItem;
import App.Utils.Util;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/checkout")
public class CheckoutController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (req.getParameter("checkout")!=null){

            HttpSession session = req.getSession();
            // first save address in session
            if (session.getAttribute("address")==null){
                session.setAttribute("address",req.getParameter("address"));
            }
            if (session.getAttribute("userID")!=null){
                // save the order
                Cookie cookiePanier = Util.getCookie(req,"panier");
                if (cookiePanier!=null) {
                    List<PanierItem> panierItems = new ObjectMapper().readValue(URLDecoder.decode(cookiePanier.getValue(),"UTF-8"),new TypeReference<List<PanierItem>>(){});
                    OrderServices serviceCommand = new OrderServices();
                    DetailCommandServices serviceDetailCommand = new DetailCommandServices();
                    ClientServices serviceClient = new ClientServices();
                    ProductServices serviceProduit = new ProductServices();
                    Client client = serviceClient.getClientById((Long) session.getAttribute("userID"));

                    double fraisCommand=0;
                    for (PanierItem item:panierItems) {
                        fraisCommand+=item.getPrice();
                    }

                    Order cmd = serviceCommand.creatCommand(new Order(new Date(),req.getParameter("address"),fraisCommand,client));
                    if (cmd!=null){
                        OrderDetail commandItem;
                        Product product;
                        for (PanierItem item:panierItems) {
                            product = serviceProduit.getProductById(item.getIdProduct());
                            commandItem = new OrderDetail(new Product_Order_Id(item.getIdProduct(),cmd.getIdCommand()),item.getQte(),item.getPrice(),cmd, product);
                            serviceDetailCommand.persistCommandItem(commandItem);
                        }

                        // empty the cart cookie now
                        Cookie cookie = new Cookie("panier", null);
                        cookie.setMaxAge(0);
                        res.addCookie(cookie);
                        System.out.println("cookie deleted");

                        // send feedback
                        req.setAttribute("msg","Your order has been saved thanks for purchasing At shopper.com");
                    }else{
                        req.setAttribute("msgErr","There was en error while saving your order");
                    }
                }else{
                    System.out.println("Panier vide");
                    req.setAttribute("msg","You don't have any items on panier Go add some items to cart");
                }
            }else{
                System.out.println("Please Login");
                req.setAttribute("msgErr","Please Login or register to Order");
            }

            req.getRequestDispatcher("Views/Checkout.jsp").forward(req,res);
        }else{
            res.sendRedirect("home");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Cookie cookiePanier = Util.getCookie(req,"panier");
        if (cookiePanier!=null) {
            req.getRequestDispatcher("Views/Checkout.jsp").forward(req,res);
        }else{
            res.sendRedirect(req.getHeader("referer"));
        }
    }
}
