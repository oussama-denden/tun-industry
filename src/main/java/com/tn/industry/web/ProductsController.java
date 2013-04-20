package com.tn.industry.web;

import java.util.List;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.industry.domain.ActivityBranch;
import com.tn.industry.domain.Products;

@RequestMapping("/productses")
@Controller
@RooWebScaffold(path = "productses", formBackingObject = Products.class)
@RooWebJson(jsonObject = Products.class)
public class ProductsController {

	@RequestMapping(value = "/activity", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> activityProducts(@RequestParam("id") Long id) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		ActivityBranch activity = ActivityBranch.findActivityBranch(id);
		List<Products> productses = Products.findProductsesByActivityBranch(
				activity).getResultList();
		
		if (productses == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NO_CONTENT);
		}
		
		Logger.getLogger(ActivityBranch.class).log(Level.INFO,
				"activity id : " + id + " result num : " + productses.size());
		
		return new ResponseEntity<String>(Products.toJsonArray(productses),
				headers, HttpStatus.OK);
	}
}
