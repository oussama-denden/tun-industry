package com.tn.industry.web;

import com.tn.industry.domain.Sector;
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

@RequestMapping("/sectors")
@Controller
@RooWebScaffold(path = "sectors", formBackingObject = Sector.class)
@RooWebJson(jsonObject = Sector.class)
public class SectorController {

    @RequestMapping(value = "/all", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<java.lang.String> getSectors() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Sector> sectors = Sector.findAllSectors();
        Logger.getLogger(SectorController.class).log(Level.INFO, "subscribed sectors number : " + sectors.size());
        return new ResponseEntity<String>(Sector.toJsonArray(sectors), headers, HttpStatus.OK);
    }

    @RequestMapping("/test")
    @ResponseBody
    public String getTest() {
        Logger.getLogger(SectorController.class).log(Level.INFO, "ok");
        return "ok";
    }
}
