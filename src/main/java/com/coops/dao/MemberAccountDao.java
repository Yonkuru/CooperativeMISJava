package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.coops.classes.DBCon;
import com.coops.classes.MemberAccount;

public class MemberAccountDao {
	public static int saveAccount(MemberAccount mac) {
		int saved = 0;
		try {
			Connection con = DBCon.getCon();
			PreparedStatement stm = con.prepareStatement("INSERT INTO tbl_member_account (acc_member_id, acc_balance, acc_created_date) VALUES(?, ?, ?)");
			
			stm.setInt(1, mac.getMemberId());
			stm.setDouble(2, mac.getBalance());
			stm.setString(3, mac.getRegDate());
			
			saved = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return saved;
	}
	public static double getMemberBalance(int mbr_id) {
		double balance = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_member_account WHERE acc_member_id = ?");
			stm.setInt(1, mbr_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				balance += rs.getDouble("acc_balance");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return balance;
	}
	public static MemberAccount getAccountByMemberId(int mid) {
		MemberAccount mac= null;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_member_account WHERE acc_member_id = ?");
			stm.setInt(1, mid);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				mac = new MemberAccount();
				mac.setId(rs.getInt("acc_id"));
				mac.setMemberId(rs.getInt("acc_member_id"));
				mac.setBalance(rs.getDouble("acc_balance"));
				mac.setStatus(rs.getInt("acc_status"));
				mac.setRegDate(rs.getString("acc_created_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mac;
	}
	public static int updateAccountBalance(int id, double newBal) {
		int updated = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("UPDATE tbl_member_account SET acc_balance = ? WHERE acc_id = ?");
			stm.setDouble(1, newBal);
			stm.setInt(2, id);
			updated = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return updated;
	}
}
