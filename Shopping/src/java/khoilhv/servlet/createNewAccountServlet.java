/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoilhv.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khoilhv.user.AccountCreateError;
import khoilhv.user.AccountDAO;
import khoilhv.user.AccountDTO;

/**
 *
 * @author Infinity
 */
@WebServlet(name = "createNewAccountServlet", urlPatterns = {"/createNewAccountServlet"})
public class createNewAccountServlet extends HttpServlet {
private final String ERROR_PAGE = "createAccountPage2";
private final String LOGIN_PAGE = "loginPage";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR_PAGE;
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullname");
        AccountCreateError error = new AccountCreateError();
        boolean foundErr = false;
        try {
         if(username.trim().length() < 6 || username.trim().length() > 30){
             foundErr = true;
             error.setUsernameLengthErr("Username is required input from 6 to 30 characters");
         }
         if(password.trim().length() < 6 || password.trim().length() > 30){
             foundErr = true;
             error.setPasswordLengthErr("Password is required input from 6 to 30 characters");
         }
         else if(!(confirm.trim().equals(password.trim()))){
             foundErr = true;
             error.setConfirmNotMatchErr("Confirm and password not matched");
         }
         if(fullname.trim().length() < 2 || fullname.trim().length() > 50){
             foundErr = true;
             error.setFullnameLengthErr("Fullname is required input from 2 to 50 characters");
         }
         if(foundErr){
             request.setAttribute("CREATEERROR", error);
         }else {
             AccountDTO dto = new AccountDTO(username, password, fullname, false);
             AccountDAO dao = new AccountDAO();
             boolean result = dao.createAccount(dto);
             if(result){
                 url = LOGIN_PAGE;
             }
         }
        } catch(SQLException s) {
            String msg = s.getMessage();
            log("SQLException at createNewAccountServlet " + msg);
            if(msg.contains("duplicate")){
                error.setUsernameIsExisted(username + " is existed!!!");
                request.setAttribute("CREATEERROR", error);
            }
        } catch(NamingException n){
            log("NamingException at createNewAccountServlet " + n.getMessage());
        }
        finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
