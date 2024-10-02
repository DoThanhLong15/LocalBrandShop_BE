/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author admin
 */
//@Controller
//public class StatsController {
//    @Autowired
//    private StatsService statsService;
//    @GetMapping("/stats")
//    public String index(Model model) {
//        model.addAttribute("revenues", this.statsService.statsRevenueByProduct());
//        return "stats";
//    }
//}

@Controller
@RequestMapping("/stats")
public class StatsController {
    @Autowired
    private StatsService statsService;
    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("revenues", this.statsService.statsRevenueByProduct());
        return "stats";
    }
    
    @GetMapping("/revenue_by_peroid/{year}")
    public String statsPeroid(Model model, @PathVariable(value = "year") int year) {
        model.addAttribute("revenues", this.statsService.statsRevenueByPeroid(year, "MONTH"));
        return "statsPeroid";
    }
}
