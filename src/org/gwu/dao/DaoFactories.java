package org.gwu.dao;

import org.gwu.dao.mysql.MySqlDaoFactory;
import org.gwu.dao.sqlserver.SqlServerDaoFactory;

public class DaoFactories {


	public static IDaoFactory getDBFactory(String dbName) {
		
		switch (dbName) {
		case "sqlserver":
			return new SqlServerDaoFactory();
		case "mysql":
		default:
			return new MySqlDaoFactory();
		}
	}

}
