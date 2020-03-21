package tn.iit.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.model.Convention;
import tn.iit.model.TypeConv;
import tn.iit.util.HibernateUtil;

public class TypeConvDao {
	public void addTypeConvention(TypeConv objTypeConv) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			session.save(objTypeConv);
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

	public void deleteTypeConvention(int id) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			TypeConv objTypeConvention = (TypeConv) session.load(TypeConv.class, id);
			session.delete(objTypeConvention);
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

	
	
	public void updateTypeConvention(TypeConv objTypeConvention) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			session.update(objTypeConvention);
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
	
	
	public ArrayList<TypeConv> getAllTypeConv() {
		ArrayList<TypeConv> typeConvs = new ArrayList<TypeConv>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			typeConvs = (ArrayList<TypeConv>) session.createQuery("from TypeConv").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return typeConvs;
	}
	public TypeConv getTypeConventionById(int id) {
		TypeConv objTypeConvention = null;
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			String queryString = "from TypeConv where idType = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			objTypeConvention = (TypeConv) query.uniqueResult();

		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return objTypeConvention;
	}
}
