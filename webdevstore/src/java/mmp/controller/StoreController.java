/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mmp.controller;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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

    private void createPdf(HttpServletRequest request,
            HttpServletResponse response, User user, Cart cart) throws IOException {
        //get the output stream for writing binary data in the response.
        ServletOutputStream os = response.getOutputStream();
        //set the response content type to PDF
        response.setContentType("application/pdf");
        //create a new document
        Document doc = new Document();

        //create some special styles and font sizes
        Font bfBold18 = new Font(FontFamily.TIMES_ROMAN, 18, Font.BOLD, new BaseColor(0, 0, 0));
        Font bfBold12 = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLDITALIC, new BaseColor(0, 0, 0));
        Font bf12 = new Font(FontFamily.TIMES_ROMAN, 12);

        try {

            //create an instance of the PdfWriter using the output stream
            PdfWriter.getInstance(doc, os);

            //document header properties
            doc.addAuthor("MMP");
            doc.addCreationDate();
            doc.addProducer();
            doc.addCreator("mmp.com");
            doc.addTitle("Order Confirmation");
            doc.setPageSize(PageSize.LETTER);
            doc.open();

            doc.add(new Paragraph("Name: " + user.getName(), bfBold18));
            doc.add(new Paragraph("Email: " + user.getEmail(), bfBold18));
            doc.add(new Paragraph("List of Courses", bfBold18));

            doc.close();

        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

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

    protected void handleAddItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        String movieCode = request.getParameter("movieCode");
        String action = request.getParameter("action");
        Item item = cart.findItem(movieCode);
        boolean newItem = null == item;
        if (null == item) {
            item = new Item();
            item.setName(movieCode);
        }

        if (action.contains("Digital")) {
            int currCount = item.getDigitalQuantity();
            item.setDigitalQuantity(++currCount);
        } else if (action.contains("Blu")) {
            int currCount = item.getBluRayQuantity();
            item.setBluRayQuantity(++currCount);
        } else if (action.contains("DVD")) {
            int currCount = item.getDvdQuantity();
            item.setDvdQuantity(++currCount);
        }

        if (newItem) {
            cart.addItem(item);
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

        User user = (User) session.getAttribute("user");
        //user could be null, need to check for it
        String action = request.getParameter("action");
        log("action: " + action);

        String movieCode = request.getParameter("movieCode");
        log("movieCode: " + movieCode);

        if ("login".equals(action)) {
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            log("login has been requested with " + password + " " + email);
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
        } else if ("catalog".equals(action)) {
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/catalog.jsp");
        } else if (action.startsWith("Add")) {
            handleAddItem(request, response);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/catalog.jsp");
        } else if (action.startsWith("Remove")) {
            handleRemoveItem(request, response);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/cart.jsp");
        } else if (action.contains("Survey")) {
            handleSurveyRequest(request, response);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/surveyThankyou.jsp");
        } else if (action.contains("REgister")) {
            handleRegisterRequest(request, response);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/catalog.jsp");
        } else if (action.contains("submitOrder")) {
            handleSubmitOrder(request, response);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/orderSummary.jsp");
        } else if (action.contains("checkout")) {
            if (null == user) {
                dispatcher = getServletConfig().getServletContext()
                        .getRequestDispatcher("/pages/login.jsp");
            } else {
                dispatcher = getServletConfig().getServletContext()
                        .getRequestDispatcher("/pages/checkout.jsp");
            }
        } else if (action.contains("register")) {
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User newUser = new User();
            newUser.setName(fullName);
            newUser.setPassword(password);
            newUser.setEmail(email);
            registerUser(request, response, newUser);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/checkout.jsp");
        } else if (action.contains("pdf")) {
            createPdf(request, response, user, cart);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("/pages/orderSummary.jsp");
        } else {
            log("cant find the action " + action);
            dispatcher = getServletConfig().getServletContext()
                    .getRequestDispatcher("index.jsp");
        }

        session.setAttribute("cart", cart);
        session.setAttribute("cartItems", cart.getItems());
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

    private void handleRemoveItem(HttpServletRequest request, HttpServletResponse response) {

    }

    private void handleSurveyRequest(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("handling survey request");
        HttpSession session = request.getSession();
        String selection = request.getParameter("selection");
        String shipping = request.getParameter("shipping");
        System.out.println("choices are " + selection + ", " + shipping);

    }

    private void handleRegisterRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void handleSubmitOrder(HttpServletRequest request, HttpServletResponse response) {
        //do something
        
        //remove session objects
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response, User user) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

    }

}
