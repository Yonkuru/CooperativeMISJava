package com.coops.classes;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBCon {

    public static Connection getCon() {
    	Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cooperative","root","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
    }
}
