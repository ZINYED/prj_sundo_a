package com.postgres.sample.controller.lkh;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ObservationStatistics")
public class LkhObservationStatistics {



    @GetMapping("/view")
    public String waterResourceStatistics(Model model){
        System.out.println("waterResourceStatistics start");
        return "system2/a";
    }


}
