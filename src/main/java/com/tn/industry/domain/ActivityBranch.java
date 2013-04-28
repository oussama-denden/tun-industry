package com.tn.industry.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findActivityBranchesBySector" })
public class ActivityBranch {

    @NotNull
    @Column(unique = true)
    private String activityName;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "activityBranch")
    private Set<Products> activityProducts = new HashSet<Products>();

    @ManyToOne
    @JoinColumn( name = "sectorId")
    private Sector sector;

	
	
}
