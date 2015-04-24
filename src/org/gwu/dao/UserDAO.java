package org.gwu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.gwu.db.DataBaseManager;
import org.gwu.model.User;

public class UserDAO extends AbstractDAO{

	public UserDAO() {
		super();
	}
	/**
	 * insert a user
	 * @param record
	 */
	public boolean insert(User user){
		PreparedStatement st=null;
		Connection conn=getConnection();
//		System.out.println(String.valueOf("--------------------"+Integer.parseInt(getMaxUserID())));
		try{
			String insertSql="insert into user(userName,userPassword,createTime) values(?,?,?)";
			st=conn.prepareStatement(insertSql);
			st.setString(1,user.getUserName()); 
			st.setString(2,user.getPassword());
			st.setDate(3,new Date(Calendar.getInstance().getTimeInMillis()));
			st.execute();
			
			log.info(insertSql);
			return true;
		}catch(SQLException e){
			log.error("insert error:",e);
			e.printStackTrace();
			return false;
		}finally{
			DataBaseManager.closeStatement(st,null);
			DataBaseManager.releaseConnection(conn);
		}
	}
	
	/**
	 * delete a user
	 * @param record
	 * username,useremail,createdtime,is_admin
	 */
	public void delete(String userId){
		
		PreparedStatement st=null;
		Connection conn=getConnection();
		try{
			String sql="delete from user where userID = ?";
			st=conn.prepareStatement(sql);
			st.setString(1, userId);
			st.execute();
			log.info(sql);
		}catch(SQLException e){
			log.error("delete error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		
	}
	
	public void update(User user){
		PreparedStatement st=null;
		Connection conn=getConnection();
		try{
			String sql="update user set userName=?, email=?, createTime=?, isAdmin=?, loginCount=? where userID =?";
			st=conn.prepareStatement(sql);
			st.setString(1,user.getUserName()); 
			st.setString(2,user.getUserEmail());	
			st.setDate(3,new Date(Calendar.getInstance().getTimeInMillis()));
			st.setInt(4,user.getIsAdmin());
			st.setInt(5, user.getLoginCount());
			st.setString(6, user.getUserId());
			st.execute();
			log.info(sql);
		}catch(SQLException e){
			log.error("delete error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
	}
	
	
	
	/**
	 * validate a user with userName password
	 * @param record
	 */
	public User checkUser(User user){
		User newUser=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		Connection conn=getConnection();
		try{
			String selectSql="select userID,userName,userPassword,email,createTime from user where userName=? and userPassword=?";
			st=conn.prepareStatement(selectSql);
			st.setString(1,user.getUserName()); 
			st.setString(2,user.getPassword());	
			rs=st.executeQuery();
			if(rs.next()){
				newUser=new User();
				newUser.setUserId(rs.getString(1));
				newUser.setUserName(rs.getString(2));
				newUser.setPassword(rs.getString(3));
				newUser.setUserEmail(rs.getString(4));
				newUser.setCreateTime(rs.getDate(5));
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("check error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return newUser;
	}
	
	/**
	 * validate a user with userName password
	 * @param record
	 */
	public User checkUser(String username,String password){
		User newUser=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		Connection conn=getConnection();
		try{
			String selectSql="select userID,userName,userPassword,email,createTime from user where userName=? and userPassword=?";
			st=conn.prepareStatement(selectSql);
			st.setString(1,username); 
			st.setString(2,password);	
			rs=st.executeQuery();
			if(rs.next()){
				newUser=new User();
				newUser.setUserId(rs.getString(1));
				newUser.setUserName(rs.getString(2));
				newUser.setPassword(rs.getString(3));
				newUser.setUserEmail(rs.getString(4));
				newUser.setCreateTime(rs.getDate(5));
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("check error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return newUser;
	}
	

	/**
	 * find all users
	 * @param record
	 */
	public List<User> findAll() {
		PreparedStatement st = null;
		Connection conn = getConnection();
		ResultSet rs = null;
		List list = new ArrayList();
		try{
			String sql = "select * from user";
			st=conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()){
				User user = new User();
				user.setCreateTime(rs.getDate("createTime"));
				user.setIsAdmin(rs.getInt("isAdmin"));
				user.setLoginCount(rs.getInt("loginCount"));
				user.setPassword(rs.getString("userePassword"));
				user.setUserEmail(rs.getString("email"));
				user.setUserName(rs.getString("userName"));
				user.setUserId(rs.getString("userID"));
				if(user.getLoginCount()>0){
					list.add(user);
				}
			}
			log.info(sql);
		}catch(SQLException e){
			log.error("findAll error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return list.size()>0 ? list:null;
		
	}
	
	public List<User> getPageData(int startindex, int pagesize){
		PreparedStatement st=null;
		Connection conn=getConnection();
		ResultSet rs=null;
		List list = new ArrayList();
		try{
			String sql = "select * from user limit ?,?";
			st=conn.prepareStatement(sql);
			st.setInt(1, startindex);
			st.setInt(2, pagesize);
			rs = st.executeQuery();
			
			while(rs.next()){
				User user = new User();
				user.setCreateTime(rs.getDate("createTime"));
				user.setIsAdmin(rs.getInt("isAdmin"));
				user.setLoginCount(rs.getInt("loginCount"));
				user.setPassword(rs.getString("userPassword"));
				user.setUserEmail(rs.getString("email"));
				user.setUserName(rs.getString("userName"));
				user.setUserId(rs.getString("userID"));
				if(user.getLoginCount()>0){
					list.add(user);
				}
			}
			log.info(sql);
		}catch(SQLException e){
			log.error("getPageData error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return list;
	}
	
	public int getTotalrecord(){
		PreparedStatement st=null;
		Connection conn=getConnection();
		ResultSet rs=null;
		try{
			String sql = "select count(*) from user";
			st=conn.prepareStatement(sql);
			rs = st.executeQuery();
			log.info(sql);
			if(rs.next()){
				return rs.getInt(1);}
		
		}catch(SQLException e){
			log.error("getPageData error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return 0;
	}
	
	
	public User findUser(String userId) {
		// TODO Auto-generated method stub
		PreparedStatement st=null;
		Connection conn=getConnection();
		ResultSet rs=null;
		try{
			String sql = "select * from user where userID = ?";
			st=conn.prepareStatement(sql);
			st.setString(1, userId);
			rs = st.executeQuery();
			
			if(rs.next()){
				User user = new User();
				user.setCreateTime(rs.getDate("createTime"));
				user.setIsAdmin(rs.getInt("isAdmin"));
				user.setLoginCount(rs.getInt("loginCount"));
				user.setPassword(rs.getString("userPassword"));
				user.setUserEmail(rs.getString("email"));
				user.setUserName(rs.getString("userName"));
				user.setUserId(rs.getString("userID"));
				return user;
			}
			log.info(sql);			
		}catch(SQLException e){
			log.error("findAll error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return null;
		
	}

}
