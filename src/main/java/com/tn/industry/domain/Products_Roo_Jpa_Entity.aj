// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.domain;

import com.tn.industry.domain.Products;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Products_Roo_Jpa_Entity {
    
    declare @type: Products: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Products.id;
    
    @Version
    @Column(name = "version")
    private Integer Products.version;
    
    public Long Products.getId() {
        return this.id;
    }
    
    public void Products.setId(Long id) {
        this.id = id;
    }
    
    public Integer Products.getVersion() {
        return this.version;
    }
    
    public void Products.setVersion(Integer version) {
        this.version = version;
    }
    
}
