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
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.industry.domain.Company;
import com.tn.industry.domain.Sector;

@RequestMapping("/companys")
@Controller
@RooWebScaffold(path = "companys", formBackingObject = Company.class)
@RooWebJson(jsonObject = Company.class)
public class CompanyController {

	@RequestMapping(value = "/num", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> getSubscribedCompnayNumber() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		Logger.getLogger(CompanyController.class).log(Level.INFO,
				"num : " + Company.findAllCompanys().size());

		return new ResponseEntity<String>("{\"num\":"
				+ String.valueOf(Company.findAllCompanys().size()) + "}",
				headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/all", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> getCompanies() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		List<Company> companies = Company.findAllCompanys();
		if (companies == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NO_CONTENT);
		}
		Logger.getLogger(SectorController.class).log(Level.INFO,
				"all companies : " + companies.size());
		return new ResponseEntity<String>(Company.toJsonArray(companies),
				headers, HttpStatus.OK);
	}

}
