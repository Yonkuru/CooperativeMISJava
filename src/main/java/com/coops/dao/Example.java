package com.coops.dao;

import com.twilio.Twilio; 
//import com.twilio.converter.Promoter; 
import com.twilio.rest.api.v2010.account.Message; 
import com.twilio.type.PhoneNumber; 
 
//import java.net.URI; 
//import java.math.BigDecimal; 
 
public class Example { 
    // Find your Account Sid and Token at twilio.com/console 
    public static final String ACCOUNT_SID = "AC0ea37f737608eeff29215449d040e6e5"; 
    public static final String AUTH_TOKEN = "edb7ac3f6c776bd465616f77ad0d678c"; 
 
    public static void main(String[] args) { 
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN); 
        Message message = Message.creator( 
                new PhoneNumber("+250783821750"),
                "MG306f41a9868e0563f26c24a15c74f642",
                "Uratumiwe mu nama ejo.")      
            .create(); 
 
        System.out.println(message.getSid()); 
    } 
}
