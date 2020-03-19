package tn.iit.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.dao.UsersDao;
import tn.iit.model.Users;

/**
 * Servlet implementation class UserControlleur
 */
@WebServlet("/SignupControlleur")
public class SignupControlleur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupControlleur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		UsersDao userDao= new UsersDao();
		Users user;
		String fullName=request.getParameter("fullName");
		String login=request.getParameter("login");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println(password);
		String password2=request.getParameter("password2");
		System.out.println(password2);
		if(fullName.equals("") && login.equals("") && email.equals("") && password.equals("") && password2.equals("")) {
			response.sendRedirect("signup.jsp?erreur1=verifier");	
		}
		else if(userDao.getUserByLogin(login)!=null) {
			response.sendRedirect("signup.jsp?erreur3=verifier");
		}
		else if(password.equals(password2)==false) {
			response.sendRedirect("signup.jsp?erreur2=verifier");
		}
		else {
			user= new Users(fullName,login,email,password);
			userDao.addUser(user);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
