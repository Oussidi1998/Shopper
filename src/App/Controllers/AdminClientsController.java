package App.Controllers;

import App.Entities.Category;
import App.Entities.Client;
import App.Services.CategoryServices;
import App.Services.ClientServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/clients")
public class AdminClientsController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClientServices service = new ClientServices();
        List<Client> listClients = service.getAllClients();
        req.setAttribute("clients",listClients);
        req.getRequestDispatcher("../Views/AdminClients.jsp").forward(req,resp);
    }
}
