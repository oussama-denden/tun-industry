package com.tn.industry.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findCompanysByProducts" })
public class Company {

	private String denomination;

	private String companyName;

	private String responsable;

	private String factoryAddress;

	private String governorate;

	private String phones;

	private String faxes;

	private String email;

	private String url;

	private String regime;

	private String ppe;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "M-")
	private Date intoProduction;

	private double capital;

	private long workersNum;

	@OneToMany(cascade = CascadeType.ALL)
	private Set<Products> productses = new HashSet<Products>();
}
