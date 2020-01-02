package App.Controllers;

import App.Entities.Order;
import App.Services.OrderServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/orders")
public class AdminOrdersController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         OrderServices service = new OrderServices();
        List<Order> listOrders = service.getAllOrders();
        req.setAttribute("orders",listOrders);
        req.getRequestDispatcher("../Views/AdminOrders.jsp").forward(req,resp);
    }
}
