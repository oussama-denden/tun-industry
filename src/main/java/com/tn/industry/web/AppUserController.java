package com.tn.industry.web;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tn.industry.domain.AppUser;
import com.tn.industry.domain.Company;

@RequestMapping("/appusers")
@Controller
@RooWebScaffold(path = "appusers", formBackingObject = AppUser.class)
public class AppUserController {

	@RequestMapping(value = "/authtication", headers = "Accept=application/json", method = RequestMethod.POST)
	public ResponseEntity<String> userAuthentication(
			@RequestParam("login") String login,
			@RequestParam("password") String password) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		Logger.getLogger(AppUserController.class).log(
				Level.INFO,
				"User Authentication login : " + login + " password : "
						+ password);
		try {
			AppUser user = AppUser.authenticateUser(login, password);
			return new ResponseEntity<String>(user.toJson(), headers,
					HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
		}

	}

	@RequestMapping(value = "/addFovorite", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> addToFavorites(
			@RequestParam("userId") long userId,
			@RequestParam("companyId") long companyId) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		Logger.getLogger(AppUserController.class).log(
				Level.INFO,
				"Add to favorites companyId : " + companyId + " for userId : "
						+ userId);

		Company company = Company.findCompany(companyId);
		if (company == null) {
			return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);
		}

		AppUser user = AppUser.findAppUser(userId);
		if (user == null) {
			return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);
		}

		if (user.getFavorites().contains(company)) {
			return new ResponseEntity<String>(headers, HttpStatus.FOUND);
		} else {
			user.getFavorites().add(company);
			user.merge();
			return new ResponseEntity<String>(headers, HttpStatus.CREATED);
		}
	}

	@RequestMapping(value = "/userFovorites", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> getUserFavorites(
			@RequestParam("userId") Long userId) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		Logger.getLogger(AppUserController.class).log(Level.INFO,
				"Find user favorites for userId : " + userId);
		AppUser user = AppUser.findAppUser(userId);
		if (user == null) {
			return new ResponseEntity<String>(headers, HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<String>(Company.toJsonArray(user
				.getFavorites()), headers, HttpStatus.OK);
	}
}
