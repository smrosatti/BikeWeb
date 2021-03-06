/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dal.Dal;
import Model.Gender;
import Model.UserType;
import Model.UserValidation;
import Model.Userr;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aluno
 */
public class EditarEmpServlet extends HttpServlet {

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
             String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String senha = request.getParameter("senha");
            String consenha = request.getParameter("consenha");
            String aniversario = request.getParameter("aniversario");
            String img = request.getParameter("pathimg");
            String cpf = request.getParameter("cpf");

            UserValidation uv = new UserValidation();
            
            Userr user = (Userr) request.getSession().getAttribute("user");

            if (uv.isCPF(cpf) == false) {
                System.out.println("cpf invalido");
                request.setAttribute("erro_cpf", true);
                RequestDispatcher r = request.getRequestDispatcher("EditarEmp.jsp");
                r.forward(request, response);
            } else if (senha.equals(consenha)) {

                if (img == null || img.equals(" ")) {
                    img = "br/com/bikefood/image/user_padrao.png";
                }
                
                  uv = new UserValidation();
                String hash = uv.hashpass(senha);

                Gender genero = new Gender();

                Date bt = new SimpleDateFormat("yyyy-MM-dd").parse(aniversario);

                LocalDate dt = bt.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                UserType ut = user.getIdType();

                if (gender.equals("male")) {
                    genero.setIdGender(1L);
                } else {
                    genero.setIdGender(2L);
                }

                Userr u = new Userr(user.getId(), nome, sobrenome, hash, genero, ut, cpf, email, dt, ("file:///"+img));
                Dal dal = new Dal();
                dal.edit(u);
                
                request.getSession().setAttribute("user", u);
                request.setAttribute("erro_cpf", false);
                request.setAttribute("erro_senha", false);
                
                RequestDispatcher rd = request.getRequestDispatcher("IniciaMenuServlet");
                rd.forward(request, response);

            } else {
                System.out.println("senha não coincide");
                request.setAttribute("erro_senha", true);
                RequestDispatcher r = request.getRequestDispatcher("EditarEmp.jsp");
                r.forward(request, response);
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
