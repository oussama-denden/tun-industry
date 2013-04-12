package com.tn.industry.web;

import com.tn.industry.domain.ActivityBranch;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/activitybranches")
@Controller
@RooWebScaffold(path = "activitybranches", formBackingObject = ActivityBranch.class)
public class ActivityBranchController {
	
	
}
