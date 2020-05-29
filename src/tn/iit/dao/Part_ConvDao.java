package tn.iit.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.model.Convention;
import tn.iit.model.PartConvId;
import tn.iit.model.Part_Conv;
import tn.iit.util.HibernateUtil;

public class Part_ConvDao {
	public void addPart_Conv(Part_Conv objConvention) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			session.save(objConvention);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			if (trns != null) {
				((Transaction) trns).rollback();
			}
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
	}
	
	public ArrayList<Part_Conv> getAllPart_Convs() {
		ArrayList<Part_Conv> conventions = new ArrayList<Part_Conv>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			conventions = (ArrayList<Part_Conv>) session.createQuery("from Part_Conv").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return conventions;
	}
	
	public ArrayList<Part_Conv> getConventionsbyid(int type) {
		
		ArrayList<Part_Conv> Part_Conv = new ArrayList<Part_Conv>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			Part_Conv = (ArrayList<Part_Conv>) session.createQuery("from Part_Conv where CONV_ID='"+type+"'").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return Part_Conv;
	}
	
}
