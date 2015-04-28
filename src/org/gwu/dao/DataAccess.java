package org.gwu.dao;

import org.gwu.utils.PropManager;

public class DataAccess {

	private static String dbType = PropManager.getInstance().getProperty("database.used");
	private static IDaoFactory daoFactory = DaoFactories.getDBFactory(dbType);
	
	
	public static IMusicDao getMusicDao() {
		
		return daoFactory.getMusicDao();
		
	}
	
	
	public static IUserDao getUserDao() {
		return daoFactory.getUserDao();
	}
	
}
