// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.web;

import com.tn.industry.domain.ActivityBranch;
import com.tn.industry.domain.Company;
import com.tn.industry.domain.Products;
import com.tn.industry.domain.Sector;
import com.tn.industry.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<ActivityBranch, String> ApplicationConversionServiceFactoryBean.getActivityBranchToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.tn.industry.domain.ActivityBranch, java.lang.String>() {
            public String convert(ActivityBranch activityBranch) {
                return new StringBuilder().append(activityBranch.getActivityName()).toString();
            }
        };
    }
    
    public Converter<Long, ActivityBranch> ApplicationConversionServiceFactoryBean.getIdToActivityBranchConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.tn.industry.domain.ActivityBranch>() {
            public com.tn.industry.domain.ActivityBranch convert(java.lang.Long id) {
                return ActivityBranch.findActivityBranch(id);
            }
        };
    }
    
    public Converter<String, ActivityBranch> ApplicationConversionServiceFactoryBean.getStringToActivityBranchConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.tn.industry.domain.ActivityBranch>() {
            public com.tn.industry.domain.ActivityBranch convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ActivityBranch.class);
            }
        };
    }
    
    public Converter<Company, String> ApplicationConversionServiceFactoryBean.getCompanyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.tn.industry.domain.Company, java.lang.String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getDenomination()).append(" ").append(company.getCompanyName()).append(" ").append(company.getResponsible()).append(" ").append(company.getFactoryAddress()).toString();
            }
        };
    }
    
    public Converter<Long, Company> ApplicationConversionServiceFactoryBean.getIdToCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.tn.industry.domain.Company>() {
            public com.tn.industry.domain.Company convert(java.lang.Long id) {
                return Company.findCompany(id);
            }
        };
    }
    
    public Converter<String, Company> ApplicationConversionServiceFactoryBean.getStringToCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.tn.industry.domain.Company>() {
            public com.tn.industry.domain.Company convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Company.class);
            }
        };
    }
    
    public Converter<Products, String> ApplicationConversionServiceFactoryBean.getProductsToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.tn.industry.domain.Products, java.lang.String>() {
            public String convert(Products products) {
                return new StringBuilder().append(products.getProductsName()).toString();
            }
        };
    }
    
    public Converter<Long, Products> ApplicationConversionServiceFactoryBean.getIdToProductsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.tn.industry.domain.Products>() {
            public com.tn.industry.domain.Products convert(java.lang.Long id) {
                return Products.findProducts(id);
            }
        };
    }
    
    public Converter<String, Products> ApplicationConversionServiceFactoryBean.getStringToProductsConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.tn.industry.domain.Products>() {
            public com.tn.industry.domain.Products convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Products.class);
            }
        };
    }
    
    public Converter<Sector, String> ApplicationConversionServiceFactoryBean.getSectorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.tn.industry.domain.Sector, java.lang.String>() {
            public String convert(Sector sector) {
                return new StringBuilder().append(sector.getSectorName()).toString();
            }
        };
    }
    
    public Converter<Long, Sector> ApplicationConversionServiceFactoryBean.getIdToSectorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.tn.industry.domain.Sector>() {
            public com.tn.industry.domain.Sector convert(java.lang.Long id) {
                return Sector.findSector(id);
            }
        };
    }
    
    public Converter<String, Sector> ApplicationConversionServiceFactoryBean.getStringToSectorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.tn.industry.domain.Sector>() {
            public com.tn.industry.domain.Sector convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Sector.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getActivityBranchToStringConverter());
        registry.addConverter(getIdToActivityBranchConverter());
        registry.addConverter(getStringToActivityBranchConverter());
        registry.addConverter(getCompanyToStringConverter());
        registry.addConverter(getIdToCompanyConverter());
        registry.addConverter(getStringToCompanyConverter());
        registry.addConverter(getProductsToStringConverter());
        registry.addConverter(getIdToProductsConverter());
        registry.addConverter(getStringToProductsConverter());
        registry.addConverter(getSectorToStringConverter());
        registry.addConverter(getIdToSectorConverter());
        registry.addConverter(getStringToSectorConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
