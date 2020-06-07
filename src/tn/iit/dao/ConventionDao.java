package tn.iit.dao;

import java.math.BigInteger;
import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.model.Convention;
import tn.iit.util.HibernateUtil;

public class ConventionDao {
	public void addConvention(Convention objConvention) {
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

	public void deleteConvention(int id) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			Convention objConvention = (Convention) session.load(Convention.class, id);
			session.delete(objConvention);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			if (trns != null) {
				trns.rollback();
			}
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}

	}

	public void updateConvention(Convention objConvention) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			session.update(objConvention);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			if (trns != null) {
				trns.rollback();
			}
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
	}

	public ArrayList<Convention> getAllConventions() {
		ArrayList<Convention> conventions = new ArrayList<Convention>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			conventions = (ArrayList<Convention>) session.createQuery("from Convention").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return conventions;
	}

	public ArrayList<Convention> getAllConventions_universitaire(int type) {
		ArrayList<Convention> conventions = new ArrayList<Convention>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			conventions = (ArrayList<Convention>) session.createQuery("from Convention where typeConv='"+type+"'").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return conventions;
	}
	
	
	public Convention getConventionById(int id) {
		Convention objConvention = null;
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			String queryString = "from Convention where idConv = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			objConvention = (Convention) query.uniqueResult();

		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return objConvention;
	}
	
	
	
	
	public  BigInteger getLastId() {
		
		ArrayList<Convention> conventions = new ArrayList<Convention>();
		Convention conv = null;
		Transaction trns = null;
		BigInteger lastId = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			//conv = (Convention) session.createQuery(" from Convention ORDER BY idConv DESC LIMIT 0, 1").uniqueResult();
			 lastId = ((BigInteger) session.createSQLQuery("SELECT LAST_INSERT_ID()").uniqueResult());
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return lastId;
}
}
