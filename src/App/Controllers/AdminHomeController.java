package App.Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/home")
public class AdminHomeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("adminLogin") !=null){
            if (session.getAttribute("adminLogin").equals("yes")){
                req.getRequestDispatcher("Views/AdminHome.jsp").forward(req,res);
            }else{
                req.getRequestDispatcher("Views/AdminLogin.jsp").forward(req,res);
            }
        }else{
            req.getRequestDispatcher("Views/AdminLogin.jsp").forward(req,res);
        }
    }
}
