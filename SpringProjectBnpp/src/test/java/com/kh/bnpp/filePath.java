package com.kh.bnpp;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class filePath {

	public static void main(String[] args)  {
		
		String resource = "config/config.properties";
		Properties properties = new Properties();
		
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
			
			
			System.out.println(properties.getProperty("imgfile.path")+"insub.png");
			System.out.println(properties.getProperty("videofile.path"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
