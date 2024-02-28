package com.rs.demo.controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

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
import java.util.List;
@WebServlet("/create-employee")
public class EmpoyeeEditController extends HttpServlet {
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
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee student = session.get(Employee.class,Integer.parseInt(entityId));
            session.getTransaction().commit();
            if(student != null) {
                req.setAttribute("employee", student);
                req.getRequestDispatcher("employee/edit.jsp").forward(req, resp);
            }else
                resp.setStatus(404);
        }catch (Exception e){
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee student = session.get(Employee.class,Integer.parseInt(entityId));
            if(student != null) {
                student.setPhone_number(req.getParameter("phone"));
                student.setEmail(req.getParameter("email"));
                student.setEmployee_name(req.getParameter("name"));
                // update to DB
                session.update(student);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-student");
        }catch (Exception e){
            resp.setStatus(500);
        }
    }


}
