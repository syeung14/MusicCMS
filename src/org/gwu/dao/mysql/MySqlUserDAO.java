package org.gwu.dao.mysql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.gwu.dao.AbstractDAO;
import org.gwu.dao.IUserDao;
import org.gwu.db.DataBaseManager;
import org.gwu.model.User;

public class MySqlUserDAO extends AbstractDAO implements IUserDao{

	public MySqlUserDAO() {
		super();
	}
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#insert(org.gwu.model.User)
	 */
	@Override
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
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#delete(java.lang.String)
	 */
	@Override
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
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#update(org.gwu.model.User)
	 */
	@Override
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
	
	
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#checkUser(org.gwu.model.User)
	 */
	@Override
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
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#checkUser(java.lang.String, java.lang.String)
	 */
	@Override
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
	

	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#findAll()
	 */
	@Override
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
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#getPageData(int, int)
	 */
	@Override
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
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#getTotalrecord()
	 */
	@Override
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
	
	
	/* (non-Javadoc)
	 * @see org.gwu.dao.IUserDao#findUser(java.lang.String)
	 */
	@Override
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
