package com.mslu.applicant.controller;

import com.mslu.applicant.entity.Profile;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.TypeCompetition;
import com.mslu.applicant.entity.references.TypeDocument;
import com.mslu.applicant.repos.ProfileRepository;
import com.mslu.applicant.repos.TypeCompetitionRepository;
import com.mslu.applicant.repos.TypeDocumentRepository;
import com.mslu.applicant.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class EditorController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TypeDocumentRepository typeDocumentRepository;

    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private TypeCompetitionRepository typeCompetitionRepository;

    @GetMapping("/editor")
    public String mainEditor(@AuthenticationPrincipal User user, Model model) {
        if(user == null) {
            return "login";
        }

        Iterable<TypeDocument> documents = typeDocumentRepository.findAll();
        model.addAttribute("profile", profileRepository.findByUser(user));
        model.addAttribute("documents",documents);

        return "editor";
    }

    @PostMapping("/editor")
    public String mainEditorPost(@AuthenticationPrincipal User user,
                                 Model model, @RequestParam Map<String, String> profileAbit) {

        Profile findAbit;
        Iterable<TypeCompetition> competitions = typeCompetitionRepository.findAll();
        model.addAttribute("competitions", competitions);

        if(!StringUtils.isEmpty(profileAbit.get("typeDoc"))) {
            TypeDocument typeDoc = typeDocumentRepository.findTypeDocumentById(Integer.parseInt(profileAbit.get("typeDoc")));
            findAbit = profileRepository.findByUser(userRepository.findByDocTypeAndDocSeriesAndDocNumber(typeDoc, profileAbit.get("serialDoc"), profileAbit.get("numberDoc")));

            if(findAbit != null) {
                model.addAttribute("abit", findAbit);
                return "pageAbit";
            }
            else {
                model.addAttribute("message", "Абитуриент с указанными данными не найден!");
                model.addAttribute("messageType", "danger");
            }

        }
        else {
            if(!StringUtils.isEmpty(profileAbit.get("profileID"))) {
                findAbit = profileRepository.findById(Long.parseLong(profileAbit.get("profileID")));

                if(!StringUtils.isEmpty(profileAbit.get("typeCompetition"))) {
                    findAbit.setTypeCompetition(typeCompetitionRepository.findTypeCompetitionById(Integer.parseInt(profileAbit.get("typeCompetition"))));
                }
                if(!StringUtils.isEmpty(profileAbit.get("caseNumber"))) {
                    findAbit.setCaseNumber(profileAbit.get("caseNumber"));
                }
                profileRepository.save(findAbit);
                model.addAttribute("abit", findAbit);

                return "pageAbit";
            }
        }

        return "redirect:/editor";
    }

}
