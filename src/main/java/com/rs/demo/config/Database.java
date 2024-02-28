package com.rs.demo.config;


import java.sql.*;

public class Database {
    private final String connectionString = "jdbc:mysql://localhost:3306/demot2207a";

    private final String user = "root";
    private final String password = "123456";
    private Connection conn;

    private static Database _instance;
    private Database() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(connectionString,user,password);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    public static Database getInstance(){
        if(_instance == null)
            _instance = new Database();
        return _instance;
    }

    public Statement getStatement() throws SQLException {
        return conn.createStatement();
    }

    public PreparedStatement getPreparedStatement(String sql) throws SQLException {
        return  conn.prepareStatement(sql);
    }
}
