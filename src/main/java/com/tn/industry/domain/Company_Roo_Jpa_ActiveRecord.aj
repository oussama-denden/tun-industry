// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.domain;

import com.tn.industry.domain.Company;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Company_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Company.entityManager;
    
    public static final EntityManager Company.entityManager() {
        EntityManager em = new Company().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Company.countCompanys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Company o", Long.class).getSingleResult();
    }
    
    public static List<Company> Company.findAllCompanys() {
        return entityManager().createQuery("SELECT o FROM Company o", Company.class).getResultList();
    }
    
    public static Company Company.findCompany(Long id) {
        if (id == null) return null;
        return entityManager().find(Company.class, id);
    }
    
    public static List<Company> Company.findCompanyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Company o", Company.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Company.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Company.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Company attached = Company.findCompany(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Company.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Company.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Company Company.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Company merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
