package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.coops.classes.DBCon;
import com.coops.classes.Message;

public class MessageDao {
	public static int saveMessage(Message msg, int cop_id) {
		int saved = 0;
		int msid = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("INSERT INTO tbl_message (msg_cooperative, msg_title, msg_content, msg_date) VALUES(?, ?, ?, ?)");
			stm.setInt(1, cop_id);
			stm.setString(2, msg.getTitle());
			stm.setString(3, msg.getMessage());
			stm.setString(4, msg.getRegDate());
			saved = stm.executeUpdate();
			
			if (saved > 0) {
				
				ResultSet rs= stm.executeQuery("SELECT * FROM tbl_message");
				if(rs.last()) {
					msid = rs.getInt("msg_id");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return msid;
	}
}
