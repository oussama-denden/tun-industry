package com.tn.industry.web;

import java.util.ArrayList;
import java.util.Iterator;
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
import com.tn.industry.domain.Company;
import com.tn.industry.domain.Products;
import com.tn.industry.domain.Sector;

@RequestMapping("/companys")
@Controller
@RooWebScaffold(path = "companys", formBackingObject = Company.class)
@RooWebJson(jsonObject = Company.class)
public class CompanyController {

	@RequestMapping(value = "/find", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<java.lang.String> getCompany(
			@RequestParam("id") Long id) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		Logger.getLogger(CompanyController.class).log(Level.INFO,
				"company id : " + id);
		return new ResponseEntity<String>(Company.findCompany(id).toJson(),
				headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/num", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<java.lang.String> getSubscribedCompnayNumber() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		Logger.getLogger(CompanyController.class).log(Level.INFO,
				"subscribed company num : " + Company.findAllCompanys().size());
		return new ResponseEntity<String>("{\"num\":"
				+ String.valueOf(Company.findAllCompanys().size()) + "}",
				headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/all", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<java.lang.String> getCompanies() {
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

	@RequestMapping(value = "/search", headers = "Accept=application/json", params = {
			"sectorId", "branchId", "productsId", "denomination",
			"governerate", "ppe" })
	@ResponseBody
	public ResponseEntity<java.lang.String> getCompaniesBySearchCriteria(
			@RequestParam("sectorId") Long sectorId,
			@RequestParam("branchId") Long branchId,
			@RequestParam("productsId") Long productsId,
			@RequestParam("denomination") String denomination,
			@RequestParam("governerate") String governerate,
			@RequestParam("ppe") String ppe) {
		Logger.getLogger(SectorController.class).log(
				Level.INFO,
				"companies by search critiria sectorId : " + sectorId
						+ " branchId : " + branchId + " productsId : "
						+ productsId + " denomination : " + denomination
						+ " governerate : " + governerate + " ppe : " + ppe);
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
			results.addAll(products.getCompanies());
		} else {
			results = Company.findAllCompanys();
		}
		if (denomination != null && denomination != "" && results.size() > 0) {
			Iterator<Company> itr = results.iterator();
			while (itr.hasNext()) {
				Company company = itr.next();
				if (!company.getDenomination().contains(denomination))
					itr.remove();
			}
		}
		if (governerate != null && governerate != "" && results.size() > 0) {
			Iterator<Company> itr = results.iterator();
			while (itr.hasNext()) {
				Company company = itr.next();
				if (!company.getGovernorate().contains(
						governerate.replace("_", " ")))
					itr.remove();
			}
		}
		if (ppe != null && ppe != "" && results.size() > 0) {
			Iterator<Company> itr = results.iterator();
			while (itr.hasNext()) {
				Company company = itr.next();
				if (!company.getPpe().contains(ppe.replace("_", " ")))
					itr.remove();
			}
		}
		return new ResponseEntity<String>(Company.toJsonArray(results),
				headers, HttpStatus.OK);
	}
}
