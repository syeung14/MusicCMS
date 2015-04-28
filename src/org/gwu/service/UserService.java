package org.gwu.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.gwu.dao.DataAccess;
import org.gwu.dao.IUserDao;
import org.gwu.model.Message;
import org.gwu.model.Page;
import org.gwu.model.User;

@Path("/user")
public class UserService extends AbstractService {
	
	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces({"application/xml"})
	public User checkUser(@FormParam("username") String username, @FormParam("password") String password){
		IUserDao ud=DataAccess.getUserDao();
		User u = ud.checkUser(username,password);
		if(u == null){
			u = new User();
			u.setUserName("do not exist");
		}
		return u;
	}
	
	public void saveUser(User user){
		IUserDao ud=DataAccess.getUserDao();
		ud.insert(user);
	}
	
	public List<User> findAllUsers(){
		IUserDao ud=DataAccess.getUserDao();
		return ud.findAll();
	}
	
	public Page getPageData(String pagenum){
		IUserDao ud=DataAccess.getUserDao();
		int totalrecord = ud.getTotalrecord();
		if(pagenum == null){
			Page page = new Page(totalrecord,1);
			List<User> list = ud.getPageData(page.getStartindex(), page.getPagesize());
			page.setList(list);
			return page;
			
		}else{
			Page page = new Page(totalrecord, Integer.parseInt(pagenum));
			List<User> list = ud.getPageData(page.getStartindex(), page.getPagesize());
			page.setList(list);
			return page;
		}
		
	}

	public void delete(String userId) {
		IUserDao ud=DataAccess.getUserDao();
		ud.delete(userId);
	}

	public User findUser(String userId) {
		IUserDao ud=DataAccess.getUserDao();
		User user = ud.findUser(userId);
		return user;
	}

	public void update(User user) {
		IUserDao ud = DataAccess.getUserDao();
		ud.update(user);
	}
	
	public void insert(User user) {
		IUserDao ud = DataAccess.getUserDao();
		ud.insert(user);
	}
	
	public User checkUser(User user){
		IUserDao ud= DataAccess.getUserDao();
		return ud.checkUser(user);
	}
	
	@POST
	@Path("/register")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces({"application/xml"})
	public Message insert(@FormParam("username") String username, @FormParam("password") String password) {
		IUserDao ud = DataAccess.getUserDao();
		User u = new User();
		u.setUserName(username);
		u.setPassword(password);
		boolean result = ud.insert(u);
		Message m = new Message();
		if(result == true)
			m.setContent("true");
		else
			m.setContent("false");
		return m;	
	}
}
