package com.mslu.applicant.controller;

import com.mslu.applicant.entity.Log;
import com.mslu.applicant.entity.Profile;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.*;
import com.mslu.applicant.repos.*;
import com.mslu.applicant.service.FormValidationService;
import com.mslu.applicant.service.ParentService;
import com.mslu.applicant.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProfileController {



    @Autowired
    private ProfileRepository profileRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TypeDocumentRepository typeDocumentRepository;

    @Autowired
    private MaritalRepository maritalRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private AreaRepository areaRepository;

    @Autowired
    private DistrictRepository districtRepository;

    @Autowired
    private TypeLocalityRepository typeLocalityRepository;

    @Autowired
    private LocalityRepository localityRepository;

    @Autowired
    private TypeStreetRepository typeStreetRepository;

    @Autowired
    private TypeEduRepository typeEduRepository;

    @Autowired
    private YearRepository yearRepository;

    @Autowired
    private TypeSchoolRepository typeSchoolRepository;

    @Autowired
    private AwardRepository awardRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private AdvantageRepository advantageRepository;

    @Autowired
    private FacultyRepository facultyRepository;

    @Autowired
    private SpecializationRepository specializationRepository;

    @Autowired
    private PublicOrganizationRepository publicOrganizationRepository;

    @Autowired
    private CreativityRepository creativityRepository;

    @Autowired
    private SportTitleRepository sportTitleRepository;

    @Autowired
    private TypeEduFormRepository typeEduFormRepository;

    @Autowired
    private TypeEduContractRepository typeEduContractRepository;

    @Autowired
    private TypeEduPeriodRepository typeEduPeriodRepository;

    @Autowired
    private SpecialtyRepository specialtyRepository;

    @Autowired
    private ParentRepository parentRepository;

    @Autowired
    private LogRepository logRepository;

    @Autowired
    private FormValidationService formValidationService;

    @Autowired
    private UserService userService;

    @Autowired
    private ParentService parentService;

    @GetMapping("/profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {

        model.addAttribute("user", user);
        if(profileRepository.findByUser(user) == null) {
            Iterable<TypeDocument> documents = typeDocumentRepository.findAll();
            Iterable<MaritalStatus> maritalStatuses = maritalRepository.findAll();
            Iterable<Country> countries = countryRepository.findByActiveTrueOrderByShortNameAsc();
            Iterable<TypeLocality> typeLocalities = typeLocalityRepository.findAll();
            Iterable<TypeStreet> typeStreets = typeStreetRepository.findAll();

            Iterable<TypeEducation> typeEducations = typeEduRepository.findAll();
            Iterable<Year> years = yearRepository.findTop20ByOrderByNameDesc();
            Iterable<TypeSchool> typeSchools = typeSchoolRepository.findAll();
            Iterable<Award> awards = awardRepository.findByActiveTrue();
            Iterable<Language> languagesForeign = languageRepository.findByForeignLanguageTrue();
            Iterable<Language> languagesState = languageRepository.findByStateLanguageTrue();
            Iterable<Advantage> advantages = advantageRepository.findByActiveTrue();
            Iterable<Faculty> faculties = facultyRepository.findByActiveTrue();
            Iterable<Specialization> priorities = specializationRepository.findAll();

            Iterable<PublicOrganization> publicOrganizations = publicOrganizationRepository.findByActiveTrue();
            Iterable<Creativity> creativities = creativityRepository.findByActiveTrue();
            Iterable<SportTitle> sportTitles = sportTitleRepository.findByActiveTrue();

            model.addAttribute("documents", documents);
            model.addAttribute("maritalStatuses", maritalStatuses);
            model.addAttribute("countries", countries);
            model.addAttribute("typeLocalities", typeLocalities);
            model.addAttribute("typeStreets", typeStreets);

            model.addAttribute("typeEducations", typeEducations);
            model.addAttribute("years", years);
            model.addAttribute("typeSchools", typeSchools);
            model.addAttribute("awards", awards);
            model.addAttribute("langForeign", languagesForeign);
            model.addAttribute("langState", languagesState);
            model.addAttribute("advantages", advantages);
            model.addAttribute("faculties", faculties);
            model.addAttribute("priorities", priorities);

            model.addAttribute("publicOrganizations", publicOrganizations);
            model.addAttribute("creativities", creativities);
            model.addAttribute("sportTitles", sportTitles);

            Profile profile = new Profile();
            profile.setUser(user);

            model.addAttribute("profile", profile);
            return "profile";
        }
        else
            return "redirect:/info-status";
    }

    @PostMapping("/profile")
    public String addProfile(@AuthenticationPrincipal User user,
                             @RequestParam Map<String,String> allParams,
                             @RequestParam("photoAbit") MultipartFile filePhoto,
                             @Valid Profile profile,
                             BindingResult bindingResult,
                             Model model) throws IOException {


        Map<String,String> errorMap = new HashMap<>();

        if(formValidationService.isPhotoValid(filePhoto)) {
            profile.setPhotoFile(formValidationService.savePhoto(filePhoto));
        }
        else {
            if(StringUtils.isEmpty(profile.getPhotoFile()))
                errorMap.put("photoError","Формат изображения не соответствует JPG или JPEG! Пожалуйста, загрузите другой файл!");
        }


        /*Проверка пользователя начало*/

        if(profile.getUser() == null)
        {
            TypeDocument document = typeDocumentRepository.findTypeDocumentById(Integer.parseInt(allParams.get("typeDoc")));
            String seria = allParams.get("serialDoc");
            String number = allParams.get("numberDoc");
            String email = allParams.get("emailAddress");

            if(userService.isValidUser(document,seria,number,email))
                profile.setUser(userRepository.findByDocTypeAndDocSeriesAndDocNumberOrEmail(document,seria,number,email));
            else {
                if(user != null)
                    profile.setUser(user);
            }

        }

        /*Проверка пользователя конец*/

        /*Проверка родителей начало*/

        // Проверка родаков на наличие ФИО и адреса, если есть, то добавляем, если нет то нет.... Проверка, если он еще при этом выделем представителем, то кидаем ошибку
        List<Parent> parents = new ArrayList<>();

        Parent mother = null;
        Parent father = null;

        if(parentService.isValidParent(
                allParams.get("lnameM"),
                allParams.get("fnameM"),
                allParams.get("addressM"))) {

            mother = parentService.getParent(allParams.get("lnameM"),
                    allParams.get("fnameM"),
                    allParams.get("mnameM"),
                    allParams.get("phoneM"),
                    allParams.get("wplaceM"),
                    allParams.get("wpositionM"),
                    allParams.get("addressM"),
                    true,
                    allParams.get("legalRepresentative"));


            parents.add(mother);
        }
        else {
            if(allParams.get("legalRepresentative").contentEquals("mother"))
                errorMap.put("motherLegalError","Проверьте ФИО и адрес законного представителя!");
        }

        if(parentService.isValidParent(
                allParams.get("lnameF"),
                allParams.get("fnameF"),
                allParams.get("addressF"))) {

            father = parentService.getParent(allParams.get("lnameF"),
                    allParams.get("fnameF"),
                    allParams.get("mnameF"),
                    allParams.get("phoneF"),
                    allParams.get("wplaceF"),
                    allParams.get("wpositionF"),
                    allParams.get("addressF"),
                    false,
                    allParams.get("legalRepresentative"));

            parents.add(father);
        }
        else {
            if(allParams.get("legalRepresentative").contentEquals("father"))
                errorMap.put("fatherLegalError","Проверьте ФИО и адрес законного представителя!");
        }

        profile.setParentList(parents);

        if(allParams.get("legalRepresentative").contentEquals("noneRepresentative") && !profile.is18YearsOld())
        {
            errorMap.put("legalRepresentativeError", "Выберите Вашего законного представителя так как Вы несовершеннолетний!");
        }

        if(!profile.is18YearsOld()) {
            if(!formValidationService.isLegalDataValid(profile))
                errorMap.put("legalRepresentativePassportError", "Введите данные документа, удостоверяющего личность, для Вашего законного представителя!");
        }


        /*Проверка родителей конец*/




        /*Проверка места жительства начало*/

        if(!profile.isForeignCheck()) {
            if(profile.getRegistrationCountry() == null)
                errorMap.put("localityError","Выберите населенный пункт из списка! Для районных центров и городов республиканского подчинения район не указывается! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");

            if (!allParams.get("areaReg").trim().isEmpty()) {
                if (Integer.parseInt(allParams.get("areaReg")) == 5)//костыль для Минска
                    profile.setRegistrationLocality(localityRepository.findLocalityById(27542));//Minsk's id is 27542 in DB

                if(profile.getRegistrationLocality() == null) {
                    errorMap.put("localityError","Выберите населенный пункт из списка! Для районных центров и городов республиканского подчинения район не указывается! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");
                }
            }
            else {
                errorMap.put("localityError","Выберите населенный пункт из списка! Для районных центров и городов республиканского подчинения район не указывается! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");
            }
        }
        else {
            if(profile.getRegistrationCountryForeign() == null ||
                    profile.getRegistrationLocalityForeign() == null||
                    profile.getRegistrationTypeLocalityForeign() == null) {

                errorMap.put("localityError","Проверьте Ваш адрес! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");

            }
        }

        /*Проверка места жительства конец*/

        if(!formValidationService.isDisciplineSelectValid(profile))
            errorMap.put("selectedDisciplineError", "Выберите иностранный язык или государственный язык в соответствии с введенными данными");

        if(profile.getSpecialty() == null)
            errorMap.put("specialtyCheckError","Выберите специальность для участия в конкурсе");




        if(bindingResult.hasErrors() || !errorMap.isEmpty()) {



            Iterable<TypeDocument> documents = typeDocumentRepository.findAll();
            Iterable<MaritalStatus> maritalStatuses = maritalRepository.findAll();
            Iterable<Country> countries = countryRepository.findByActiveTrueOrderByShortNameAsc();
            Iterable<TypeLocality> typeLocalities = typeLocalityRepository.findAll();
            Iterable<TypeStreet> typeStreets = typeStreetRepository.findAll();

            Iterable<TypeEducation> typeEducations = typeEduRepository.findAll();
            Iterable<Year> years = yearRepository.findTop20ByOrderByNameDesc();
            Iterable<TypeSchool> typeSchools = typeSchoolRepository.findAll();
            Iterable<Award> awards = awardRepository.findByActiveTrue();
            Iterable<Language> languagesForeign = languageRepository.findByForeignLanguageTrue();
            Iterable<Language> languagesState = languageRepository.findByStateLanguageTrue();
            Iterable<Advantage> advantages = advantageRepository.findByActiveTrue();
            Iterable<Faculty> faculties = facultyRepository.findByActiveTrue();
            Iterable<Specialization> priorities = specializationRepository.findAll();

            Iterable<PublicOrganization> publicOrganizations = publicOrganizationRepository.findByActiveTrue();
            Iterable<Creativity> creativities = creativityRepository.findByActiveTrue();
            Iterable<SportTitle> sportTitles = sportTitleRepository.findByActiveTrue();


            Map<String,String> errors = UtilsController.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.mergeAttributes(errorMap);
            model.addAttribute("unValidForm","Проверьте правильность введенных данных в форму!");

            //model.addAttribute("isEditAdmin", null);

            model.addAttribute("emailAuth", profile.getUser().getEmail());
            model.addAttribute("documents", documents);
            model.addAttribute("maritalStatuses",maritalStatuses);
            model.addAttribute("countries", countries);
            model.addAttribute("typeLocalities", typeLocalities);
            model.addAttribute("typeStreets", typeStreets);

            model.addAttribute("typeEducations",typeEducations);
            model.addAttribute("years",years);
            model.addAttribute("typeSchools", typeSchools);
            model.addAttribute("awards",awards);
            model.addAttribute("langForeign", languagesForeign);
            model.addAttribute("langState", languagesState);
            model.addAttribute("advantages", advantages);
            model.addAttribute("faculties", faculties);
            model.addAttribute("priorities", priorities);

            model.addAttribute("publicOrganizations", publicOrganizations);
            model.addAttribute("creativities", creativities);
            model.addAttribute("sportTitles", sportTitles);

            model.addAttribute("parentM", mother);
            model.addAttribute("parentF", father);


            if(!profile.isForeignCheck() && (profile.getRegistrationLocality() != null || allParams.get("areaReg").contentEquals("5")))
            {
                Iterable<Area> areas = areaRepository.findByCountry(profile.getRegistrationLocality().getCountry());
                model.addAttribute("areas",areas);

                Iterable<District> districts = districtRepository.findByAreaAndActiveTrue(profile.getRegistrationLocality().getArea());
                model.addAttribute("districts",districts);
                Iterable<Locality> localities = localityRepository.findByAreaAndDistrictAndTypeLocalityOrderByNameAsc(profile.getRegistrationLocality().getArea(),profile.getRegistrationLocality().getDistrict(),profile.getRegistrationLocality().getTypeLocality());
                model.addAttribute("localities",localities);
            }

            if(profile.getSpecialty() != null)
            {
                Iterable<TypeEducationForm> typeEducationForms = specialtyRepository.findEduFormsByFacultyAndActiveTrue(profile.getSpecialty().getFaculty());
                model.addAttribute("typeEducationForms",typeEducationForms);

                Iterable<TypeEducationContract> typeEducationContracts = specialtyRepository.findEduContractsByFacultyAndEduFormAndActiveTrue(profile.getSpecialty().getFaculty(),profile.getSpecialty().getTypeEducationForm());
                model.addAttribute("typeEducationContracts",typeEducationContracts);

                Iterable<TypeEducationPeriod> typeEducationPeriods = specialtyRepository.findEduPeriodsByFacultyAndEduFormAndEduContractAndActiveTrue(profile.getSpecialty().getFaculty(),profile.getSpecialty().getTypeEducationForm(),profile.getSpecialty().getTypeEducationContract());
                model.addAttribute("typeEducationPeriods",typeEducationPeriods);

                Iterable<Specialty> specialties = specialtyRepository.findAllByFacultyAndTypeEducationFormAndTypeEducationContractAndTypeEducationPeriodAndActiveTrue(profile.getSpecialty().getFaculty(),profile.getSpecialty().getTypeEducationForm(),profile.getSpecialty().getTypeEducationContract(),profile.getSpecialty().getTypeEducationPeriod());
                model.addAttribute("specialties",specialties);
            }

            return "profile";
        }



        Profile profileFromDB = profileRepository.findByUser(user);
        if(profileFromDB == null) {

            profileRepository.save(profile);

            Log logProfile = new Log();
            logProfile.setUser(user);
            logProfile.setActionTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(System.currentTimeMillis()), ZoneId.systemDefault()));
            logProfile.setMessage("Create profile for "+profile.getUser().getEmail()+" / Username: "+profile.getLastNameRus()+" "+profile.getFirstNameRus());
            logRepository.save(logProfile);
        }
        return "redirect:/info-status";
    }



























































































    @GetMapping("/info-status")
    public String getInfoState(Model model, @AuthenticationPrincipal User user) {
        Profile profile = profileRepository.findByUser(user);

        model.addAttribute("user", user);
        model.addAttribute("profile",profile);
        return "result";
    }























































































    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/editprofile")
    public String getEditProfile(Model model, @AuthenticationPrincipal User user, @RequestParam("abitId") User abit) {

        if(profileRepository.findByUser(abit) != null) {

            model.addAttribute("isEditAdmin", true);

            Profile profile = profileRepository.findByUser(abit);
            model.addAttribute("profile", profile);

            Iterable<TypeDocument> documents = typeDocumentRepository.findAll();
            Iterable<MaritalStatus> maritalStatuses = maritalRepository.findAll();
            Iterable<Country> countries = countryRepository.findByActiveTrueOrderByShortNameAsc();
            Iterable<TypeLocality> typeLocalities = typeLocalityRepository.findAll();
            Iterable<TypeStreet> typeStreets = typeStreetRepository.findAll();

            Iterable<TypeEducation> typeEducations = typeEduRepository.findAll();
            Iterable<Year> years = yearRepository.findTop20ByOrderByNameDesc();
            Iterable<TypeSchool> typeSchools = typeSchoolRepository.findAll();
            Iterable<Award> awards = awardRepository.findByActiveTrue();
            Iterable<Language> languagesForeign = languageRepository.findByForeignLanguageTrue();
            Iterable<Language> languagesState = languageRepository.findByStateLanguageTrue();
            Iterable<Advantage> advantages = advantageRepository.findByActiveTrue();
            Iterable<Faculty> faculties = facultyRepository.findByActiveTrue();
            Iterable<Specialization> priorities = specializationRepository.findAll();

            Iterable<PublicOrganization> publicOrganizations = publicOrganizationRepository.findByActiveTrue();
            Iterable<Creativity> creativities = creativityRepository.findByActiveTrue();
            Iterable<SportTitle> sportTitles = sportTitleRepository.findByActiveTrue();

            model.addAttribute("emailAuth", user.getEmail());
            model.addAttribute("documents", documents);
            model.addAttribute("maritalStatuses", maritalStatuses);
            model.addAttribute("countries", countries);
            model.addAttribute("typeLocalities", typeLocalities);
            model.addAttribute("typeStreets", typeStreets);

            model.addAttribute("typeEducations", typeEducations);
            model.addAttribute("years", years);
            model.addAttribute("typeSchools", typeSchools);
            model.addAttribute("awards", awards);
            model.addAttribute("langForeign", languagesForeign);
            model.addAttribute("langState", languagesState);
            model.addAttribute("advantages", advantages);
            model.addAttribute("faculties", faculties);
            model.addAttribute("priorities", priorities);

            model.addAttribute("publicOrganizations", publicOrganizations);
            model.addAttribute("creativities", creativities);
            model.addAttribute("sportTitles", sportTitles);

            List<Parent> parents = profile.getParentList();

            for (Parent i:parents) {
                if(i.isMother())
                    model.addAttribute("parentM",i);
                else
                    model.addAttribute("parentF", i);
            }

            if (!profile.isForeignCheck() && (profile.getRegistrationLocality() != null)) {
                Iterable<Area> areas = areaRepository.findByCountry(profile.getRegistrationLocality().getCountry());
                model.addAttribute("areas", areas);

                Iterable<District> districts = districtRepository.findByAreaAndActiveTrue(profile.getRegistrationLocality().getArea());
                model.addAttribute("districts", districts);
                Iterable<Locality> localities = localityRepository.findByAreaAndDistrictAndTypeLocalityOrderByNameAsc(profile.getRegistrationLocality().getArea(), profile.getRegistrationLocality().getDistrict(), profile.getRegistrationLocality().getTypeLocality());
                model.addAttribute("localities", localities);
            }

            if (profile.getSpecialty() != null) {
                Iterable<TypeEducationForm> typeEducationForms = specialtyRepository.findEduFormsByFacultyAndActiveTrue(profile.getSpecialty().getFaculty());
                model.addAttribute("typeEducationForms", typeEducationForms);

                Iterable<TypeEducationContract> typeEducationContracts = specialtyRepository.findEduContractsByFacultyAndEduFormAndActiveTrue(profile.getSpecialty().getFaculty(), profile.getSpecialty().getTypeEducationForm());
                model.addAttribute("typeEducationContracts", typeEducationContracts);

                Iterable<TypeEducationPeriod> typeEducationPeriods = specialtyRepository.findEduPeriodsByFacultyAndEduFormAndEduContractAndActiveTrue(profile.getSpecialty().getFaculty(), profile.getSpecialty().getTypeEducationForm(), profile.getSpecialty().getTypeEducationContract());
                model.addAttribute("typeEducationPeriods", typeEducationPeriods);

                Iterable<Specialty> specialties = specialtyRepository.findAllByFacultyAndTypeEducationFormAndTypeEducationContractAndTypeEducationPeriodAndActiveTrue(profile.getSpecialty().getFaculty(), profile.getSpecialty().getTypeEducationForm(), profile.getSpecialty().getTypeEducationContract(), profile.getSpecialty().getTypeEducationPeriod());
                model.addAttribute("specialties", specialties);
            }

            return "profile";
        }
        else
            return "editor";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/editprofile")
    public String postEditProfile(@AuthenticationPrincipal User user,
                             @RequestParam Map<String,String> allParams,
                             @RequestParam("photoAbit") MultipartFile filePhoto,
                             @Valid Profile profile,
                             BindingResult bindingResult,
                             Model model) throws IOException {


        Map<String, String> errorMap = new HashMap<>();

        if (formValidationService.isPhotoValid(filePhoto)) {
            profile.setPhotoFile(formValidationService.savePhoto(filePhoto));
        } else {
            if (StringUtils.isEmpty(profile.getPhotoFile()))
                errorMap.put("photoError", "Формат изображения не соответствует JPG или JPEG! Пожалуйста, загрузите другой файл!");
        }


        /*Проверка пользователя начало*/

        if (profile.getUser() == null) {
            TypeDocument document = typeDocumentRepository.findTypeDocumentById(Integer.parseInt(allParams.get("typeDoc")));
            String seria = allParams.get("serialDoc");
            String number = allParams.get("numberDoc");
            String email = allParams.get("emailAddress");

            if (userService.isValidUser(document, seria, number, email))
                profile.setUser(userRepository.findByDocTypeAndDocSeriesAndDocNumberOrEmail(document, seria, number, email));
            else {
                if (user != null)
                    profile.setUser(user);
            }

        }

        /*Проверка пользователя конец*/

        /*Проверка родителей начало*/

        // Проверка родаков на наличие ФИО и адреса, если есть, то добавляем, если нет то нет.... Проверка, если он еще при этом выделем представителем, то кидаем ошибку
        List<Parent> parents = new ArrayList<>();

        Parent mother = null;
        Parent father = null;

        if (parentService.isValidParent(
                allParams.get("lnameM"),
                allParams.get("fnameM"),
                allParams.get("addressM"))) {

            mother = parentService.getParent(allParams.get("lnameM"),
                    allParams.get("fnameM"),
                    allParams.get("mnameM"),
                    allParams.get("phoneM"),
                    allParams.get("wplaceM"),
                    allParams.get("wpositionM"),
                    allParams.get("addressM"),
                    true,
                    allParams.get("legalRepresentative"));


            parents.add(mother);
        } else {
            if (allParams.get("legalRepresentative").contentEquals("mother"))
                errorMap.put("motherLegalError", "Проверьте ФИО и адрес законного представителя!");
        }

        if (parentService.isValidParent(
                allParams.get("lnameF"),
                allParams.get("fnameF"),
                allParams.get("addressF"))) {

            father = parentService.getParent(allParams.get("lnameF"),
                    allParams.get("fnameF"),
                    allParams.get("mnameF"),
                    allParams.get("phoneF"),
                    allParams.get("wplaceF"),
                    allParams.get("wpositionF"),
                    allParams.get("addressF"),
                    false,
                    allParams.get("legalRepresentative"));

            parents.add(father);
        } else {
            if (allParams.get("legalRepresentative").contentEquals("father"))
                errorMap.put("fatherLegalError", "Проверьте ФИО и адрес законного представителя!");
        }

        profile.setParentList(parents);

        if (allParams.get("legalRepresentative").contentEquals("noneRepresentative") && !profile.is18YearsOld()) {
            errorMap.put("legalRepresentativeError", "Выберите Вашего законного представителя так как Вы несовершеннолетний!");
        }

        if (!profile.is18YearsOld()) {
            if (!formValidationService.isLegalDataValid(profile))
                errorMap.put("legalRepresentativePassportError", "Введите данные документа, удостоверяющего личность, для Вашего законного представителя!");
        }


        /*Проверка родителей конец*/




        /*Проверка места жительства начало*/

        if (!profile.isForeignCheck()) {
            if (profile.getRegistrationCountry() == null)
                errorMap.put("localityError", "Выберите населенный пункт из списка! Для районных центров и городов республиканского подчинения район не указывается! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");

            if (!allParams.get("areaReg").trim().isEmpty()) {
                if (allParams.get("areaReg").contentEquals("5"))//костыль для Минска
                    profile.setRegistrationLocality(localityRepository.findLocalityById(27542));//Minsk's id is 27542 in DB

                if (profile.getRegistrationLocality() == null) {
                    errorMap.put("localityError", "Выберите населенный пункт из списка! Для районных центров и городов республиканского подчинения район не указывается! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");
                }
            } else {
                errorMap.put("localityError", "Выберите населенный пункт из списка! Для районных центров и городов республиканского подчинения район не указывается! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");
            }
        } else {
            if (profile.getRegistrationCountryForeign() == null ||
                    profile.getRegistrationLocalityForeign() == null ||
                    profile.getRegistrationTypeLocalityForeign() == null) {

                errorMap.put("localityError", "Проверьте Ваш адрес! В случае проблемы при заполнении обращайтесь по тел.+375 (33) 611-30-27");

            }
        }

        /*Проверка места жительства конец*/

        if (!formValidationService.isDisciplineSelectValid(profile))
            errorMap.put("selectedDisciplineError", "Выберите иностранный язык или государственный язык в соответствии с введенными данными");

        if (profile.getSpecialty() == null)
            errorMap.put("specialtyCheckError", "Выберите специальность для участия в конкурсе");


        if (bindingResult.hasErrors() || !errorMap.isEmpty()) {

            model.addAttribute("isEditAdmin", true);

            Iterable<TypeDocument> documents = typeDocumentRepository.findAll();
            Iterable<MaritalStatus> maritalStatuses = maritalRepository.findAll();
            Iterable<Country> countries = countryRepository.findByActiveTrueOrderByShortNameAsc();
            Iterable<TypeLocality> typeLocalities = typeLocalityRepository.findAll();
            Iterable<TypeStreet> typeStreets = typeStreetRepository.findAll();

            Iterable<TypeEducation> typeEducations = typeEduRepository.findAll();
            Iterable<Year> years = yearRepository.findTop20ByOrderByNameDesc();
            Iterable<TypeSchool> typeSchools = typeSchoolRepository.findAll();
            Iterable<Award> awards = awardRepository.findByActiveTrue();
            Iterable<Language> languagesForeign = languageRepository.findByForeignLanguageTrue();
            Iterable<Language> languagesState = languageRepository.findByStateLanguageTrue();
            Iterable<Advantage> advantages = advantageRepository.findByActiveTrue();
            Iterable<Faculty> faculties = facultyRepository.findByActiveTrue();
            Iterable<Specialization> priorities = specializationRepository.findAll();

            Iterable<PublicOrganization> publicOrganizations = publicOrganizationRepository.findByActiveTrue();
            Iterable<Creativity> creativities = creativityRepository.findByActiveTrue();
            Iterable<SportTitle> sportTitles = sportTitleRepository.findByActiveTrue();


            Map<String, String> errors = UtilsController.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.mergeAttributes(errorMap);
            model.addAttribute("unValidForm", "Проверьте правильность введенных данных в форму!");

            //model.addAttribute("isEditAdmin", null);

            model.addAttribute("emailAuth", profile.getUser().getEmail());
            model.addAttribute("documents", documents);
            model.addAttribute("maritalStatuses", maritalStatuses);
            model.addAttribute("countries", countries);
            model.addAttribute("typeLocalities", typeLocalities);
            model.addAttribute("typeStreets", typeStreets);

            model.addAttribute("typeEducations", typeEducations);
            model.addAttribute("years", years);
            model.addAttribute("typeSchools", typeSchools);
            model.addAttribute("awards", awards);
            model.addAttribute("langForeign", languagesForeign);
            model.addAttribute("langState", languagesState);
            model.addAttribute("advantages", advantages);
            model.addAttribute("faculties", faculties);
            model.addAttribute("priorities", priorities);

            model.addAttribute("publicOrganizations", publicOrganizations);
            model.addAttribute("creativities", creativities);
            model.addAttribute("sportTitles", sportTitles);

            model.addAttribute("parentM", mother);
            model.addAttribute("parentF", father);


            if (!profile.isForeignCheck() && (profile.getRegistrationLocality() != null || allParams.get("areaReg").contentEquals("5"))) {
                Iterable<Area> areas = areaRepository.findByCountry(profile.getRegistrationLocality().getCountry());
                model.addAttribute("areas", areas);

                Iterable<District> districts = districtRepository.findByAreaAndActiveTrue(profile.getRegistrationLocality().getArea());
                model.addAttribute("districts", districts);
                Iterable<Locality> localities = localityRepository.findByAreaAndDistrictAndTypeLocalityOrderByNameAsc(profile.getRegistrationLocality().getArea(), profile.getRegistrationLocality().getDistrict(), profile.getRegistrationLocality().getTypeLocality());
                model.addAttribute("localities", localities);
            }

            if (profile.getSpecialty() != null) {
                Iterable<TypeEducationForm> typeEducationForms = specialtyRepository.findEduFormsByFacultyAndActiveTrue(profile.getSpecialty().getFaculty());
                model.addAttribute("typeEducationForms", typeEducationForms);

                Iterable<TypeEducationContract> typeEducationContracts = specialtyRepository.findEduContractsByFacultyAndEduFormAndActiveTrue(profile.getSpecialty().getFaculty(), profile.getSpecialty().getTypeEducationForm());
                model.addAttribute("typeEducationContracts", typeEducationContracts);

                Iterable<TypeEducationPeriod> typeEducationPeriods = specialtyRepository.findEduPeriodsByFacultyAndEduFormAndEduContractAndActiveTrue(profile.getSpecialty().getFaculty(), profile.getSpecialty().getTypeEducationForm(), profile.getSpecialty().getTypeEducationContract());
                model.addAttribute("typeEducationPeriods", typeEducationPeriods);

                Iterable<Specialty> specialties = specialtyRepository.findAllByFacultyAndTypeEducationFormAndTypeEducationContractAndTypeEducationPeriodAndActiveTrue(profile.getSpecialty().getFaculty(), profile.getSpecialty().getTypeEducationForm(), profile.getSpecialty().getTypeEducationContract(), profile.getSpecialty().getTypeEducationPeriod());
                model.addAttribute("specialties", specialties);
            }

            return "profile";
        }


        Profile profileFromDB = profileRepository.findById(profile.getId());
        if (profileFromDB != null) {

            profileRepository.save(profile);

            Log logProfile = new Log();
            logProfile.setUser(user);
            logProfile.setActionTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(System.currentTimeMillis()), ZoneId.systemDefault()));
            logProfile.setMessage("Create profile for " + profile.getUser().getEmail() + " / Username: " + profile.getLastNameRus() + " " + profile.getFirstNameRus());
            logRepository.save(logProfile);
        }
        Iterable<TypeDocument> documents = typeDocumentRepository.findAll();
        model.addAttribute("documents",documents);
        return "editor";
    }

}
