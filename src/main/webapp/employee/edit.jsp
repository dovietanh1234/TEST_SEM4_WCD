<%@ page import="com.rs.demo.entities.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/28/2024
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>employee</title>
</head>
<body>
<div class="container">
    <h1>Add Student Demo</h1>
    <!--  Table students -->
    <div class="row">
        <div class="col-6">
            <% Employee student = (Employee) request.getAttribute("employee"); %>
            <form method="post" action="edit-student?id=<%= student.getEmployee_id() %>">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Full name</label>
                    <input type="name" value="<%= student.getEmployee_name() %>" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="email" value="<%= student.getEmail() %>" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">phoneNumber</label>
                    <input type="text" name="phone" value="<%= student.getPhone_number() %>" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>
