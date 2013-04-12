// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.web;

import com.tn.industry.domain.ActivityBranch;
import com.tn.industry.domain.Company;
import com.tn.industry.domain.Products;
import com.tn.industry.web.ProductsController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProductsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProductsController.create(@Valid Products products, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, products);
            return "productses/create";
        }
        uiModel.asMap().clear();
        products.persist();
        return "redirect:/productses/" + encodeUrlPathSegment(products.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProductsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Products());
        return "productses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProductsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("products", Products.findProducts(id));
        uiModel.addAttribute("itemId", id);
        return "productses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProductsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("productses", Products.findProductsEntries(firstResult, sizeNo));
            float nrOfPages = (float) Products.countProductses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("productses", Products.findAllProductses());
        }
        return "productses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProductsController.update(@Valid Products products, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, products);
            return "productses/update";
        }
        uiModel.asMap().clear();
        products.merge();
        return "redirect:/productses/" + encodeUrlPathSegment(products.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProductsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Products.findProducts(id));
        return "productses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProductsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Products products = Products.findProducts(id);
        products.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/productses";
    }
    
    void ProductsController.populateEditForm(Model uiModel, Products products) {
        uiModel.addAttribute("products", products);
        uiModel.addAttribute("activitybranches", ActivityBranch.findAllActivityBranches());
        uiModel.addAttribute("companys", Company.findAllCompanys());
    }
    
    String ProductsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
