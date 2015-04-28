package org.gwu.dao.mysql;

import org.gwu.dao.IDaoFactory;
import org.gwu.dao.IMusicDao;
import org.gwu.dao.IUserDao;

public class MySqlDaoFactory implements IDaoFactory {

	@Override
	public IMusicDao getMusicDao() {
		return new MySqlMusicDao();
	}

	@Override
	public IUserDao getUserDao() {
		return new MySqlUserDAO();
	}

}
