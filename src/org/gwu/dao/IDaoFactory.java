package org.gwu.dao;

public interface IDaoFactory {
	public IMusicDao getMusicDao();
	public IUserDao getUserDao();

}
