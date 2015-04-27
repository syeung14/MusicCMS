package org.gwu.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.gwu.db.DataBaseManager;

public class PropLoader{
	private static PropLoader instance;
	private Properties prop;
	private PropLoader()
	{
		prop = new Properties();  
		InputStream is = null;
		is = DataBaseManager.class.getClassLoader()
				.getResourceAsStream("prop.properties");
		try {
			prop.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static synchronized PropLoader getInstance()
	{
		if (instance == null)
			instance = new PropLoader();
		return instance;
	}
	
	public String getProperty(String name)
	{
		return prop.getProperty(name);
	}
}
