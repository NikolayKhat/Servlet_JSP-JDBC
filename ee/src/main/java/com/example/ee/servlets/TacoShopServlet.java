package com.example.ee.servlets;

import com.example.ee.Taco.Taco;
import com.example.ee.database.Database;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/tacoshop")
public class TacoShopServlet extends HttpServlet {

    private Database database = new Database("root", "root", "database");

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
            case "deleteTaco": deleteTaco(request, response);break;

        }
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/home.jsp").forward(request, response);
    }

    private void createTaco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("temp", "createTaco");
        /* JPS loginCheck */
        if (session.getAttribute("loginCheck") != null) {
            session.setAttribute("ingredients", database.createListIngredients());
            request.getRequestDispatcher("/view/createTaco.jsp").forward(request, response);
        } else {
            response.sendRedirect("tacoshop?where=login");
        }
    }

    private void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String login = (String) session.getAttribute("loginCheck");
        session.setAttribute("temp", "cart");
        /* JPS loginCheck */
        if (session.getAttribute("loginCheck") != null) {
            setAttributeCart(request, response, login);
            request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
        } else {
            response.sendRedirect("tacoshop?where=login");
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
        session.invalidate();
        response.sendRedirect("tacoshop?where=home");
    }

    private void deleteTaco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String login = (String) session.getAttribute("loginCheck");

        database.deleteTaco(login, Integer.valueOf(request.getParameter("id")));
        setAttributeCart(request, response, login);

        response.sendRedirect("tacoshop?where=cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String where = request.getParameter("where");
        switch (where) {
            case "toPaySuccess": toPaySuccess(request, response);break;
            case "loginCheck": loginCheck(request, response);break;
            case "createTacoCheck": createTacoCheck(request, response);break;
            case "registrationCheck": registrationCheck(request, response);break;
        }
    }

    private void toPaySuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patternCreditCardNum = "\\d{16}";
        String patternCreditCartName = "\\D{3,10}";
        String patternCreditCardDate = "[01]\\d[/]\\d\\d";

        /* проверка на корректность заполнения формы оплаты */
        if (Pattern.matches(patternCreditCardNum, request.getParameter("creditCardNum")) &&
                Pattern.matches(patternCreditCartName, request.getParameter("creditCardName")) &&
                Pattern.matches(patternCreditCardDate, request.getParameter("creditCardDate"))) {
            request.getRequestDispatcher("/view/toPaySuccess.jsp").forward(request, response);

            HttpSession session = request.getSession();
            String login = (String) session.getAttribute("loginCheck");

            database.deleteListTaco(login);
            setAttributeCart(request, response, login);
        } else {
            response.sendRedirect("tacoshop?where=toPay");
        }
    }

    private void loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String login = request.getParameter("userNameLogin");
        String password = request.getParameter("passwordLogin");

        boolean check = false;

        if (database.checkLogin(login)) {
            if (database.checkPassword(login, password)) {
                session.setAttribute("loginCheck", login);
                setAttributeCart(request, response, login);

                if (session.getAttribute("temp") == null) session.setAttribute("temp", "home");
                response.sendRedirect("tacoshop?where=" + session.getAttribute("temp"));
                check = true;
            }
        }

        if (!check) {
            session.setAttribute("loginCheck", null);
            request.getServletContext().getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    private void registrationCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String login = request.getParameter("loginRegistration");
        String password = request.getParameter("passwordRegistration");
        String passwordRe = request.getParameter("passwordReRegistration");

        boolean check = false;

        if (!database.checkLogin(login)) {
            if (password.equals(passwordRe)) {
                database.addUser(login, password);
                session.setAttribute("loginCheck", login);

                if (session.getAttribute("temp") == null) session.setAttribute("temp", "home");
                response.sendRedirect("tacoshop?where=" + session.getAttribute("temp"));
                check = true;
            }
        }

        if (!check) request.getServletContext().getRequestDispatcher("/view/registration.jsp").forward(request, response);
    }

    private void createTacoCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Taco taco = new Taco(request, response);
        HttpSession session = request.getSession();
        String login = (String) session.getAttribute("loginCheck");

        database.addTacoInCart(login, taco);
        setAttributeCart(request, response, login);

        request.getRequestDispatcher("/view/createTaco.jsp").forward(request, response);
    }

    private void setAttributeCart(HttpServletRequest request, HttpServletResponse response, String login) {
        HttpSession session = request.getSession();

        session.setAttribute("listTacoId", database.createListTacoNumber(login));
        session.setAttribute("listTacoPrice", database.createListTacoPrice(login));
        session.setAttribute("listTacoIngredients", database.createListTacoDescription(login));
        session.setAttribute("listTacoPriceAll", database.createTacoPriceAll(login));
    }
}