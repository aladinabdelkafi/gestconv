package tn.iit.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iit.dao.UsersDao;

/**
 * Servlet implementation class LoginControlleur
 */
@WebServlet("/LoginControlleur")
public class LoginControlleur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginControlleur() {
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
		String login=request.getParameter("login");
		String password=request.getParameter("password");
		if(  login.equals("") &&  password.equals("") ) {
			response.sendRedirect("login.jsp?erreur1=verifier");	
		}
		else if(userDao.getUserByLogin_Pass(login,password)==null) {
			response.sendRedirect("login.jsp?erreur2=verifier");
		}
		else{
			HttpSession session= request.getSession();
			session.setAttribute("login",login );
			session.setAttribute("password",password);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}

	}

}
