package com.kh.bnpp.sms;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


public class SMS {

	public static void sendSMS(String phonenumber, String content) throws UnsupportedEncodingException {
		String hostNameUrl = "https://sens.apigw.ntruss.com";				// ȣ��Ʈ URL
		String requestUrl = "/sms/v2/services/";							// ��û URL
		String requestUrlType = "/messages";								// ��û URL
		String accessKey = "MgnNQBLZWYDmVIWB9A86";							// ����Ű(���̹� Ŭ���� �÷������� �޾ƿ�)			
		String secretKey = "bukxizrgBdgLY4Gs6qIynKtLnqOeLjfCrNoS9Lh5";		// ���Ű(���̹� Ŭ���� �÷������� �޾ƿ�)
		String serviceId = "ncp:sms:kr:266284043003:semiproject";			// ����id(���̹� Ŭ���� �÷������� �޾ƿ�)
		String timestamp = Long.toString(System.currentTimeMillis());
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		JsonObject bodyJson = new JsonObject();
		JsonObject toJson = new JsonObject();
		JsonArray Jsarr = new JsonArray();
			    
		// json �������� �޽��� ���� ��û
		
		toJson.addProperty("to", phonenumber);			// ���Ź�ȣ
		toJson.addProperty("subject", "test");			// �޽��� ���� (����ȵ�/lms�� ����)
		toJson.addProperty("content", content);  		// �޽��� ����	(��������)
		Jsarr.add(toJson);	
		
		bodyJson.addProperty("type", "SMS");			// �޽��� type sms/lms
		bodyJson.addProperty("contentType", "COMM");	// �޽��� ���� type ad/comm
		bodyJson.addProperty("countryCode", "82");		// ���� ��ȭ��ȣ
		bodyJson.addProperty("from", "01064244977");	// �߽Ź�ȣ (������ ����/��ϵ� ��ȣ�� ��밡��)
		bodyJson.addProperty("subject", "test");		// �޽��� ����(����ȵ�/lms�� ����)
		bodyJson.addProperty("content", "test2");		// �޽��� ����
		bodyJson.add("messages", Jsarr);
		
		String body = bodyJson.toString();
		
		System.out.println(body);
		System.out.println(requestUrl);
		System.out.println(apiUrl);
		
		try {	
			URL url = new URL(apiUrl);
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("POST");	

			urlConnection.setRequestProperty("Content-Type", "application/json");
			urlConnection.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			urlConnection.setRequestProperty("x-ncp-iam-access-key", accessKey);
			urlConnection.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, accessKey, secretKey));
			urlConnection.setDoInput(true);
			urlConnection.setUseCaches(false);
			urlConnection.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(urlConnection.getOutputStream());
			
			wr.write(body.getBytes());
			wr.flush();
			wr.close();
			
			int responseCode = urlConnection.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			System.out.println("responsemessage : " + urlConnection.getResponseMessage());
			if(responseCode==202) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));	
			} else { // ���� �߻�
				br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response.toString());
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	// sens api ���� �ñ״�ó Ű ����
	public static String makeSignature(String url, String timestamp, String accessKey, String secretKey) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
		String space = " ";					
		String newLine = "\n";				
		String method = "POST";
		
		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256"); 
		Mac mac = Mac.getInstance("HmacSHA256"); 
		mac.init(signingKey); 
		
		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8")); 
		String encodeBase64String = Base64.encodeBase64String(rawHmac);
		
	  return encodeBase64String;
	}
	
	public static String compareDate(String date) throws ParseException {
		// 3�� �ʰ��� ������ 0
		Calendar cal = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date foodlife = sdf.parse(date);
	    Date sysdate1 = new Date(System.currentTimeMillis()); 
	    String sys = sdf.format(sysdate1);
	    Date sysdate = sdf.parse(sys);
	    
	    int res = foodlife.compareTo(sysdate);

	    if (res == 0) {
	    	return "��������� ���ñ��� �Դϴ�.";
	    }
	    
	    if (res < 0) {
	    	return "��������� �������ϴ�.";
	    }
	    
	    cal.setTime(foodlife);
	    cal.add(Calendar.DATE, -3);
	    foodlife = cal.getTime();
	    
	    res = sysdate.compareTo(foodlife);

	    if (res >= 0) {
    		return "��������� 3�� �̳��� ���ҽ��ϴ�.";
    	} else {
    		return "0";
    	}    
	}
	
}