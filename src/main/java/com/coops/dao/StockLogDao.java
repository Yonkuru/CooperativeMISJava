package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coops.classes.DBCon;
import com.coops.classes.MemberAccount;
import com.coops.classes.StockLog;

public class StockLogDao {
	public static int saveStockLog(StockLog sl) {
		int saved = 0;
		int saveLog = 0;
		int updateAcc = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("INSERT INTO tbl_stock_logs (stl_acc_id, stl_stock_id, stl_quantity, stl_u_price, stl_date) VALUES(?, ?, ?, ?, ?)");
			stm.setInt(1, sl.getAccount());
			stm.setInt(2, sl.getStock());
			stm.setDouble(3, sl.getQuantity());
			stm.setDouble(4, sl.getuPrice());
			stm.setString(5, sl.getRegDate());
			saveLog = stm.executeUpdate();
			if (saveLog > 0) {
				int mb_id = sl.getMember();
				MemberAccount mac= MemberAccountDao.getAccountByMemberId(mb_id);
				double balance = mac.getBalance();
				double t_price = sl.getQuantity() * sl.getuPrice();
				double newBal = balance + t_price;
				updateAcc = MemberAccountDao.updateAccountBalance(mac.getId(), newBal);
				if (updateAcc > 0) {
					saved = StockDao.updateStockById(sl.getStock(), sl.getQuantity());
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return saved;
	}
	public static int countMyLogs(int acc_id) {
		int count = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_stock_logs WHERE stl_acc_id = ?");
			stm.setInt(1, acc_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				count += 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}
	public static int countMemberLogs(int acc_id) {
		int count = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_stock_logs WHERE stl_acc_id = ?");
			stm.setInt(1, acc_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				count = 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}
	public static int countLogsByCop(int cop_id) {
		int count = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_stock_logs.*, tbl_member_account.*, tbl_stock.*, tbl_members.*, tbl_cooperatives.*, tbl_cooperatives.cop_id\r\n"
					+ "FROM tbl_stock_logs\r\n"
					+ "	LEFT JOIN tbl_member_account ON tbl_stock_logs.stl_acc_id = tbl_member_account.acc_id \r\n"
					+ "	LEFT JOIN tbl_stock ON tbl_stock_logs.stl_stock_id = tbl_stock.stk_id \r\n"
					+ "	LEFT JOIN tbl_members ON tbl_member_account.acc_member_id = tbl_members.mbr_id \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "WHERE tbl_cooperatives.cop_id = ?");
			stm.setInt(1, cop_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				count += 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}
	public static List<StockLog> getLogsByMemberAcc(int acc_id){
		List<StockLog> stList = new ArrayList<StockLog>();
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_stock_logs.*, tbl_member_account.*, tbl_stock.*, tbl_members.*, tbl_cooperatives.*, tbl_cooperatives.cop_id\r\n"
					+ "FROM tbl_stock_logs\r\n"
					+ "	LEFT JOIN tbl_member_account ON tbl_stock_logs.stl_acc_id = tbl_member_account.acc_id \r\n"
					+ "	LEFT JOIN tbl_stock ON tbl_stock_logs.stl_stock_id = tbl_stock.stk_id \r\n"
					+ "	LEFT JOIN tbl_members ON tbl_member_account.acc_member_id = tbl_members.mbr_id \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "WHERE tbl_stock_logs.stl_acc_id = ?");
			stm.setInt(1, acc_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				StockLog sl= new StockLog();
				sl.setId(rs.getInt("tbl_stock_logs.stl_id"));
				sl.setMemberFirstname(rs.getString("tbl_members.mbr_firstname"));
				sl.setMemberLastname(rs.getString("tbl_members.mbr_lastname"));
				sl.setStockName(rs.getString("tbl_stock.stk_name"));
				sl.setQuantity(rs.getDouble("tbl_stock_logs.stl_quantity"));
				sl.setuPrice(rs.getDouble("tbl_stock_logs.stl_u_price"));
				sl.setRegDate(rs.getString("tbl_stock_logs.stl_date"));
				stList.add(sl);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return stList;
	}
	public static List<StockLog> getLogsByCopId(int cop_id){
		List<StockLog> stList = new ArrayList<StockLog>();
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_stock_logs.*, tbl_member_account.*, tbl_stock.*, tbl_members.*, tbl_cooperatives.*, tbl_cooperatives.cop_id\r\n"
					+ "FROM tbl_stock_logs\r\n"
					+ "	LEFT JOIN tbl_member_account ON tbl_stock_logs.stl_acc_id = tbl_member_account.acc_id \r\n"
					+ "	LEFT JOIN tbl_stock ON tbl_stock_logs.stl_stock_id = tbl_stock.stk_id \r\n"
					+ "	LEFT JOIN tbl_members ON tbl_member_account.acc_member_id = tbl_members.mbr_id \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "WHERE tbl_cooperatives.cop_id = ?");
			stm.setInt(1, cop_id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				StockLog sl= new StockLog();
				sl.setId(rs.getInt("tbl_stock_logs.stl_id"));
				sl.setMemberFirstname(rs.getString("tbl_members.mbr_firstname"));
				sl.setMemberLastname(rs.getString("tbl_members.mbr_lastname"));
				sl.setStockName(rs.getString("tbl_stock.stk_name"));
				sl.setQuantity(rs.getDouble("tbl_stock_logs.stl_quantity"));
				sl.setuPrice(rs.getDouble("tbl_stock_logs.stl_u_price"));
				sl.setRegDate(rs.getString("tbl_stock_logs.stl_date"));
				stList.add(sl);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return stList;
	} 
	public static StockLog getStockLogById(int cop_id, int id) {
		StockLog sLog = null;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT tbl_stock_logs.*, tbl_member_account.*, tbl_stock.*, tbl_members.*, tbl_cooperatives.*, tbl_cooperatives.cop_id\r\n"
					+ "FROM tbl_stock_logs\r\n"
					+ "	LEFT JOIN tbl_member_account ON tbl_stock_logs.stl_acc_id = tbl_member_account.acc_id \r\n"
					+ "	LEFT JOIN tbl_stock ON tbl_stock_logs.stl_stock_id = tbl_stock.stk_id \r\n"
					+ "	LEFT JOIN tbl_members ON tbl_member_account.acc_member_id = tbl_members.mbr_id \r\n"
					+ "	LEFT JOIN tbl_cooperatives ON tbl_members.mbr_cooperative = tbl_cooperatives.cop_id\r\n"
					+ "WHERE tbl_cooperatives.cop_id = ?\r\n"
					+ "AND tbl_stock_logs.stl_id = ?");
			stm.setInt(1, cop_id);
			stm.setInt(2, id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				sLog = new StockLog();
				sLog.setId(rs.getInt("tbl_stock_logs.stl_id"));
				sLog.setMemberFirstname(rs.getString("tbl_members.mbr_firstname"));
				sLog.setMemberLastname(rs.getString("tbl_members.mbr_lastname"));
				sLog.setStockName(rs.getString("tbl_stock.stk_name"));
				sLog.setQuantity(rs.getDouble("tbl_stock_logs.stl_quantity"));
				sLog.setuPrice(rs.getDouble("tbl_stock_logs.stl_u_price"));
				sLog.setRegDate(rs.getString("tbl_stock_logs.stl_date"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return sLog;
	}
}
