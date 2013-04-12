package com.tn.industry.web;

import java.util.List;

import com.tn.industry.domain.Sector;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/sectors")
@Controller
@RooWebScaffold(path = "sectors", formBackingObject = Sector.class)
public class SectorController {
	
	@RequestMapping(value = "/all")
	public @ResponseBody List<Sector> getSectors() {
		return Sector.findAllSectors();
	}
}
