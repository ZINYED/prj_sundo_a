package com.postgres.sample.controller.lkh;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/realTimeSystem")
public class LkhMapController {
    @GetMapping("/layer")
    public String waterResourceStatistics(Model model){
        return "system2/lkh/waterResourceMapSystem/Layer";
    }


}
