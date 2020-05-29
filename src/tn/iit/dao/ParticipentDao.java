package tn.iit.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.model.Participant;
import tn.iit.util.HibernateUtil;

public class ParticipentDao {
	public void addParticipant(Participant objParticipant) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			session.save(objParticipant);
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

	public void deleteParticipant(int id) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			Participant objParticipant = (Participant) session.load(Participant.class, id);
			session.delete(objParticipant);
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

	
	
	public void updateParticipant(Participant objParticipant) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			session.update(objParticipant);
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
	
	
	public ArrayList<Participant> getAllParticipant() {
		ArrayList<Participant> Participants = new ArrayList<Participant>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			Participants = (ArrayList<Participant>) session.createQuery("from Participant").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return Participants;
	}
	public Participant getParticipantById(int id) {
		Participant objParticipant = null;
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			String queryString = "from Participant where idParticipant = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			objParticipant = (Participant) query.uniqueResult();

		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return objParticipant;
	}
}
