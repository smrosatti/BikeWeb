/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dal.Dal;
import Model.BFType;
import Model.Bikefood;
import Model.City;
import Model.Country;
import Model.Location;
import Model.State;
import Model.UserValidation;
import Model.Userr;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
public class CadBikeServlet extends HttpServlet {

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
            String bairro = request.getParameter("bairro");
            String rua = request.getParameter("rua");
            String numero = request.getParameter("numero");
            String cnpj = request.getParameter("cnpj");
            String dtinicio = request.getParameter("dtinicio");
            String dtfinal = request.getParameter("dtfinal");
            String telefone = request.getParameter("telefone");
            int ide = Integer.valueOf(request.getParameter("estado"));
            int idp = Integer.valueOf(request.getParameter("pais"));
            int idc = Integer.valueOf(request.getParameter("cidade"));
            int idesp = Integer.valueOf(request.getParameter("especialidade"));
            Userr u = (Userr) request.getSession().getAttribute("user");

            UserValidation uv = new UserValidation();

            if (uv.isCNPJ(cnpj) == true) {

                Dal dal = new Dal();
                State est = (State) dal.find(ide, "State");

                dal = new Dal();
                Country pais = (Country) dal.find(idp, "Country");

                dal = new Dal();
                City cid = (City) dal.find(idc, "City");

                dal = new Dal();
                BFType esp = (BFType) dal.findType(idesp);

                telefone = telefone.replaceFirst("(\\d{2})(\\d{5})(\\d+)", "($1) $2-$3");

                String img = "C:\\Users\\Aluno\\Documents\\NetBeansProjects\\BikeWeb\\web\\Image\\bfpadrao.jpg";

                Date dti = new SimpleDateFormat("yyyy-MM-dd").parse(dtinicio);
                Date dtf = new SimpleDateFormat("yyyy-MM-dd").parse(dtfinal);

                dal = new Dal();
                Bikefood bf = new Bikefood(nome, u, esp, cnpj, img, telefone);

                if (dal.create(bf) == true) {

                    dal = new Dal();
                    Location l = new Location(rua, bairro, pais, est,
                            cid, numero, bf, dti, dtf);

                    if (dal.create(l) == true) {

                        request.setAttribute("erro_cnpj", false);
                        
                        System.out.println("IIIIIIIIIIIIIIIIDDDDDDDDDDDDD: "+ bf.getId());
                        
                        request.setAttribute("bike", bf.getId());
                        RequestDispatcher rd = request.getRequestDispatcher("ImgBike.jsp");
                        rd.forward(request, response);

                    } else {
                        System.out.println("ERRO NO LOCATION");
                    }

                } else {
                    System.out.println("ERRO BIKE FOOD");
                }

            } else {
                System.out.println("CNPJ Inválido");
                request.setAttribute("erro_cnpj", true);
                RequestDispatcher rd = request.getRequestDispatcher("CadBikefood.jsp");
                rd.forward(request, response);
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
