package App.Controllers;

import App.Entities.Category;
import App.Services.CategoryServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/categories")
public class AdminCatsController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryServices service = new CategoryServices();
        List<Category> listCats = service.getAllCategories();
        req.setAttribute("categories",listCats);
        req.getRequestDispatcher("../Views/AdminCats.jsp").forward(req,resp);
    }
}
