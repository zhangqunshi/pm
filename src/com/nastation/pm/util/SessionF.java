package com.nastation.pm.util;

import org.hibernate.*;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.*;





public class SessionF {
	
	public static SessionFactory sessionFactory;
	
	static {
		try {

			Configuration config = new Configuration().configure();
			

			sessionFactory = config.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public static SessionFactory getSF() {
		return sessionFactory;
	}
	
	
	public static void setUp() throws Exception {
		
		final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
				.configure() 
				.build();
		try {
			sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
		}
		catch (Exception e) {
			
			StandardServiceRegistryBuilder.destroy( registry );
		}
	}
	
	
	
}
