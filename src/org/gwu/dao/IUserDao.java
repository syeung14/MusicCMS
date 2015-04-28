package org.gwu.dao;

import java.util.List;

import org.gwu.model.User;

public interface IUserDao {

	/**
	 * insert a user
	 * @param record
	 */
	public abstract boolean insert(User user);

	/**
	 * delete a user
	 * @param record
	 * username,useremail,createdtime,is_admin
	 */
	public abstract void delete(String userId);

	public abstract void update(User user);

	/**
	 * validate a user with userName password
	 * @param record
	 */
	public abstract User checkUser(User user);

	/**
	 * validate a user with userName password
	 * @param record
	 */
	public abstract User checkUser(String username, String password);

	/**
	 * find all users
	 * @param record
	 */
	public abstract List<User> findAll();

	public abstract List<User> getPageData(int startindex, int pagesize);

	public abstract int getTotalrecord();

	public abstract User findUser(String userId);

}