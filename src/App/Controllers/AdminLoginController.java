package App.Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin")
public class AdminLoginController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("username");
        String pwd = req.getParameter("pwd");

        if (email.equals("admin") && pwd.equals("admin")){
            HttpSession session = req.getSession();
            session.setAttribute("adminLogin","yes");
            req.getRequestDispatcher("Views/AdminHome.jsp").forward(req,res);
        }else{
            req.setAttribute("msg","Email or Password Incorrect");
            doGet(req, res);
        }
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
