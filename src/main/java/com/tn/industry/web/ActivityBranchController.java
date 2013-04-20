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
import com.tn.industry.domain.Sector;

@RequestMapping("/activitybranches")
@Controller
@RooWebScaffold(path = "activitybranches", formBackingObject = ActivityBranch.class)
@RooWebJson(jsonObject = ActivityBranch.class)
public class ActivityBranchController {

	@RequestMapping(value = "/sector", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> sectorActivityBranches(
			@RequestParam("id") Long id) {
		Sector sector = Sector.findSector(id);
		List<ActivityBranch> branches = ActivityBranch
				.findActivityBranchesBySector(sector).getResultList();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=utf-8");
		if (branches == null) {
			return new ResponseEntity<String>(headers, HttpStatus.NO_CONTENT);
		}
		Logger.getLogger(ActivityBranch.class).log(Level.INFO,
				"sector activity branche id : " + id + " results num : " + branches.size());
		return new ResponseEntity<String>(ActivityBranch.toJsonArray(branches),
				headers, HttpStatus.OK);
	}
}
