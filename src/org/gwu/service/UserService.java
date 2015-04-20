package org.gwu.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.gwu.dao.UserDAO;
import org.gwu.model.Page;
import org.gwu.model.User;

@Path("/user")
public class UserService extends AbstractService {
		
	@GET
	@Path("/{username}/{password}")
	@Produces({"application/xml"})
	public User checkUser(@PathParam("username") String username,@PathParam("password") String password){
		UserDAO ud=new UserDAO();
		return ud.checkUser(username,password);
	}
	
	public void saveUser(User user){
		UserDAO ud=new UserDAO();
		ud.insert(user);
	}
	
	public User checkUser(User user){
		UserDAO ud=new UserDAO();
		return ud.checkUser(user);
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
}
