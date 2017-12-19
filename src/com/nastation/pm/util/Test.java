package com.nastation.pm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;

import com.nastation.pm.bean.*;

public class Test {

	public static String toString(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new java.util.Date());
	}

	public Issuehb idGetIssue(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Issuehb ti = null;
		try {
			tx = session.beginTransaction();
			ti = session.load(Issuehb.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return ti;
	}

	public java.util.Date parseDate(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-d");
		
			Date dt = null;
			try {
				dt = format.parse(time);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//format.format(dt);
			
		
		return dt;
	}

	public static void main(String[] args) {
		System.out.println(new Date());
		// SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// f.format(new Date());
		// System.out.println(f.format(new Date()));

		Test t1 = new Test();
//		Issuehb i1 = t1.idGetIssue(15);
//		System.out.println(i1.getProjectId().getName() + "-------问题名------------");
		
		java.util.Date s = t1.parseDate("2015-9-19");
		System.out.println(s);

	}

}
