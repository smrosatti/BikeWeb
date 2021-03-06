/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dal.Dal;
import Model.UserValidation;
import Model.Userr;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SARA
 */
public class LoginServlet extends HttpServlet {

    private Userr u = new Userr();

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
        try {

            Dal dal = new Dal();
            ArrayList<Userr> usuarios = new ArrayList(dal.getList(u));

            String login = request.getParameter("email");
            String senha = request.getParameter("senha");

            UserValidation uv = new UserValidation();
            String hash = uv.hashpass(senha);

            System.out.println("Nome: " + login);
            System.out.println("Email: " + senha);


            for (int i = 0; i < usuarios.size(); i++) {
                if (usuarios.get(i).getEmail().equals(login) && usuarios.get(i).getPassword().equals(hash)) {

                    u = usuarios.get(i);
                    
                     HttpSession session = request.getSession();
                     session.setAttribute("user", u);
                     
                      CarregaImagem all = new CarregaImagem();
                      all.carregabftodos();
                      Thread.sleep(2000);

                    System.out.println("OLA: " + u.getName());

                    if (u.getIdType().getUserType().equals("Default")) {

                        request.setAttribute("erro", false);

                        //request.setAttribute("user", u);
                        RequestDispatcher rd = request.getRequestDispatcher("MenuCli.jsp");
                        rd.forward(request, response);

                    } else if (u.getIdType().getUserType().equals("Emp")) {

                        request.setAttribute("erro", false);
                        
                        
                        // request.setAttribute("user", u);
                        RequestDispatcher rd = request.getRequestDispatcher("MenuEmp.jsp");
                        rd.forward(request, response);
                    }

                } else if (i + 1 == usuarios.size()) {
                    System.out.println("não existe");
                    request.setAttribute("erro", true);
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
