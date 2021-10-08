package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.coops.classes.DBCon;
import com.coops.classes.Member;
import com.coops.classes.MemberAccount;

public class MemberDao {
	public static int saveMember(Member mb) {
		int saved = 0;
		int save = 0;
		try {
			Connection connection = DBCon.getCon();
			PreparedStatement stm = connection.prepareStatement("INSERT INTO tbl_members (mbr_cooperative, mbr_firstname, mbr_lastname, mbr_phone, mbr_email, mbr_password, mbr_utype, mbr_registered_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			stm.setInt(1, mb.getCooperative());
			stm.setString(2, mb.getFirstname());
			stm.setString(3, mb.getLastname());
			stm.setString(4, mb.getPhone());
			stm.setString(5, mb.getEmail());
			stm.setString(6, mb.getPassword());
			stm.setInt(7, mb.getUserType());
			stm.setString(8, mb.getRegDate());
			save = stm.executeUpdate();
			
			if (save > 0) {
				int mid = 0;
				double balance = 0;
				ResultSet rs= stm.executeQuery("SELECT * FROM tbl_members");
				if (rs.last()) {
					mid = rs.getInt("mbr_id");
					MemberAccount mac = new MemberAccount();
					mac.setMemberId(mid);
					mac.setBalance(balance);
					mac.setRegDate(mb.getRegDate());
					saved = MemberAccountDao.saveAccount(mac);				
				}
			}						
		} catch (Exception e) {
			System.out.println(e);
		}
		return saved;
	}
	
	public static int countMembers() {
		int count = 0;
		try {
			Connection connection = DBCon.getCon();
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM tbl_members");
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				count += 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}
	
	public static List<Member> getAllMembers(){
		List<Member> mbList = new ArrayList<Member>();
		try {
			Connection connection = DBCon.getCon();
			PreparedStatement stm = connection.prepareStatement("SELECT tbl_members.mbr_id, tbl_members.mbr_cooperative, tbl_members.mbr_firstname, tbl_members.mbr_lastname, tbl_members.mbr_phone, tbl_members.mbr_email, tbl_members.mbr_password, tbl_members.mbr_utype, tbl_members.mbr_status, tbl_members.mbr_registered_date, tbl_cooperatives.cop_id, tbl_cooperatives.cop_name, tbl_user_types.utp_id, tbl_user_types.utp_desc\r\n"
					+ "FROM tbl_members \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "	LEFT JOIN tbl_user_types ON tbl_members.mbr_utype = tbl_user_types.utp_id");
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Member mb = new Member();
				mb.setId(rs.getInt("tbl_members.mbr_id"));
				mb.setCooperativeName(rs.getString("tbl_cooperatives.cop_name"));
				mb.setFirstname(rs.getString("tbl_members.mbr_firstname"));
				mb.setLastname(rs.getString("tbl_members.mbr_lastname"));
				mb.setPhone(rs.getString("tbl_members.mbr_phone"));
				mb.setEmail(rs.getString("tbl_members.mbr_email"));
				mb.setPassword(rs.getString("tbl_members.mbr_password"));
				mb.setUserTypeDesc(rs.getString("tbl_user_types.utp_desc"));
				mb.setStatus(rs.getInt("tbl_members.mbr_status"));
				mb.setRegDate(rs.getString("tbl_members.mbr_registered_date"));
				mbList.add(mb);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mbList;
	}
	
	public static Member countMembers(int cop_id){
		Member mb = null;
		int all = 0;
		int mbs = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_members WHERE mbr_cooperative = ?");
			stm.setInt(1, cop_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				int utype = rs.getInt("mbr_utype");
				if (utype == 2) {
					mbs += 1;
				}
				all += 1;
			}
			mb = new Member();
			int percent  = (mbs * 100)/all;
			mb.setMemberCount(all);
			mb.setMemberPercent(percent);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mb;
	}
	public static List<Member> getMembersByCopId(int cop_id){
		List<Member> mbList = new ArrayList<Member>();
		try {
			Connection connection = DBCon.getCon();
			PreparedStatement stm = connection.prepareStatement("SELECT tbl_members.mbr_id, tbl_members.mbr_cooperative, tbl_members.mbr_firstname, tbl_members.mbr_lastname, tbl_members.mbr_phone, tbl_members.mbr_email, tbl_members.mbr_password, tbl_members.mbr_utype, tbl_members.mbr_status, tbl_members.mbr_registered_date, tbl_cooperatives.cop_id, tbl_cooperatives.cop_name, tbl_user_types.utp_id, tbl_user_types.utp_desc\r\n"
					+ "FROM tbl_members \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "	LEFT JOIN tbl_user_types ON tbl_members.mbr_utype = tbl_user_types.utp_id\r\n"
					+ " WHERE tbl_members.mbr_cooperative = ?");
			stm.setInt(1, cop_id);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Member mb = new Member();
				mb.setId(rs.getInt("tbl_members.mbr_id"));
				mb.setCooperativeName(rs.getString("tbl_cooperatives.cop_name"));
				mb.setFirstname(rs.getString("tbl_members.mbr_firstname"));
				mb.setLastname(rs.getString("tbl_members.mbr_lastname"));
				mb.setPhone(rs.getString("tbl_members.mbr_phone"));
				mb.setEmail(rs.getString("tbl_members.mbr_email"));
				mb.setPassword(rs.getString("tbl_members.mbr_password"));
				mb.setUserTypeDesc(rs.getString("tbl_user_types.utp_desc"));
				mb.setStatus(rs.getInt("tbl_members.mbr_status"));
				mb.setRegDate(rs.getString("tbl_members.mbr_registered_date"));
				mbList.add(mb);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mbList;
	}
	public static Member getMemberById(int id) {
		Member mb = null;
		try {
			Connection connection = DBCon.getCon();
			PreparedStatement stm = connection.prepareStatement("SELECT tbl_members.mbr_id, tbl_members.mbr_cooperative, tbl_members.mbr_firstname, tbl_members.mbr_lastname, tbl_members.mbr_phone, tbl_members.mbr_email, tbl_members.mbr_password, tbl_members.mbr_utype, tbl_members.mbr_status, tbl_members.mbr_registered_date, tbl_cooperatives.cop_id, tbl_cooperatives.cop_name, tbl_user_types.utp_id, tbl_user_types.utp_desc\r\n"
					+ "FROM tbl_members \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "	LEFT JOIN tbl_user_types ON tbl_members.mbr_utype = tbl_user_types.utp_id\r\n"
					+ " WHERE tbl_members.mbr_id = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				mb = new Member();
				mb.setId(rs.getInt("tbl_members.mbr_id"));
				mb.setCooperative(rs.getInt("tbl_cooperatives.cop_id"));
				mb.setCooperativeName(rs.getString("tbl_cooperatives.cop_name"));
				mb.setFirstname(rs.getString("tbl_members.mbr_firstname"));
				mb.setLastname(rs.getString("tbl_members.mbr_lastname"));
				mb.setPhone(rs.getString("tbl_members.mbr_phone"));
				mb.setEmail(rs.getString("tbl_members.mbr_email"));
				mb.setPassword(rs.getString("tbl_members.mbr_password"));
				mb.setUserType(rs.getInt("tbl_user_types.utp_id"));
				mb.setUserTypeDesc(rs.getString("tbl_user_types.utp_desc"));
				mb.setStatus(rs.getInt("tbl_members.mbr_status"));
				mb.setRegDate(rs.getString("tbl_members.mbr_registered_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mb;
	}
	
	public static Member login(String email, String password) {
		Member mb = null;
		try {
			Connection con = DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_members.mbr_id, tbl_members.mbr_cooperative, tbl_members.mbr_firstname, tbl_members.mbr_lastname, tbl_members.mbr_phone, tbl_members.mbr_email, tbl_members.mbr_password, tbl_members.mbr_utype, tbl_members.mbr_status, tbl_members.mbr_registered_date, tbl_cooperatives.cop_id, tbl_cooperatives.cop_name, tbl_user_types.utp_id, tbl_user_types.utp_desc\r\n"
					+ "FROM tbl_members \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "	LEFT JOIN tbl_user_types ON tbl_members.mbr_utype = tbl_user_types.utp_id\r\n"
					+ " WHERE tbl_members.mbr_email = ? AND tbl_members.mbr_password = ?");
			
			stm.setString(1, email);
			stm.setString(2, password);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				mb = new Member();
				mb.setId(rs.getInt("tbl_members.mbr_id"));
				mb.setCooperative(rs.getInt("tbl_cooperatives.cop_id"));
				mb.setCooperativeName(rs.getString("tbl_cooperatives.cop_name"));
				mb.setFirstname(rs.getString("tbl_members.mbr_firstname"));
				mb.setLastname(rs.getString("tbl_members.mbr_lastname"));
				mb.setPhone(rs.getString("tbl_members.mbr_phone"));
				mb.setEmail(rs.getString("tbl_members.mbr_email"));
				mb.setPassword(rs.getString("tbl_members.mbr_password"));
				mb.setUserType(rs.getInt("tbl_user_types.utp_id"));
				mb.setUserTypeDesc(rs.getString("tbl_user_types.utp_desc"));
				mb.setStatus(rs.getInt("tbl_members.mbr_status"));
				mb.setRegDate(rs.getString("tbl_members.mbr_registered_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mb;
	}
	
	public static int updateMember(Member mb) {
		int updated = 0;
		try {
			Connection con = DBCon.getCon();
			PreparedStatement stm = con.prepareStatement("UPDATE tbl_members SET mbr_cooperative = ?, mbr_firstname = ?, mbr_lastname = ?, mbr_phone = ?, mbr_email = ?, mbr_password = ?, mbr_utype = ? WHERE mbr_id = ?");
			stm.setInt(1, mb.getCooperative());
			stm.setString(2, mb.getFirstname());
			stm.setString(3, mb.getLastname());
			stm.setString(4, mb.getPhone());
			stm.setString(5, mb.getEmail());
			stm.setString(6, mb.getPassword());
			stm.setInt(7, mb.getUserType());
			stm.setInt(8, mb.getId());
			updated = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return updated;
	}
	
	public static int deleteMember(Member mb) {
		int deleted = 0;
		try {
			Connection con = DBCon.getCon();
			PreparedStatement stm = con.prepareStatement("DELETE FROM tbl_members WHERE mbr_id = ?");
			stm.setInt(1, mb.getId());
			deleted = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return deleted;
	}
}
