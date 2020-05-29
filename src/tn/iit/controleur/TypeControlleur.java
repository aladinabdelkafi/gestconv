package tn.iit.controleur;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.dao.ConventionDao;
import tn.iit.dao.TypeConvDao;
import tn.iit.model.Convention;
import tn.iit.model.TypeConv;

/**
 * Servlet implementation class TypeControlleur
 */
@WebServlet("/TypeControlleur")
public class TypeControlleur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TypeControlleur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		int idType = Integer.parseInt(request.getParameter("id"));
		System.out.println(idType);
		TypeConvDao typeconvDao = new TypeConvDao();

		try {

			if (action != null && action.equals("supprimer")) {
				System.out.println("supp");
				typeconvDao.deleteTypeConvention(idType);
				response.sendRedirect("list_TypeConv.jsp");
			}

			if (action != null && action.equals("modifier")) {
				System.out.println("modifier");
				TypeConv typeconv = new TypeConv();
				typeconv = typeconvDao.getTypeConventionById(idType);
				request.setAttribute("type", typeconv);
				request.getRequestDispatcher("typeConv.jsp").forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TypeConv type;
		TypeConvDao typeconvDao = new TypeConvDao();

		int idType = Integer.parseInt(request.getParameter("idType"));
		String typeConv = request.getParameter("typeConv");

		if (idType == -1) {
			type = new TypeConv(typeConv);
			typeconvDao.addTypeConvention(type);
		} else {
			type = new TypeConv(idType, typeConv);
			typeconvDao.updateTypeConvention(type);
		}
		response.sendRedirect("list_TypeConv.jsp");

	}
}
