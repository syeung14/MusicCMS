package org.gwu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gwu.model.User;
import org.gwu.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("username");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		UserService us=new UserService();
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		user.setIsAdmin(Integer.parseInt(role));
		User newUser=us.checkUser(user);
		if(newUser!=null){
			request.getSession().setAttribute("user", newUser);
			request.getRequestDispatcher("/jsp/home.jsp")
			.forward(request, response);
		}else{
			request.setAttribute("message","Please check your username and password");
			request.getRequestDispatcher("/index.jsp")
			.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
