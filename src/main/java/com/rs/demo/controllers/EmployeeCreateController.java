package com.rs.demo.controllers;


import com.rs.demo.entities.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/create-employee")
public class EmployeeCreateController extends HttpServlet {
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Employee> classesList = new ArrayList<>();
        // query db
        try(Session session = sessionFactory.openSession()){
            session.beginTransaction();
            classesList = session.createQuery("FROM Employee",Employee.class).getResultList();
            session.getTransaction().commit();
        }
        req.setAttribute("employeeList",classesList);
        req.getRequestDispatcher("employee/form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee student = new Employee();
        student.setEmployee_id(req.getParameter("employee_id"));
        student.setEmployee_name(req.getParameter("name"));
        student.setEmail(req.getParameter("email"));
        student.setPhone_number(req.getParameter("phone_number"));

        try(Session session = sessionFactory.openSession()){
            session.beginTransaction();

            session.save(student);
            session.getTransaction().commit();

        }catch (Exception e){
            resp.setStatus(500);
        }

        resp.sendRedirect("list-employee");
    }




}