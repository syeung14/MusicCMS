package org.gwu.dao.sqlserver;

import org.gwu.dao.IDaoFactory;
import org.gwu.dao.IMusicDao;
import org.gwu.dao.IUserDao;

public class SqlServerDaoFactory implements IDaoFactory {

	@Override
	public IMusicDao getMusicDao() {
		return new SqlServerMusicDao();
	}

	@Override
	public IUserDao getUserDao() {
		return new SqlServerUserDao();
	}
	
	

}
