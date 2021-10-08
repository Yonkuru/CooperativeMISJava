package com.coops.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.coops.classes.Cooperative;



public class CoopDao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cooperative","root","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static int saveCoop(Cooperative co) {
		int status=0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO tbl_cooperatives (cop_name, cop_email, cop_address, cop_username, cop_password, cop_registered_date) VALUES(?, ?, ?, ?, ?, ?)");
			ps.setString(1, co.getName());
			ps.setString(2, co.getEmail());
			ps.setString(3, co.getAddress());
			ps.setString(4, co.getUsername());
			ps.setString(5, co.getPassword());
			ps.setString(6, co.getRegDate());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int countCooperatives() {
		int count = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM tbl_cooperatives");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count += 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}
	public static List<Cooperative> getAllCooperatives(){
		List<Cooperative> list = new ArrayList<Cooperative>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM tbl_cooperatives");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cooperative co = new Cooperative();
				co.setId(rs.getInt("cop_id"));
				co.setName(rs.getString("cop_name"));
				co.setEmail(rs.getString("cop_email"));
				co.setAddress(rs.getString("cop_address"));
				co.setUsername(rs.getString("cop_username"));
				co.setRegDate(rs.getString("cop_registered_date"));
				list.add(co);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	public static Cooperative getCooperativeById(int id) {
		Cooperative co = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM tbl_cooperatives WHERE cop_id =?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				co = new Cooperative();
				co.setId(rs.getInt("cop_id"));
				co.setName(rs.getString("cop_name"));
				co.setEmail(rs.getString("cop_email"));
				co.setAddress(rs.getString("cop_address"));
				co.setUsername(rs.getString("cop_username"));
				co.setPassword(rs.getString("cop_password"));
				co.setRegDate(rs.getString("cop_registered_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return co;
	}
	
	public static Cooperative login(String username, String password) {
		Cooperative co = null;
		try {
			Connection con= getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM tbl_cooperatives WHERE cop_username = ? AND cop_password = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs= ps.executeQuery();
			while (rs.next()) {
				co = new Cooperative();
				co.setId(rs.getInt("cop_id"));
				co.setName(rs.getString("cop_name"));
				co.setEmail(rs.getString("cop_email"));
				co.setAddress(rs.getString("cop_address"));
				co.setUsername(rs.getString("cop_username"));
				co.setPassword(rs.getString("cop_password"));
				co.setRegDate(rs.getString("cop_registered_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return co;
	}
	public static int updateCooperative(Cooperative co) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE tbl_cooperatives SET cop_name = ?, cop_email = ?, cop_address = ?, cop_username = ?, cop_password = ? WHERE cop_id = ?");
			ps.setString(1, co.getName());
			ps.setString(2, co.getEmail());
			ps.setString(3, co.getAddress());
			ps.setString(4, co.getUsername());
			ps.setString(5, co.getPassword());
			ps.setInt(6, co.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int deleteCooperative(Cooperative co) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM tbl_cooperatives WHERE cop_id = ?");
			ps.setInt(1, co.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
}
