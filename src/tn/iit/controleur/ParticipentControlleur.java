package tn.iit.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.dao.ParticipentDao;
import tn.iit.dao.TypeConvDao;
import tn.iit.model.Participant;
import tn.iit.model.TypeConv;

/**
 * Servlet implementation class ParticipentControlleur
 */
@WebServlet("/ParticipentControlleur")
public class ParticipentControlleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParticipentControlleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		int idPart = Integer.parseInt(request.getParameter("id"));
		System.out.println(idPart);
		ParticipentDao participentDao = new ParticipentDao();

		try {

			if (action != null && action.equals("supprimer")) {
				System.out.println("supp");
				participentDao.deleteParticipant(idPart);
				response.sendRedirect("list_participant.jsp");
			}

			if (action != null && action.equals("modifier")) {
				System.out.println("modifier");
				Participant participant ;
				participant = participentDao.getParticipantById(idPart);
				request.setAttribute("part", participant);
				request.getRequestDispatcher("Participant.jsp").forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Participant participant;
		ParticipentDao participentDao = new ParticipentDao();

		int idPart = Integer.parseInt(request.getParameter("idPart"));
		String nomPart = request.getParameter("nomPart");

		if (idPart == -1) {
			participant = new Participant(nomPart);
			participentDao.addParticipant(participant);
		} else {
			participant = new Participant(idPart, nomPart);
			participentDao.updateParticipant(participant);
		}
		response.sendRedirect("list_participant.jsp");

	}
	}


