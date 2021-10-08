package com.coops.dao;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Notification {
	public static final String ACCOUNT_SID = "AC0ea37f737608eeff29215449d040e6e5"; 
    public static final String AUTH_TOKEN = "edb7ac3f6c776bd465616f77ad0d678c";
    
	public static int sendStockMessage(String phone,String firstname, String lastname, double quantity, double uPrice, double balance) {
		int sent = 0;
		String messageText = firstname + " " + lastname + ", uzanye ibiro " + quantity + ", Rwf " + uPrice + " / kilo. Ubu ufite Rwf " + balance + " kuri konti yawe. IPCCCI System.";
		
		
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN); 
        Message message = Message.creator(new PhoneNumber(phone), "MG306f41a9868e0563f26c24a15c74f642", messageText)      
            .create();
        if (message != null) {
			sent = 1;
		}
		
		return sent;
	}
	
	public static int sendPaymentMessage(String phone,String firstname, String lastname, double amount, double balance) {
		int sent = 0;
		String messageText = firstname + " " + lastname + ", wishyuwe Rwf " + amount + ". Ubu usigaranye Rwf " + balance + " kuri konti yawe. IPCCCI System.";
		
		
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN); 
        Message message = Message.creator(new PhoneNumber(phone), "MG306f41a9868e0563f26c24a15c74f642", messageText)      
            .create();
        if (message != null) {
			sent = 1;
		}
		
		return sent;
	}
}
