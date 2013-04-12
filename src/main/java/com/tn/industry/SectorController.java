package com.tn.industry;

import com.tn.industry.domain.Sector;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sectors")
@Controller
@RooWebScaffold(path = "sectors", formBackingObject = Sector.class)
public class SectorController {
}
