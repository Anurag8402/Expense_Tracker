package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

public class UserDao<Expense> {

	private SessionFactory factory;
	private Session session=null;
	private  Transaction tx=null;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveuser(User user) {
		boolean f= false;

		try {

			session = factory.openSession();
			tx = session.beginTransaction();

			session.save(user);
			tx.commit();
			f = true;
		}catch(Exception e) {
			if(tx != null) {
				f = false;
				e.printStackTrace();
			}

		}
		return f;
	}

    public User login(String email,String password) {
    	User u =null;
    	
    	session =factory.openSession();
    	Query q = session.createQuery("from User Where email =:em and password =:ps");
    	q.setParameter("em",email);
    	q.setParameter("ps", password);
    	
    	 u = (User)  ((org.hibernate.Query) q).uniqueResult();
    	
    	return u;
    }
    
}
