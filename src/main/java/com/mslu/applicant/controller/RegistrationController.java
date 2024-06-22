package com.mslu.applicant.controller;

import com.mslu.applicant.entity.references.TypeDocument;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.dto.CaptchaResponseDto;
import com.mslu.applicant.repos.TypeDocumentRepository;
import com.mslu.applicant.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Autowired
    private TypeDocumentRepository typeDocumentRepository;

    @Value("${recaptcha.secret}")
    private String captchaSecret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration(Map<String, Object> model, @AuthenticationPrincipal User user) {
        if(user != null)
            return "redirect:/";

        Iterable<TypeDocument> documents = typeDocumentRepository.findAll();

        model.put("documents", documents);
        model.put("user",new User());
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam("passwordConfirmation") String passwordConfirmation,
                          //@RequestParam("g-recaptcha-response") String captchaResponse,
                          @Valid User user,
                          BindingResult bindingResult,
                          Model model) throws MessagingException {

        //String urlGoogleCaptcha = String.format(CAPTCHA_URL,captchaSecret,captchaResponse);
        //CaptchaResponseDto response = restTemplate.postForObject(urlGoogleCaptcha, Collections.emptyList(), CaptchaResponseDto.class);
        //if (!response.isSuccess()) {
        //    model.addAttribute("captchaError", "Подтвердите reCAPTCHA");
        //}

        Iterable<TypeDocument> documents = typeDocumentRepository.findAll();

        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirmation);

        if(isConfirmEmpty) {
            model.addAttribute("passwordConfirmationError", "Введите подтверждение пароля");
        }

        if(user.getPassword() == null || !user.getPassword().equals(passwordConfirmation)) {
            model.addAttribute("passwordError", "Пароли не равны");
        }

        //if (isConfirmEmpty || bindingResult.hasErrors() || !response.isSuccess()) {
        if (isConfirmEmpty || bindingResult.hasErrors()) {
            Map<String,String> errors = UtilsController.getErrors(bindingResult);

            model.mergeAttributes(errors);

            model.addAttribute("documents", documents);

            return "registration";
        } else {

            if (!userService.addUser(user)) {
                model.addAttribute("documents", documents);
                model.addAttribute("message", "Пользователь с такими данными уже существует! Проверьте правильность email или данные документа, удостоверяющего личность!");
                //model.addAttribute("user", user);
                return "registration";
            }

            model.addAttribute("message", "Пользователь успешно зарегистрирован! Для дальнейшей работы в аккаунте пожалуйста проверьте почту и пройдите по ссылке активации!");
            model.addAttribute("messageType","warning");
            return "login";
        }
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if(isActivated) {
            model.addAttribute("messageType","success");
            model.addAttribute("message", "Ваш аккаунт успешно активирован!");
        } else {
            model.addAttribute("messageType","error");
            model.addAttribute("message", "Код активации не найден!");
        }

        return "login";
    }



}
