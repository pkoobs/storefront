/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mmp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mmp.business.*;
import mmp.utils.Helper;
import mmp.utils.MailUtilGmail;

@WebServlet(name = "StoreController", urlPatterns = {"/StoreController"})
public class StoreController extends HttpServlet {

    // jhu.mhong23@gmail.com
    // qwerty12345!@#$%
    private void sendEmail(Cart cart, User user) {
        log("attempting to send email to :" + user.getEmail());
        String email = user.getEmail();
        String name = user.getName();
        // send email to user
        String to = email;
        String from = "jhu.mhong23@gmail.com";
        String subject = "Welcome to our email list";
        String body = "Dear " + name + ",\n\n"
                + "Thanks for shopping at our store. "
                + "you announcements about new products and promotions.\n"
                + "Have a great day and thanks again!\n\n"
                + "MMP\n";

        boolean isBodyHTML = false;

        try {
            //MailUtilLocal.sendMail(to, from, subject, body, isBodyHTML);
            MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
            log("email has been successfully sent");
        } catch (MessagingException e) {
            log("mars.controller.SchoolController.sendEmail() " + e);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = getServletConfig().getServletContext()
                .getRequestDispatcher("/index.jsp");
        HttpSession session = request.getSession();

        List<Item> catalog = Helper.sampleInventory();
        session.setAttribute("catalog", catalog);
        Cart cart = (Cart) session.getAttribute("cart");
        if (null == cart) {
            cart = new Cart();
            cart.setItems(new ArrayList<Item>());
        }
        String action = request.getParameter("action");
        log("action: " + action);

        if ("login".equals(action)) {
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            log("login has been requested with " + password + " " + email);
            User user = new User();
            user.setEmail(email);
            user.setPassword(password);
            session.setAttribute("user", user);

            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/catalog.jsp");
        } else if ("Add Item".equals(action)) {

            Item item = new Item();
            item.setName(request.getParameter("movieCode"));
            log("attempting to add item " + item.getName());
            cart.getItems().add(item);
        }

        session.setAttribute("cart", cart);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
