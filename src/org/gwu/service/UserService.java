package org.gwu.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.gwu.dao.UserDAO;
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
		UserDAO ud=new UserDAO();
		User u = ud.checkUser(username,password);
		if(u == null){
			u = new User();
			u.setUserName("do not exist");
		}
		return u;
	}
	
	public void saveUser(User user){
		UserDAO ud=new UserDAO();
		ud.insert(user);
	}
	
	public List<User> findAllUsers(){
		UserDAO ud=new UserDAO();
		return ud.findAll();
	}
	
	public Page getPageData(String pagenum){
		UserDAO ud=new UserDAO();
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
		UserDAO ud=new UserDAO();
		ud.delete(userId);
	}

	public User findUser(String userId) {
		UserDAO ud=new UserDAO();
		User user = ud.findUser(userId);
		return user;
	}

	public void update(User user) {
		UserDAO ud = new UserDAO();
		ud.update(user);
	}
	
	public void insert(User user) {
		UserDAO ud = new UserDAO();
		ud.insert(user);
	}
	
	public User checkUser(User user){
		UserDAO ud=new UserDAO();
		return ud.checkUser(user);
	}
	
	@POST
	@Path("/register")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces({"application/xml"})
	public Message insert(@FormParam("username") String username, @FormParam("password") String password) {
		UserDAO ud = new UserDAO();
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
