package org.gwu.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.gwu.db.DataBaseManager;

public class PropManager{
	private static PropManager instance;
	private Properties prop;
	private PropManager()
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
	
	public static synchronized PropManager getInstance()
	{
		if (instance == null)
			instance = new PropManager();
		return instance;
	}
	
	public String getProperty(String name)
	{
		return prop.getProperty(name);
	}
}
