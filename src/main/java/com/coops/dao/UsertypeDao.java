package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coops.classes.DBCon;
import com.coops.classes.Usertype;

public class UsertypeDao {
	
	public static List<Usertype> getUsertypes(){
		List<Usertype> utlist = new ArrayList<Usertype>();
		try {
			Connection con = DBCon.getCon();
			PreparedStatement stm = con.prepareStatement("SELECT * FROM tbl_user_types");
			ResultSet result = stm.executeQuery();
			while(result.next()) {
				Usertype ut = new Usertype();
				ut.setId(result.getInt("utp_id"));
				ut.setDescription(result.getString("utp_desc"));
				utlist.add(ut);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return utlist;
	}
}
