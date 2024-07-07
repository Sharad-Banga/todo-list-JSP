<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.http.*" %>

<html>
<head>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1c1c2d;
            color: #eaeaea;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        form {
            background: #2c2c3c;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
            max-width: 500px;
        }
        h2 {
            color: #d4af37; /* Royal gold */
            margin-top: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: none;
            border-radius: 5px;
            background-color: #34344a;
            color: #eaeaea;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
            font-size: 16px;
        }
        input[type="submit"] {
            padding: 12px 24px;
            border: none;
            background-color: #6b3fa0; /* Royal purple */
            color: #eaeaea;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #8254b3;
        }
        ol {
            margin: 20px;
            padding: 0;
            list-style-position: inside;
            width: 80%;
            max-width: 500px;
        }
        li {
            background: #2c2c3c;
            padding: 12px;
            margin: 12px 0;
            border-radius: 5px;
            color: #eaeaea;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        a {
            color: #d4af37; /* Royal gold */
            text-decoration: none;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #c19d28;
        }
    </style>
</head>
<body>
<h2>Sharad's ToDo List</h2>
    <form method="post" action="todo-demo.jsp">
        Add new item : <input type="text" name="theItem" />
        <input type="submit" value="Submit" />
    </form>

    <h2>ToDo List Items :</h2>
    <%
        // Get or create the list of items from session
        List<String> items = (List<String>) session.getAttribute("myToDoList");
        if (items == null) {
            items = new ArrayList<>();
            session.setAttribute("myToDoList", items);
        }

        // Handle adding new item and deleting item
        String newItem = request.getParameter("theItem");
        String deleteItem = request.getParameter("deleteItem");

        if (newItem != null && !newItem.isEmpty()) {
            items.add(newItem);
        } else if (deleteItem != null) {
            items.remove(deleteItem);
        }
    %>

    <ol>
        <% if (!items.isEmpty()) {
            for (String item : items) { %>
                <li><%= item %> <a href='todo-demo.jsp?deleteItem=<%= item %>'>Delete</a></li>
            <% }
        } %>
    </ol>
</body>
</html>
