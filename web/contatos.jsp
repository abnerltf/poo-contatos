<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.poo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<User> userList = (ArrayList)application.getAttribute("contatos");
    if (userList == null) userList = new ArrayList();
    
    if (request.getParameter("add")!=null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        userList.add(new User(name, email, password));
        
        if (userList.size() == 1) { 
            application.setAttribute("contatos", userList);
        }
        
        response.sendRedirect(request.getRequestURI());
    }
    if (request.getParameter("remove") != null) {
        int i = Integer.parseInt(request.getParameter("i"));
        userList.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contatos</title>
    </head>
    <body>
        <h1>Contatos</h1>
        <form>
            <div>Name: <input type="text" name="name" /></div>
            <div>Email: <input type="text" name="email" /></div>
            <div>Senha: <input type="password" name="password" /></div>
            <input type="submit" value="Adicionar" name="add" />
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Ações</th>
            </tr>
            <%for (int i=0; i < userList.size(); i++) {%>
            <tr>
                <td><%= i %></td>
                <% User u = userList.get(i); %>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%= i %>"/>
                        <input type="submit" name="remove" value="Remover"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
