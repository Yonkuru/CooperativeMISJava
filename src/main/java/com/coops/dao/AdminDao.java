package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.coops.classes.Admin;
import com.coops.classes.DBCon;

public class AdminDao {
	public static Admin login(String username, String password) {
		Admin admin = null;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_admin WHERE adm_username = ? AND adm_password = ?");
			stm.setString(1, username);
			stm.setString(2, password);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt("adm_id"));
				admin.setUsername(rs.getString("adm_username"));
				admin.setPassword(rs.getString("adm_password"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return admin;
	}
}
