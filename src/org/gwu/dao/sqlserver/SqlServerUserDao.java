package org.gwu.dao.sqlserver;

import java.util.List;

import org.gwu.dao.IUserDao;
import org.gwu.model.User;

import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class SqlServerUserDao implements IUserDao {

	@Override
	public boolean insert(User user) {
		throw new NotImplementedException();
	}

	@Override
	public void delete(String userId) {

		throw new NotImplementedException();
	}

	@Override
	public void update(User user) {
		throw new NotImplementedException();
	}

	@Override
	public User checkUser(User user) {
		throw new NotImplementedException();
	}

	@Override
	public User checkUser(String username, String password) {
		throw new NotImplementedException();
	}

	@Override
	public List<User> findAll() {
		throw new NotImplementedException();
	}

	@Override
	public List<User> getPageData(int startindex, int pagesize) {
		throw new NotImplementedException();
	}

	@Override
	public int getTotalrecord() {
		throw new NotImplementedException();
	}

	@Override
	public User findUser(String userId) {
		throw new NotImplementedException();
	}

}
