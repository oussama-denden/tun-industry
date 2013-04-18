package com.tn.industry.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Sector {

    @NotNull
    @Column(unique = true)
    private String sectorName;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<ActivityBranch> sectorBranches = new HashSet<ActivityBranch>();
}
