<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados do Produto</title>
        <!-- Link para o CSS do Bootstrap via CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container">
        <h1 class="mt-4">Dados do Produto</h1>
        
        <%
            Produto produto = (Produto) request.getAttribute("produto");
            String acao = (produto == null) ? "incluir" : "alterar";
            String id = (produto != null) ? String.valueOf(produto.getIdProduto()) : "";
            String nome = (produto != null) ? produto.getNome() : "";
            String quantidade = (produto != null) ? String.valueOf(produto.getQuantidade()) : "";
            String preco = (produto != null) ? String.valueOf(produto.getPrecoVenda()) : "";
            String textoBotao = (produto == null) ? "Adicionar Produto" : "Alterar Produto";
        %>

        <form action="ServletProdutoFC" method="POST" class="form mt-3">
            <input type="hidden" name="acao" value="<%= acao %>">
            
            <% if (produto != null) { %>
                <input type="hidden" name="id" value="<%= id %>">
            <% } %>

            <div class="mb-3">
                <label class="form-label">Nome:</label>
                <input type="text" name="nome" value="<%= nome %>" class="form-control">
            </div>
            
            <div class="mb-3">
                <label class="form-label">Quantidade:</label>
                <input type="text" name="quantidade" value="<%= quantidade %>" class="form-control">
            </div>
            
            <div class="mb-3">
                <label class="form-label">Preco de Venda:</label>
                <input type="text" name="precoVenda" value="<%= preco %>" class="form-control">
            </div>
            
            <button type="submit" class="btn btn-primary"><%= textoBotao %></button>
        </form>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>