package com.tn.industry.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord
public class AppUser {

	private String userName;

	private String email;

	private String password;

	@OneToMany(cascade = CascadeType.ALL)
	private Set<Company> favorites = new HashSet<Company>();

	public static AppUser authenticateUser(String login, String password) {
		if (login == null || password == null)
			throw new IllegalArgumentException(
					"The login and password arguments are required");
		EntityManager em = entityManager();
		TypedQuery<AppUser> q = em
				.createQuery(
						"SELECT o FROM AppUser AS o WHERE ( o.userName = :login OR  o.email = :login ) AND o.password = :password",
						AppUser.class);
		q.setParameter("login", login);
		q.setParameter("password", password);
		return q.getSingleResult();
	}
}
