package tn.iit.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.model.Convention;
import tn.iit.model.Users;
import tn.iit.util.HibernateUtil;

public class UsersDao {
	public void addUser(Users user) {
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			session.save(user);
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

	public ArrayList<Users> getAllUsers() {
		ArrayList<Users> users = new ArrayList<Users>();
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			trns = session.beginTransaction();
			users = (ArrayList<Users>) session.createQuery("from Users").list();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return users;
	}

	public Convention getUserById(int id) {
		Convention objUser = null;
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			String queryString = "from Users where id = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			objUser = (Convention) query.uniqueResult();

		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return objUser;
	}

	public Users getUserByLogin_Pass(String login, String password) {
		Users objUser = null;
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			String queryString = "from Users where login = '" + login + "' and password='" + password + "'";
			Query query = session.createQuery(queryString);

			objUser = (Users) query.uniqueResult();

		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		//System.out.println(objUser.toString());
		return objUser;
	}

	public Convention getUserByLogin(String login) {
		Convention objUser = null;
		Transaction trns = null;
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			trns = session.beginTransaction();
			String queryString = "from Users where login = :login ";
			Query query = session.createQuery(queryString);
			query.setString("login", login);
			objUser = (Convention) query.uniqueResult();

		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return objUser;
	}
}
