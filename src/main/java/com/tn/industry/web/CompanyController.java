package com.tn.industry.web;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.industry.domain.ActivityBranch;
import com.tn.industry.domain.Company;
import com.tn.industry.domain.Products;
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

	@RequestMapping(value = "/sectorId/branchId/productsId", headers = "Accept=application/json", params = {
			"denomination", "governerate", "ppe" })
	@ResponseBody
	public ResponseEntity<String> getCompaniesBySearchCriteria(
			@PathVariable("sectorId") Long sectorId,
			@PathVariable("branchId") Long branchId,
			@PathVariable("productsId") Long productsId,
			@RequestParam(value = "denomination") String denomination,
			@RequestParam(value = "governerate") String governerate,
			@RequestParam(value = "ppe") String ppe) {
		Logger.getLogger(SectorController.class).log(Level.INFO,
				"companies by search critiria ");
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");

		Sector sector = Sector.findSector(sectorId);
		ActivityBranch branch = ActivityBranch.findActivityBranch(branchId);
		Products products = Products.findProducts(productsId);
		List<Company> results = new ArrayList<Company>();

		if (sector != null
				&& branch != null
				&& products != null
				&& (products.getActivityBranch() != branch || branch
						.getSector() != sector)) {
			return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);

		}

		if (sector != null && branch != null && branch.getSector() != sector) {
			return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);
		}

		if (branch != null && products != null
				&& products.getActivityBranch() != branch) {
			return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);
		}

		if (products != null) {
			results = Company.findCompanysByProducts(products).getResultList();
		} else {
			results = Company.findAllCompanys();
		}

		if (denomination != null && denomination != "") {
			for (Company company : results) {
				if (!company.getCompanyName().contains(denomination))
					results.remove(company);
			}
		}

		if (governerate != null && governerate != "") {
			for (Company company : results) {
				if (!company.getGovernorate().contains(
						governerate.replace("_", " ")))
					results.remove(company);
			}
		}

		if (ppe != null && ppe != "") {
			for (Company company : results) {
				if (!company.getPpe().contains(ppe.replace("_", " ")))
					results.remove(company);
			}
		}

		return new ResponseEntity<String>(Company.toJsonArray(results),
				headers, HttpStatus.OK);
	}

}
