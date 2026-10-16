/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletProdutoFC extends HttpServlet {

    @EJB
    ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // pegar parametro acao
        String acao = request.getParameter("acao");
        if (acao == null) {
            acao = "listar";
        }
        
        // Definir destino
        String destino = "ProdutoLista.jsp";

        // case acao
        switch (acao) {
            case "listar":
                request.setAttribute("produtos", facade.findAll());
                destino = "ProdutoLista.jsp";
                break;
                
            case "formIncluir":
                destino = "ProdutoDados.jsp";
                break;
                
            case "formAlterar":
                int idForm = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("produto", facade.find(idForm));
                destino = "ProdutoDados.jsp";
                break;
                
            case "incluir":
                Produto pNovo = new Produto();
                pNovo.setNome(request.getParameter("nome"));
                pNovo.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                pNovo.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                facade.create(pNovo);
                
                request.setAttribute("produtos", facade.findAll());
                destino = "ProdutoLista.jsp";
                break;
                
            case "alterar":
                int idAlt = Integer.parseInt(request.getParameter("id"));
                Produto pAlt = facade.find(idAlt);
                pAlt.setNome(request.getParameter("nome"));
                pAlt.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                pAlt.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                facade.edit(pAlt);
                
                request.setAttribute("produtos", facade.findAll());
                destino = "ProdutoLista.jsp";
                break;
                
            case "excluir":
                int idExc = Integer.parseInt(request.getParameter("id"));
                Produto pExc = facade.find(idExc);
                facade.remove(pExc);
                
                request.setAttribute("produtos", facade.findAll());
                destino = "ProdutoLista.jsp";
                break;
        }

        // Redirecionar para destino
        request.getRequestDispatcher(destino).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Front Controller para Produtos";
    }
}