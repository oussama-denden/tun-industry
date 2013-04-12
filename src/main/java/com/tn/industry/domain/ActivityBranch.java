package com.tn.industry.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ActivityBranch {

    @NotNull
    @Column(unique = true)
    private String activityName;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Products> activityProducts = new HashSet<Products>();

    @ManyToOne
    private Sector sector;
}
