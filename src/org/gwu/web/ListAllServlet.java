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
@WebServlet("/ListAllServlet")
public class ListAllServlet extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAllServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pagenum = request.getParameter("pagenum");
		
		UserService service = new UserService();
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
