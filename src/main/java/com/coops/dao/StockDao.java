package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coops.classes.DBCon;
import com.coops.classes.Stock;

public class StockDao {
	public static List<Stock> getStock(){
		List<Stock> stList = new ArrayList<Stock>();
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_stock");
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				Stock st = new Stock();
				st.setId(rs.getInt("stk_id"));
				st.setName(rs.getString("stk_name"));
				st.setQuantity(rs.getDouble("stk_quantity"));
				st.setStatus(rs.getInt("stk_status"));
				stList.add(st);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return stList;
	}
	public static Stock getStockById(int id) {
		Stock st= null;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("SELECT * FROM tbl_stock WHERE stk_id = ?");
			stm.setInt(1, id);
			ResultSet rs= stm.executeQuery();
			while (rs.next()) {
				st = new Stock();
				st.setId(rs.getInt("stk_id"));
				st.setName(rs.getString("stk_name"));
				st.setQuantity(rs.getDouble("stk_quantity"));
				st.setStatus(rs.getInt("stk_status"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return st;
	}
	public static int updateStockById(int id, double quantity) {
		int updated = 0;
		try {
			Stock st = getStockById(id);
			double qty = st.getQuantity();
			double newQuantity = qty + quantity;
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("UPDATE tbl_stock SET stk_quantity = ? WHERE stk_id = ?");
			stm.setDouble(1, newQuantity);
			stm.setInt(2, id);
			updated = stm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return updated;
	}
}
