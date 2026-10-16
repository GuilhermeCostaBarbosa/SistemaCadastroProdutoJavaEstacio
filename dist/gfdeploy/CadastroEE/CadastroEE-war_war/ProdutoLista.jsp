<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        <!-- Link para o CSS do Bootstrap via CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container">
        <h1 class="mt-4">Listagem de Produtos</h1>
        
        <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>
        <br><br>
        
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Quantidade</th>
                    <th>Preco de Venda</th>
                    <th>Opções</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                    if (produtos != null) {
                        for (Produto p : produtos) {
                %>
                <tr>
                    <td><%= p.getIdProduto() %></td>
                    <td><%= p.getNome() %></td>
                    <td><%= p.getQuantidade() %></td>
                    <td><%= p.getPrecoVenda() %></td>
                    <td>
                        <a href="ServletProdutoFC?acao=formAlterar&id=<%= p.getIdProduto() %>" class="btn btn-primary btn-sm">Alterar</a>
                        <a href="ServletProdutoFC?acao=excluir&id=<%= p.getIdProduto() %>" class="btn btn-danger btn-sm">Excluir</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        
        <!-- Link para o JS do Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>