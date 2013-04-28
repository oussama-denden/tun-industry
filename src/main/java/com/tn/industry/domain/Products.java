package com.tn.industry.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findProductsesByActivityBranch" })
public class Products {

    @NotNull
    @Column(unique = true)
    private String productsName;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Company> companies = new HashSet<Company>();

    @ManyToOne
    @JoinColumn( name = "activityId")
    private ActivityBranch activityBranch;
}
