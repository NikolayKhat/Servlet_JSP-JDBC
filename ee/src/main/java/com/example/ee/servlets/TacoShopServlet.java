package com.example.ee.servlets;

import com.example.ee.database.DataBase;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/tacoshop")
public class TacoShopServlet extends HttpServlet {

    private DataBase dataBase = new DataBase();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String where = request.getParameter("where");
        if (where == null) {
            where = "home";
        }
        switch (where) {
            case "home": home(request, response); break;
            case "createTaco": createTaco(request, response); break;
            case "cart": cart(request, response); break;
            case "login": login(request, response); break;
            case "registration": registration(request, response); break;
            case "toPay": toPay(request, response);break;
            case "logoutCheck": logoutCheck(request, response);break;

        }
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/home.jsp").forward(request, response);
    }

    private void createTaco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        /* JPS loginCheck */
        if (session.getAttribute("loginCheck") != null) {
            request.getRequestDispatcher("/view/createTaco.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    private void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        /* JPS loginCheck */
        if (session.getAttribute("loginCheck") != null) {
            request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }

    private void registration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/registration.jsp").forward(request, response);
    }

    private void toPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/toPay.jsp").forward(request, response);
    }


    private void logoutCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("loginCheck");
        response.sendRedirect("tacoshop?where=home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String where = request.getParameter("where");
        switch (where) {
            case "toPaySuccess": toPaySuccess(request, response);break;
            case "loginCheck": loginCheck(request, response);break;
            case "createTacoCheck": createTacoCheck(request, response);break;
        }
    }

    private void toPaySuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/toPaySuccess.jsp").forward(request, response);
    }

    private void loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (dataBase.checkAccount(request, response)) {
            session.setAttribute("loginCheck", "admin");
            response.sendRedirect("tacoshop?where=home");
        } else {
            session.setAttribute("loginCheck", null);
            request.getServletContext().getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    private void createTacoCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<String> listIngredients = new ArrayList<>();
//        listIngredients.add(request.getParameter("ingredients1"));
//        listIngredients.add(request.getParameter("ingredients2"));
//        listIngredients.add(request.getParameter("ingredients3"));
//        listIngredients.add(request.getParameter("ingredients4"));
//
//        for (String ingredients : listIngredients) {
//            System.out.print(ingredients + ", ");
//        }

        request.getRequestDispatcher("/view/createTaco.jsp").forward(request, response);
    }

}
