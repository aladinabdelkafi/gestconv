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
 * Servlet implementation class FicheEtudiantAction
 */
@WebServlet("/ConventionControlleur")
public class ConventionControlleur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConventionControlleur() {
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

		String action = request.getParameter("action");
		int idConv = Integer.parseInt(request.getParameter("id"));
		System.out.println(idConv);
		ConventionDao convDao = new ConventionDao();

		try {

			if (action != null && action.equals("supprimer")) {
				System.out.println("supp");
				convDao.deleteConvention(idConv);
				//request.getRequestDispatcher("list_conv.jsp").forward(request, response);
				response.sendRedirect("list_conv.jsp");
			}

			if (action != null && action.equals("modifier")) {
				System.out.println("modifier");
				Convention conv = new Convention();
				conv = convDao.getConventionById(idConv);
				request.setAttribute("convention", conv);
				request.getRequestDispatcher("convention.jsp").forward(request, response);
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
		ConventionDao convDao = new ConventionDao();
		Convention conv;
		int idConv = Integer.parseInt(request.getParameter("idConv"));
		String typeConv = request.getParameter("typeConv");
		LocalDate dateEditionConv = LocalDate.parse(request.getParameter("dateEditionConv"));
		LocalDate dateSigConv = LocalDate.parse(request.getParameter("dateSigConv"));
		String objetConv = request.getParameter("objetConv");
		LocalDate dateVigueurConv = LocalDate.parse(request.getParameter("dateVigueurConv"));
		LocalDate dateExpConv = LocalDate.parse(request.getParameter("dateExpConv"));
		String participant1 = request.getParameter("participant1");
		String participant2 = request.getParameter("participant2");
		String participant3 = request.getParameter("participant3");
		String participant4 = request.getParameter("participant4");
		type=typeconvDao.getTypeConventionById(Integer.parseInt(typeConv));
		if (idConv == -1) {
			conv = new Convention(type, dateEditionConv, dateSigConv, objetConv, dateVigueurConv, dateExpConv,
					participant1, participant2, participant3, participant4);
			convDao.addConvention(conv);
		} else {
			conv = new Convention(idConv, type, dateEditionConv, dateSigConv, objetConv, dateVigueurConv,
					dateExpConv, participant1, participant2, participant3, participant4);
			convDao.updateConvention(conv);
		}
		response.sendRedirect("list_conv.jsp");
	}

}
