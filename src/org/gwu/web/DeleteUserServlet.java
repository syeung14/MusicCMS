package org.gwu.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gwu.model.Page;
import org.gwu.model.User;
import org.gwu.service.AbstractService;
import org.gwu.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");		
		UserService service = new UserService();
		User user = service.findUser(userId);	
		
		user.setLoginCount(0);
		service.update(user);
		String pagenum = request.getParameter("pagenum");
		
		Page page = service.getPageData(pagenum);
		request.setAttribute("page", page);	
		request.getRequestDispatcher("/jsp/listUsers.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
