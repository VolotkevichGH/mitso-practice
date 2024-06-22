package com.mslu.applicant.controller.rest;

import com.mslu.applicant.entity.Profile;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.repos.ProfileRepository;
import com.mslu.applicant.service.PDFGenerateService;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PDFGenerateController {

    @Autowired
    private PDFGenerateService pdfGenerateService;

    @Autowired
    private ProfileRepository profileRepository;

    @RequestMapping(value = "/apply-form", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity applyForm(@AuthenticationPrincipal User user, Model model) throws java.io.IOException, TemplateException {
        InputStreamResource resource = pdfGenerateService.html2PdfGenerator("applicationForm.ftlh", user, model);

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentDispositionFormData("attachment", "applicationForm.pdf");

        if (resource != null) {
            return ResponseEntity
                    .ok()
                    .headers(respHeaders)
                    .body(resource);
        } else {
            return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(value = "/contract-form", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity contractForm(@AuthenticationPrincipal User user, Model model) throws java.io.IOException, TemplateException {


        Profile profile = profileRepository.findByUser(user);

        InputStreamResource resource;

        if(profile.getSpecialty().getTypeEducationContract().getId() == 2) {
            if(profile.is18YearsOld())
                resource = pdfGenerateService.html2PdfGenerator("paidContract18Years.ftlh", user, model);
            else
                resource = pdfGenerateService.html2PdfGenerator("paidContractNo18Years.ftlh", user, model);
        }
        else {
            if(profile.is18YearsOld())
                model.addAttribute("isAdult",true);
            else
                model.addAttribute("isAdult",false);

            resource = pdfGenerateService.html2PdfGenerator("budgetContractBelarus.ftlh", user, model);
        }


        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentDispositionFormData("attachment", "contractForm.pdf");

        if (resource != null) {
            return ResponseEntity
                    .ok()
                    .headers(respHeaders)
                    .body(resource);
        } else {
            return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(value = "/anketa-form", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity anketaForm(@AuthenticationPrincipal User user, Model model) throws java.io.IOException, TemplateException {
        InputStreamResource resource = pdfGenerateService.html2PdfGenerator("anketa.ftlh", user, model);

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentDispositionFormData("attachment", "anketaMSLU.pdf");

        if (resource != null) {
            return ResponseEntity
                    .ok()
                    .headers(respHeaders)
                    .body(resource);
        } else {
            return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/apply-form-editor", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity applyFormEditor(@AuthenticationPrincipal User user, Model model, @RequestParam("abitId") User abit) throws java.io.IOException, TemplateException {


        InputStreamResource resource = pdfGenerateService.html2PdfGenerator("applicationForm.ftlh", abit, model);

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentDispositionFormData("attachment", "applicationForm.pdf");

        if (resource != null) {
            return ResponseEntity
                    .ok()
                    .headers(respHeaders)
                    .body(resource);
        } else {
            return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/contract-form-editor", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity contractFormEditor(@AuthenticationPrincipal User user, Model model, @RequestParam("abitId") User abit) throws java.io.IOException, TemplateException {


        Profile profile = profileRepository.findByUser(abit);

        InputStreamResource resource;

        if(profile.getSpecialty().getTypeEducationContract().getId() == 2) {
            if(profile.is18YearsOld())
                resource = pdfGenerateService.html2PdfGenerator("paidContract18Years.ftlh", abit, model);
            else
                resource = pdfGenerateService.html2PdfGenerator("paidContractNo18Years.ftlh", abit, model);
        }
        else {
            if(profile.is18YearsOld())
                model.addAttribute("isAdult",true);
            else
                model.addAttribute("isAdult",false);
            resource = pdfGenerateService.html2PdfGenerator("budgetContractBelarus.ftlh", abit, model);
        }


        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentDispositionFormData("attachment", "contractForm.pdf");

        if (resource != null) {
            return ResponseEntity
                    .ok()
                    .headers(respHeaders)
                    .body(resource);
        } else {
            return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/anketa-form-editor", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity anketaFormEditor(@AuthenticationPrincipal User user, Model model, @RequestParam("abitId") User abit) throws java.io.IOException, TemplateException {
        InputStreamResource resource = pdfGenerateService.html2PdfGenerator("anketa.ftlh", abit, model);

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentDispositionFormData("attachment", "anketaMSLU.pdf");

        if (resource != null) {
            return ResponseEntity
                    .ok()
                    .headers(respHeaders)
                    .body(resource);
        } else {
            return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }


}
