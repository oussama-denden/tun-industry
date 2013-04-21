// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.domain;

import com.tn.industry.domain.Company;
import com.tn.industry.domain.CompanyDataOnDemand;
import com.tn.industry.domain.ProductsDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CompanyDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CompanyDataOnDemand: @Component;
    
    private Random CompanyDataOnDemand.rnd = new SecureRandom();
    
    private List<Company> CompanyDataOnDemand.data;
    
    @Autowired
    private ProductsDataOnDemand CompanyDataOnDemand.productsDataOnDemand;
    
    public Company CompanyDataOnDemand.getNewTransientCompany(int index) {
        Company obj = new Company();
        setCapital(obj, index);
        setCompanyName(obj, index);
        setDenomination(obj, index);
        setEmail(obj, index);
        setFactoryAddress(obj, index);
        setFaxes(obj, index);
        setGovernorate(obj, index);
        setIntoProduction(obj, index);
        setPhones(obj, index);
        setPpe(obj, index);
        setRegime(obj, index);
        setResponsible(obj, index);
        setUrl(obj, index);
        setWorkersNum(obj, index);
        return obj;
    }
    
    public void CompanyDataOnDemand.setCapital(Company obj, int index) {
        double capital = new Integer(index).doubleValue();
        obj.setCapital(capital);
    }
    
    public void CompanyDataOnDemand.setCompanyName(Company obj, int index) {
        String companyName = "companyName_" + index;
        obj.setCompanyName(companyName);
    }
    
    public void CompanyDataOnDemand.setDenomination(Company obj, int index) {
        String denomination = "denomination_" + index;
        obj.setDenomination(denomination);
    }
    
    public void CompanyDataOnDemand.setEmail(Company obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void CompanyDataOnDemand.setFactoryAddress(Company obj, int index) {
        String factoryAddress = "factoryAddress_" + index;
        obj.setFactoryAddress(factoryAddress);
    }
    
    public void CompanyDataOnDemand.setFaxes(Company obj, int index) {
        String faxes = "faxes_" + index;
        obj.setFaxes(faxes);
    }
    
    public void CompanyDataOnDemand.setGovernorate(Company obj, int index) {
        String governorate = "governorate_" + index;
        obj.setGovernorate(governorate);
    }
    
    public void CompanyDataOnDemand.setIntoProduction(Company obj, int index) {
        Date intoProduction = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setIntoProduction(intoProduction);
    }
    
    public void CompanyDataOnDemand.setPhones(Company obj, int index) {
        String phones = "phones_" + index;
        obj.setPhones(phones);
    }
    
    public void CompanyDataOnDemand.setPpe(Company obj, int index) {
        String ppe = "ppe_" + index;
        obj.setPpe(ppe);
    }
    
    public void CompanyDataOnDemand.setRegime(Company obj, int index) {
        String regime = "regime_" + index;
        obj.setRegime(regime);
    }
    
    public void CompanyDataOnDemand.setResponsible(Company obj, int index) {
        String responsible = "responsible_" + index;
        obj.setResponsable(responsible);
    }
    
    public void CompanyDataOnDemand.setUrl(Company obj, int index) {
        String url = "url_" + index;
        obj.setUrl(url);
    }
    
    public void CompanyDataOnDemand.setWorkersNum(Company obj, int index) {
        Long workersNum = new Integer(index).longValue();
        obj.setWorkersNum(workersNum);
    }
    
    public Company CompanyDataOnDemand.getSpecificCompany(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Company obj = data.get(index);
        Long id = obj.getId();
        return Company.findCompany(id);
    }
    
    public Company CompanyDataOnDemand.getRandomCompany() {
        init();
        Company obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Company.findCompany(id);
    }
    
    public boolean CompanyDataOnDemand.modifyCompany(Company obj) {
        return false;
    }
    
    public void CompanyDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Company.findCompanyEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Company' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Company>();
        for (int i = 0; i < 10; i++) {
            Company obj = getNewTransientCompany(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
