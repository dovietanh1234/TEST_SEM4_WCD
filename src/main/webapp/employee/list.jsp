<%@ page import="com.rs.demo.entities.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/28/2024
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students</title>
</head>
<body>
<div class="container">
    <h1>List Student Demo</h1>
    <a href="create-student">Create</a>
    <!--  Table students -->
    <table class="table">
        <thead>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>phone_number</th>
        <th>birth day</th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <% for (Employee s : (List<Employee>)request.getAttribute("employee")){ %>
        <tr>
            <td><%= s.getEmployee_id()  %></td>
            <td><%= s.getEmployee_name()  %></td>
            <td><%= s.getEmail()  %></td>
            <td><%= s.getPhone_number()  %></td>
            <td><%= s.getBirthday()  %></td>
            <td>
            </td>
            <td><a href="edit-employee?id=<%= s.getEmployee_id() %>">Edit</a> </td>
            <td><a class="text-danger" onclick="deleteStudent(<%= s.getEmployee_id() %>)" href="javascript:void(0);">Delete</a> </td>
            <td><a class="text-success" onclick="likeStudent(<%= s.getEmployee_id() %>)" href="javascript:void(0);">Like</a> </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function deleteStudent(id) {
        if(confirm("Are you sure?")) {
            var url = `list-employee?id=` + id;
            fetch(url, {
                method: 'DELETE'
                // body: formData
            }).then(rs => {
                if (confirm("Delete successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
    function likeStudent(id){
        if(confirm("Are you sure?")) {
            var url = `list-employee?id=` + id;
            fetch(url, {
                method: 'POST'
                // body: formData
            }).then(rs => {
                if (confirm("Like employee successfully! Reload page?"))
                    window.location.reload();
            }).error(err => {
                alert(err)
            })
        }
    }
</script>
</body>
</html>
