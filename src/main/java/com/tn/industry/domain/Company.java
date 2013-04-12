package com.tn.industry.domain;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Company {

    private String denomination;

    private String companyName;

    private String responsible;

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

    @ManyToOne
    private Products products;
}
