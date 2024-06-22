package com.mslu.applicant.controller;

import com.mslu.applicant.entity.Profile;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.repos.ProfileRepository;
import com.mslu.applicant.repos.TypeDocumentRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private TypeDocumentRepository documentRepo;

    @Autowired
    private ProfileRepository profileRepository;

    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }

    @GetMapping
    public String main(@AuthenticationPrincipal User user) {

        if (user != null) {

            Profile profile = profileRepository.findByUser(user);

            if(profile != null) {
                return "redirect:/info-status";
            }
            else
                return "redirect:/profile";
        }

        return "main";
    }

    @RequestMapping(value="/logout", method= RequestMethod.GET)
    public String logoutPage(HttpServletResponse request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout((HttpServletRequest) request, response, auth);
        }
        return "redirect:/login";
    }
}
