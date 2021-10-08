package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coops.classes.Announcement;
import com.coops.classes.DBCon;

public class AnnouncementDao {
	public static int saveAnnouncement(int msg_id, int  mbr_id) {
		int saved = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("INSERT INTO tbl_announcement(ano_message_id, ano_member) VALUES(?, ?)");
			stm.setInt(1, msg_id);
			stm.setInt(2, mbr_id);
			saved = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return saved;
	}
	
	public static Announcement getCounts(int mbr_id) {
		Announcement an= null;
		int all = 0;
		int read = 0;
		int unread = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_announcement WHERE ano_member = ?");
			stm.setInt(1, mbr_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				int status = rs.getInt("ano_status");
				if(status == 1) {
					read += 1;
				}else {
					unread += 1;
				}
				all += 1;
			}
			an = new Announcement();
			an.setReadCount(read);
			an.setUnreadCount(unread);
			an.setAllCount(all);
		} catch (Exception e) {
			System.out.println(e);
		}
		return an;
	}
	public static int setRead(int ano_id) {
		int updated = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("UPDATE tbl_announcement SET ano_status = 1 WHERE ano_id = ?");
			stm.setInt(1, ano_id);
			updated = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return updated;
	}
	public static Announcement getAnnouncementById(int ano_id) {
		Announcement an= null;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_announcement.*, tbl_message.*, tbl_announcement.ano_member\r\n"
					+ "FROM tbl_announcement \r\n"
					+ "	LEFT JOIN tbl_message ON tbl_announcement.ano_message_id = tbl_message.msg_id\r\n"
					+ "WHERE tbl_announcement.ano_id = ? \r\n"
					+ " ORDER BY tbl_message.msg_date DESC");
			stm.setInt(1, ano_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				an= new Announcement();
				an.setId(rs.getInt("tbl_announcement.ano_id"));
				an.setMessageId(rs.getInt("tbl_announcement.ano_message_id"));
				an.setMember(rs.getInt("tbl_announcement.ano_member"));
				an.setStatus(rs.getInt("tbl_announcement.ano_status"));
				an.setTitle(rs.getString("tbl_message.msg_title"));
				an.setMessage(rs.getString("tbl_message.msg_content"));
				an.setRegDate(rs.getString("tbl_message.msg_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return an;
	}
	public static List<Announcement> getAllAnnouncements(int mbr_id){
		List<Announcement> anList = new ArrayList<Announcement>();
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_announcement.*, tbl_message.*, tbl_announcement.ano_member\r\n"
					+ "FROM tbl_announcement \r\n"
					+ "	LEFT JOIN tbl_message ON tbl_announcement.ano_message_id = tbl_message.msg_id\r\n"
					+ "WHERE tbl_announcement.ano_member = ? \r\n"
					+ " ORDER BY tbl_message.msg_date DESC");
			stm.setInt(1, mbr_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				Announcement an= new Announcement();
				an.setId(rs.getInt("tbl_announcement.ano_id"));
				an.setMessageId(rs.getInt("tbl_announcement.ano_message_id"));
				an.setMember(rs.getInt("tbl_announcement.ano_member"));
				an.setStatus(rs.getInt("tbl_announcement.ano_status"));
				an.setTitle(rs.getString("tbl_message.msg_title"));
				an.setMessage(rs.getString("tbl_message.msg_content"));
				an.setRegDate(rs.getString("tbl_message.msg_date"));
				anList.add(an);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return anList;
	}
}
