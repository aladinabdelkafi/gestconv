package tn.iit.controleur;

import java.io.IOException;
import java.math.BigInteger;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.iit.dao.ConventionDao;
import tn.iit.dao.Part_ConvDao;
import tn.iit.dao.ParticipentDao;
import tn.iit.dao.TypeConvDao;
import tn.iit.model.Convention;
import tn.iit.model.Part_Conv;
import tn.iit.model.Participant;
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
		Part_ConvDao Part_ConvDao = new Part_ConvDao();
		ArrayList<Part_Conv> listPartConv;
		try {
			
			if (action != null && action.equals("supprimer")) {
				System.out.println("supp");
				convDao.deleteConvention(idConv);
				// request.getRequestDispatcher("list_conv.jsp").forward(request, response);
				response.sendRedirect("list_conv.jsp");
			}

			if (action != null && action.equals("modifier")) {
				System.out.println("modifier");
				Convention conv = new Convention();
				conv = convDao.getConventionById(idConv);
				listPartConv=Part_ConvDao.getConventionsbyid(idConv);
				
				
				request.setAttribute("convention", conv);
				request.setAttribute("conventionParticipant", listPartConv);
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

		ArrayList<Convention> arrlist=null;
		TypeConv type;
		TypeConvDao typeconvDao = new TypeConvDao();
		Part_ConvDao partconvDao = new Part_ConvDao();
		ConventionDao convDao = new ConventionDao();
		ParticipentDao pDao = new ParticipentDao();
		Convention conv;
		Participant part;
		int idConv = Integer.parseInt(request.getParameter("idConv"));
		String typeConv = request.getParameter("typeConv");
		LocalDate dateEditionConv = LocalDate.parse(request.getParameter("dateEditionConv"));
		String objetConv = request.getParameter("objetConv");
		LocalDate dateVigueurConv = LocalDate.parse(request.getParameter("dateVigueurConv"));
		LocalDate dateExpConv = LocalDate.parse(request.getParameter("dateExpConv"));
		
		String[] parts = request.getParameterValues("parts");
		LocalDate date1;
		LocalDate date2 ;
		LocalDate date3 ;
		LocalDate date4 ;
		if(request.getParameter("date1").equals("")) {
			 date1=null;
		}else {
			date1 = LocalDate.parse(request.getParameter("date1"));
		}
		
		if(request.getParameter("date2").equals("")) {
			 date2=null;
		}else {
			date2 = LocalDate.parse(request.getParameter("date2"));
		}
		
		if(request.getParameter("date3").equals("")) {
			 date3=null;
		}else {
			date3 = LocalDate.parse(request.getParameter("date3"));
		}
		
		if(request.getParameter("date4").equals("")) {
			 date4=null;
		}else {
			date4 = LocalDate.parse(request.getParameter("date4"));
		}
		
		LocalDate[] date={date1,date2,date3,date4};
		type = typeconvDao.getTypeConventionById(Integer.parseInt(typeConv));

		if (idConv == -1) {
			conv = new Convention(type, dateEditionConv, objetConv, dateVigueurConv, dateExpConv);
			convDao.addConvention(conv);
			arrlist= convDao.getAllConventions();
			System.out.println(arrlist.get(arrlist.size() - 1).getIdConv());
			
			for (int i = 0; i < parts.length; i++) {
				part = pDao.getParticipantById(Integer.parseInt(parts[i]));
				partconvDao.addPart_Conv(new Part_Conv(arrlist.get(arrlist.size() - 1),part,date[i]));
			}

		}
	
		 else {
			 convDao.deleteConvention(idConv);
			 conv = new Convention(type, dateEditionConv, objetConv, dateVigueurConv, dateExpConv);
				convDao.addConvention(conv);
				BigInteger lastId = convDao.getLastId();
				
				for (int i = 0; i < parts.length; i++) {
					part = pDao.getParticipantById(Integer.parseInt(parts[i]));
					partconvDao.addPart_Conv(new Part_Conv(arrlist.get(arrlist.size() - 1),part,date[i]));
				}
				}
		  response.sendRedirect("list_conv.jsp");
		 
	}

}
