package org.gwu.dao;

import java.sql.Connection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.gwu.db.DataBaseManager;

public abstract class AbstractDAO {
	protected final Log log=LogFactory.getLog(getClass());
	private Connection conn;
	
	/**
	 * get connection from data connection pool
	 */
	public Connection getConnection(){
		return conn=DataBaseManager.getConnection();
	}
	
	/**
	 * relase connection
	 */
	public void releaseConnection(){
		DataBaseManager.releaseConnection(conn);
	}
}
