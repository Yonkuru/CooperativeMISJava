package com.coops.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.coops.classes.DBCon;
import com.coops.classes.MemberAccount;
import com.coops.classes.Payment;

public class PaymentDao {
	public static int savePayment(Payment py) {
		int saved = 0;
		int savepay = 0;
		try {
			Connection con= DBCon.getCon();
			PreparedStatement stm= con.prepareStatement("INSERT INTO tbl_payments (pay_acc_id, pay_amount, pay_date) VALUES (?, ?, ?)");
			stm.setInt(1, py.getAccount());
			stm.setDouble(2, py.getAmount());
			stm.setString(3, py.getRegDate());
			savepay = stm.executeUpdate();
			if(savepay > 0) {
				int mb_id = py.getMember();
				MemberAccount mac= MemberAccountDao.getAccountByMemberId(mb_id);
				double balance = mac.getBalance();
				double newBal = balance - py.getAmount();
				saved = MemberAccountDao.updateAccountBalance(mac.getId(), newBal);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return saved;
	}
}
