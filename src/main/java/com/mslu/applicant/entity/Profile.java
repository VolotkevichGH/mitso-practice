package com.mslu.applicant.entity;

import com.mslu.applicant.entity.references.*;
import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.List;

@Entity
public class Profile {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Size(min=2, max=35, message = "Введите фамилию")
    private String lastNameRus;

    @Size(min=2, max=35, message = "Введите имя")
    private String firstNameRus;

    @Size(max=30,message = "Превышение лимита на ввод")
    private String middleNameRus;

    @NotNull(message = "Введите дату рождения")
    @DateTimeFormat(pattern="dd.MM.yyyy")
    private LocalDate birthDay;

    @NotNull(message = "Укажите Ваш пол")
    private byte sex;

    @Size(max=30,message = "Превышение лимита на ввод")
    private String nationality;

    @OneToOne
    @JoinColumn(name = "maritalStatusId", referencedColumnName = "id")
    @NotNull(message = "Выберите из списка")
    private MaritalStatus maritalStatus;

    @Size(min = 8, message = "Введите номер телефона")
    @Size(max=20,message = "Превышение лимита на ввод")
    private String phone;

    @Size(max=30,message = "Превышение лимита на ввод")
    private String personalNumber;

    @NotNull(message = "Введите дату начала действия документа")
    @DateTimeFormat(pattern="dd.MM.yyyy")
    private LocalDate docOnDate;

    @NotNull(message = "Введите дату окончания действия документа")
    @DateTimeFormat(pattern="dd.MM.yyyy")
    private LocalDate docOffDate;

    @NotBlank(message = "Введите название учреждения, выдавшего документ")
    @Size(max=100,message = "Превышение лимита на ввод")
    private String docIssuedBy;

    @Size(max=30,message = "Превышение лимита на ввод")
    private String citizenship;

    @NotBlank(message = "Введите фамилию на белорусском языке")
    @Size(max=30,message = "Превышение лимита на ввод")
    private String lastNameBlr;

    @NotBlank(message = "Введите имя на белорусском языке")
    @Size(max=30,message = "Превышение лимита на ввод")
    private String firstNameBlr;

    @Size(max=30,message = "Превышение лимита на ввод")
    private String middleNameBlr;

    @NotBlank(message = "Введите фамилию на латинице")
    @Size(max=30,message = "Превышение лимита на ввод")
    private String lastNameLat;

    @NotBlank(message = "Введите имя на латинице")
    @Size(max=30,message = "Превышение лимита на ввод")
    private String firstNameLat;

    private boolean foreignCheck;

    @OneToOne
    @JoinColumn(name = "regCountryForeign", referencedColumnName = "id")
    private Country registrationCountryForeign;

    @OneToOne
    @JoinColumn(name = "regCountry", referencedColumnName = "id")
    private Country registrationCountry;

    @Column(name = "regAreaForeign")
    @Size(max=35,message = "Превышение лимита на ввод")
    private String registrationAreaForeign;

    @Column(name = "regDistrictForeign")
    @Size(max=35,message = "Превышение лимита на ввод")
    private String registrationDistrictForeign;

    @OneToOne
    @JoinColumn(name = "regTypeLocalityForeign", referencedColumnName = "id")
    private TypeLocality registrationTypeLocalityForeign;

    @Column(name = "regLocalityForeign")
    @Size(max=35,message = "Превышение лимита на ввод")
    private String registrationLocalityForeign;

    @OneToOne
    @JoinColumn(name = "regLocality", referencedColumnName = "id")
    private Locality registrationLocality;

    @Column(name = "regZipCodeForeign")
    @Size(max=10,message = "Превышение лимита на ввод")
    private String registrationZipCodeForeign;

    @Column(name = "regZipCode")
    @Size(max=10,message = "Превышение лимита на ввод")
    private String registrationZipCode;

    @OneToOne
    @JoinColumn(name = "regTypeStreet", referencedColumnName = "id")
    @NotNull(message = "Выберите тип улицы")
    private TypeStreet registrationTypeStreet;

    @Column(name = "regStreetName")
    @NotBlank(message = "Введите название улицы")
    @Size(max=30,message = "Превышение лимита на ввод")
    private String registrationStreetName;

    @Column(name = "regBuildingNumber")
    @NotBlank(message = "Введите номер дома")
    @Size(max=5,message = "Превышение лимита на ввод")
    private String registrationBuildingNumber;

    @Column(name = "regBuildingPart")
    @Size(max=5,message = "Превышение лимита на ввод")
    private String registrationBuildingPart;

    @Column(name = "regApartment")
    @Size(max=5,message = "Превышение лимита на ввод")
    private String registrationApartment;

    @OneToOne
    @JoinColumn(name = "typeEducation", referencedColumnName = "id")
    @NotNull(message = "Выберите уровень образования")
    private TypeEducation typeEducation;

    @OneToOne
    @JoinColumn(name = "yearEducation", referencedColumnName = "id")
    @NotNull(message = "Выберите год окончания")
    private Year yearEducation;

    @OneToOne
    @JoinColumn(name = "typeSchool", referencedColumnName = "id")
    @NotNull(message = "Выберите тип учебного заведения")
    private TypeSchool typeSchool;

    @NotNull(message = "Выберите тип населённого пункта")
    private boolean villageSchool;

    @NotBlank(message = "Введите наименование учреждения образования")
    @Size(max=170,message = "Превышение лимита на ввод")
    private String fullNameSchool;

    @Size(max=100,message = "Превышение лимита на ввод")
    private String nameSpecialty;

    @NotBlank(message = "Введите серию и номер документа об образовании")
    @Size(max=15,message = "Превышение лимита на ввод")
    private String docEduNumber;

    @NotNull(message = "Введите дату выдачи документа об образовании")
    @DateTimeFormat(pattern="dd.MM.yyyy")
    private LocalDate docEduDate;

    @NotNull(message = "Введите балл документа об образовании")
    @Min(10)
    @Max(100)
    private Integer docEduPoint;

    @ManyToMany
    @JoinTable(name="user_award",
            joinColumns=@JoinColumn(name="profile_id",referencedColumnName = "id"),
            inverseJoinColumns=@JoinColumn(name="award_id",referencedColumnName = "id"))
    private List<Award> awardList;

    private boolean target;

    @Size(max=100,message = "Превышение лимита на ввод")
    private String targetIssuedBy;

    private boolean workExperience;

    @Size(max=100,message = "Превышение лимита на ввод")
    private String workPlace;

    @Size(max=100,message = "Превышение лимита на ввод")
    private String position;

    @Max(50)
    @Min(0)
    private Integer workExperienceYears;

    @Max(11)
    @Min(0)
    private Integer workExperienceMonths;

    private boolean needHostel;


    @Column(name = "siblingsSpec")
    private boolean siblingsSpecialty;

    private boolean teacherClassGraduate;

    @OneToOne
    @JoinColumn(name = "foreignLanguage", referencedColumnName = "id")
    private Language foreignLanguage;

    @Size(max=10,message = "Превышение лимита на ввод")
    private String foreignLanguageCode;

    @Max(100)
    @Min(25)
    private Integer foreignLanguagePoint;

    @OneToOne
    @JoinColumn(name = "stateLanguage", referencedColumnName = "id")
    private Language stateLanguage;

    @Size(max=10,message = "Превышение лимита на ввод")
    private String stateLanguageCode;

    @Max(100)
    @Min(10)
    private Integer stateLanguagePoint;

    @Size(max=10,message = "Превышение лимита на ввод")
    private String historyCode;

    @Max(100)
    @Min(15)
    private Integer historyPoint;

    @ManyToMany
    @JoinTable(name="user_advantage",
            joinColumns=@JoinColumn(name="profile_id",referencedColumnName = "id"),
            inverseJoinColumns=@JoinColumn(name="advantage_id",referencedColumnName = "id"))
    private List<Advantage> advantageList;

    @OneToOne
    @JoinColumn(name = "specialty", referencedColumnName = "id")
    @NotNull(message = "Выберите специальность для участия в конкурсе")
    private Specialty specialty;

    @OneToOne
    @JoinColumn(name = "priority1", referencedColumnName = "id")
    private Specialization priority1;

    @OneToOne
    @JoinColumn(name = "priority2", referencedColumnName = "id")
    private Specialization priority2;

    @OneToOne
    @JoinColumn(name = "priority3", referencedColumnName = "id")
    private Specialization priority3;

    @OneToOne
    @JoinColumn(name = "priority4", referencedColumnName = "id")
    private Specialization priority4;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "profileId")
    private List<Parent> parentList;

    @OneToOne
    @JoinColumn(name = "docTypeLegal", referencedColumnName = "id")
    //@NotNull(message = "Выберите тип документа, удостоверяющего личность")
    private TypeDocument docTypeLegal;

    //@NotBlank(message = "Введите серию документа")
    @Size(max=10,message = "Превышение лимита на ввод")
    private String docSeriesLegal;

    //@NotBlank(message = "Введите номер документа")
    @Size(max=20,message = "Превышение лимита на ввод")
    private String docNumberLegal;

    @Size(max=20,message = "Превышение лимита на ввод")
    private String personalNumberLegal;

    //@NotNull(message = "Введите дату начала действия документа")
    @DateTimeFormat(pattern="dd.MM.yyyy")
    private LocalDate docOnDateLegal;

    //@NotNull(message = "Введите дату окончания действия документа")
    @DateTimeFormat(pattern="dd.MM.yyyy")
    private LocalDate docOffDateLegal;

    //@NotBlank(message = "Введите название учреждения, выдавшего документ")
    @Size(max=100,message = "Превышение лимита на ввод")
    private String docIssuedByLegal;

    @ManyToMany
    @JoinTable(name="user_organization",
            joinColumns=@JoinColumn(name="profile_id",referencedColumnName = "id"),
            inverseJoinColumns=@JoinColumn(name="organization_id",referencedColumnName = "id"))
    private List<PublicOrganization> publicOrganizationList;

    @Size(max=100,message = "Превышение лимита на ввод")
    private String otherPublicOrganization;

    @ManyToMany
    @JoinTable(name="user_creativity",
            joinColumns=@JoinColumn(name="profile_id",referencedColumnName = "id"),
            inverseJoinColumns=@JoinColumn(name="creativity_id",referencedColumnName = "id"))
    private List<Creativity> creativityList;

    @Size(max=100,message = "Превышение лимита на ввод")
    private String otherCreativity;

    @Size(max=200,message = "Превышение лимита на ввод")
    private String achievementList;

    private boolean memberNationalTeam;

    @Size(max=200,message = "Превышение лимита на ввод")
    private String sportList;

    @OneToOne
    @JoinColumn(name = "sportTitle", referencedColumnName = "id")
    private SportTitle sportTitle;

    @Size(max=5,message = "Превышение лимита на ввод")
    private String caseNumber;

    private boolean isExported;

    private String photoFile;

    @OneToOne
    @JoinColumn(name = "typeCompetition", referencedColumnName = "id")
    private TypeCompetition typeCompetition;

    public Profile() {
        this.isExported = false;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getLastNameRus() {
        return lastNameRus;
    }

    public void setLastNameRus(String lastNameRus) {
        this.lastNameRus = lastNameRus;
    }

    public String getFirstNameRus() {
        return firstNameRus;
    }

    public void setFirstNameRus(String firstNameRus) {
        this.firstNameRus = firstNameRus;
    }

    public String getMiddleNameRus() {
        return middleNameRus;
    }

    public void setMiddleNameRus(String middleNameRus) {
        this.middleNameRus = middleNameRus;
    }

    public LocalDate getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
    }

    public byte getSex() {
        return sex;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public MaritalStatus getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(MaritalStatus maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPersonalNumber() {
        return personalNumber;
    }

    public void setPersonalNumber(String personalNumber) {
        this.personalNumber = personalNumber;
    }

    public LocalDate getDocOnDate() {
        return docOnDate;
    }

    public void setDocOnDate(LocalDate docOnDate) {
        this.docOnDate = docOnDate;
    }

    public LocalDate getDocOffDate() {
        return docOffDate;
    }

    public void setDocOffDate(LocalDate docOffDate) {
        this.docOffDate = docOffDate;
    }

    public String getDocIssuedBy() {
        return docIssuedBy;
    }

    public void setDocIssuedBy(String docIssuedBy) {
        this.docIssuedBy = docIssuedBy;
    }

    public String getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }

    public String getLastNameBlr() {
        return lastNameBlr;
    }

    public void setLastNameBlr(String lastNameBlr) {
        this.lastNameBlr = lastNameBlr;
    }

    public String getFirstNameBlr() {
        return firstNameBlr;
    }

    public void setFirstNameBlr(String firstNameBlr) {
        this.firstNameBlr = firstNameBlr;
    }

    public String getMiddleNameBlr() {
        return middleNameBlr;
    }

    public void setMiddleNameBlr(String middleNameBlr) {
        this.middleNameBlr = middleNameBlr;
    }

    public String getLastNameLat() {
        return lastNameLat;
    }

    public void setLastNameLat(String lastNameLat) {
        this.lastNameLat = lastNameLat;
    }

    public String getFirstNameLat() {
        return firstNameLat;
    }

    public void setFirstNameLat(String firstNameLat) {
        this.firstNameLat = firstNameLat;
    }

    public boolean isForeignCheck() {
        return foreignCheck;
    }

    public void setForeignCheck(boolean foreignCheck) {
        this.foreignCheck = foreignCheck;
    }

    public Country getRegistrationCountryForeign() {
        return registrationCountryForeign;
    }

    public void setRegistrationCountryForeign(Country registrationCountryForeign) {
        this.registrationCountryForeign = registrationCountryForeign;
    }

    public Country getRegistrationCountry() {
        return registrationCountry;
    }

    public void setRegistrationCountry(Country registrationCountry) {
        this.registrationCountry = registrationCountry;
    }

    public String getRegistrationAreaForeign() {
        return registrationAreaForeign;
    }

    public void setRegistrationAreaForeign(String registrationAreaForeign) {
        this.registrationAreaForeign = registrationAreaForeign;
    }

    public String getRegistrationDistrictForeign() {
        return registrationDistrictForeign;
    }

    public void setRegistrationDistrictForeign(String registrationDistrictForeign) {
        this.registrationDistrictForeign = registrationDistrictForeign;
    }

    public TypeLocality getRegistrationTypeLocalityForeign() {
        return registrationTypeLocalityForeign;
    }

    public void setRegistrationTypeLocalityForeign(TypeLocality registrationTypeLocalityForeign) {
        this.registrationTypeLocalityForeign = registrationTypeLocalityForeign;
    }

    public Locality getRegistrationLocality() {
        return registrationLocality;
    }

    public void setRegistrationLocality(Locality registrationLocality) {
        this.registrationLocality = registrationLocality;
    }

    public String getRegistrationLocalityForeign() {
        return registrationLocalityForeign;
    }

    public void setRegistrationLocalityForeign(String registrationLocalityForeign) {
        this.registrationLocalityForeign = registrationLocalityForeign;
    }

    public String getRegistrationZipCodeForeign() {
        return registrationZipCodeForeign;
    }

    public void setRegistrationZipCodeForeign(String registrationZipCodeForeign) {
        this.registrationZipCodeForeign = registrationZipCodeForeign;
    }

    public String getRegistrationZipCode() {
        return registrationZipCode;
    }

    public void setRegistrationZipCode(String registrationZipCode) {
        this.registrationZipCode = registrationZipCode;
    }

    public @NotNull(message = "Выберите тип улицы") TypeStreet getRegistrationTypeStreet() {
        return registrationTypeStreet;
    }

    public void setRegistrationTypeStreet(@NotNull(message = "Выберите тип улицы") TypeStreet registrationTypeStreet) {
        this.registrationTypeStreet = registrationTypeStreet;
    }

    public String getRegistrationStreetName() {
        return registrationStreetName;
    }

    public void setRegistrationStreetName(String registrationStreetName) {
        this.registrationStreetName = registrationStreetName;
    }

    public String getRegistrationBuildingNumber() {
        return registrationBuildingNumber;
    }

    public void setRegistrationBuildingNumber(String registrationBuildingNumber) {
        this.registrationBuildingNumber = registrationBuildingNumber;
    }

    public String getRegistrationBuildingPart() {
        return registrationBuildingPart;
    }

    public void setRegistrationBuildingPart(String registrationBuildingPart) {
        this.registrationBuildingPart = registrationBuildingPart;
    }

    public String getRegistrationApartment() {
        return registrationApartment;
    }

    public void setRegistrationApartment(String registrationApartment) {
        this.registrationApartment = registrationApartment;
    }

    public TypeEducation getTypeEducation() {
        return typeEducation;
    }

    public void setTypeEducation(TypeEducation typeEducation) {
        this.typeEducation = typeEducation;
    }

    public Year getYearEducation() {
        return yearEducation;
    }

    public void setYearEducation(Year yearEducation) {
        this.yearEducation = yearEducation;
    }

    public TypeSchool getTypeSchool() {
        return typeSchool;
    }

    public void setTypeSchool(TypeSchool typeSchool) {
        this.typeSchool = typeSchool;
    }

    public boolean isVillageSchool() {
        return villageSchool;
    }

    public void setVillageSchool(boolean villageSchool) {
        this.villageSchool = villageSchool;
    }

    public String getFullNameSchool() {
        return fullNameSchool;
    }

    public void setFullNameSchool(String fullNameSchool) {
        this.fullNameSchool = fullNameSchool;
    }

    public String getNameSpecialty() {
        return nameSpecialty;
    }

    public void setNameSpecialty(String nameSpecialty) {
        this.nameSpecialty = nameSpecialty;
    }

    public String getDocEduNumber() {
        return docEduNumber;
    }

    public void setDocEduNumber(String docEduNumber) {
        this.docEduNumber = docEduNumber;
    }

    public LocalDate getDocEduDate() {
        return docEduDate;
    }

    public void setDocEduDate(LocalDate docEduDate) {
        this.docEduDate = docEduDate;
    }

    public Integer getDocEduPoint() {
        return docEduPoint;
    }

    public void setDocEduPoint(Integer docEduPoint) {
        this.docEduPoint = docEduPoint;
    }

    public List<Award> getAwardList() {
        return awardList;
    }

    public void setAwardList(List<Award> awards) {
        this.awardList = awards;
    }

    public boolean isTarget() {
        return target;
    }

    public void setTarget(boolean target) {
        this.target = target;
    }

    public String getTargetIssuedBy() {
        return targetIssuedBy;
    }

    public void setTargetIssuedBy(String targetIssuedBy) {
        this.targetIssuedBy = targetIssuedBy;
    }

    public boolean isWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(boolean workExperience) {
        this.workExperience = workExperience;
    }

    public String getWorkPlace() {
        return workPlace;
    }

    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getWorkExperienceYears() {
        return workExperienceYears;
    }

    public void setWorkExperienceYears(Integer workExperienceYears) {
        this.workExperienceYears = workExperienceYears;
    }

    public Integer getWorkExperienceMonths() {
        return workExperienceMonths;
    }

    public void setWorkExperienceMonths(Integer getWorkExperienceMonths) {
        this.workExperienceMonths = getWorkExperienceMonths;
    }

    public boolean isNeedHostel() {
        return needHostel;
    }

    public void setNeedHostel(boolean needHostel) {
        this.needHostel = needHostel;
    }

    public boolean isSiblingsSpecialty() {
        return siblingsSpecialty;
    }

    public void setSiblingsSpecialty(boolean siblingsSpecialty) {
        this.siblingsSpecialty = siblingsSpecialty;
    }

    public boolean isTeacherClassGraduate() {
        return teacherClassGraduate;
    }

    public void setTeacherClassGraduate(boolean teacherClassGraduate) {
        this.teacherClassGraduate = teacherClassGraduate;
    }

    public Language getForeignLanguage() {
        return foreignLanguage;
    }

    public void setForeignLanguage(Language foreignLanguage) {
        this.foreignLanguage = foreignLanguage;
    }

    public String getForeignLanguageCode() {
        return foreignLanguageCode;
    }

    public void setForeignLanguageCode(String foreignLanguageCode) {
        this.foreignLanguageCode = foreignLanguageCode;
    }

    public Integer getForeignLanguagePoint() {
        return foreignLanguagePoint;
    }

    public void setForeignLanguagePoint(Integer foreignLanguagePoint) {
        this.foreignLanguagePoint = foreignLanguagePoint;
    }

    public Language getStateLanguage() {
        return stateLanguage;
    }

    public void setStateLanguage(Language stateLanguage) {
        this.stateLanguage = stateLanguage;
    }

    public String getStateLanguageCode() {
        return stateLanguageCode;
    }

    public void setStateLanguageCode(String stateLanguageCode) {
        this.stateLanguageCode = stateLanguageCode;
    }

    public Integer getStateLanguagePoint() {
        return stateLanguagePoint;
    }

    public void setStateLanguagePoint(Integer stateLanguagePoint) {
        this.stateLanguagePoint = stateLanguagePoint;
    }

    public String getHistoryCode() {
        return historyCode;
    }

    public void setHistoryCode(String historyCode) {
        this.historyCode = historyCode;
    }

    public Integer getHistoryPoint() {
        return historyPoint;
    }

    public void setHistoryPoint(Integer historyPoint) {
        this.historyPoint = historyPoint;
    }

    public List<Advantage> getAdvantageList() {
        return advantageList;
    }

    public void setAdvantageList(List<Advantage> advantages) {
        this.advantageList = advantages;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    public Specialization getPriority1() {
        return priority1;
    }

    public void setPriority1(Specialization priority1) {
        this.priority1 = priority1;
    }

    public Specialization getPriority2() {
        return priority2;
    }

    public void setPriority2(Specialization priority2) {
        this.priority2 = priority2;
    }

    public Specialization getPriority3() {
        return priority3;
    }

    public void setPriority3(Specialization priority3) {
        this.priority3 = priority3;
    }

    public Specialization getPriority4() {
        return priority4;
    }

    public void setPriority4(Specialization priority4) {
        this.priority4 = priority4;
    }

    public List<Parent> getParentList() {
        return parentList;
    }

    public void setParentList(List<Parent> parentList) {
        this.parentList = parentList;
    }

    public TypeDocument getDocTypeLegal() {
        return docTypeLegal;
    }

    public void setDocTypeLegal(TypeDocument docTypeLegal) {
        this.docTypeLegal = docTypeLegal;
    }

    public String getDocSeriesLegal() {
        return docSeriesLegal;
    }

    public void setDocSeriesLegal(String docSeriesLegal) {
        this.docSeriesLegal = docSeriesLegal;
    }

    public String getDocNumberLegal() {
        return docNumberLegal;
    }

    public void setDocNumberLegal(String docNumberLegal) {
        this.docNumberLegal = docNumberLegal;
    }

    public String getPersonalNumberLegal() {
        return personalNumberLegal;
    }

    public void setPersonalNumberLegal(String personalNumberLegal) {
        this.personalNumberLegal = personalNumberLegal;
    }

    public LocalDate getDocOnDateLegal() {
        return docOnDateLegal;
    }

    public void setDocOnDateLegal(LocalDate docOnDateLegal) {
        this.docOnDateLegal = docOnDateLegal;
    }

    public LocalDate getDocOffDateLegal() {
        return docOffDateLegal;
    }

    public void setDocOffDateLegal(LocalDate docOffDateLegal) {
        this.docOffDateLegal = docOffDateLegal;
    }

    public String getDocIssuedByLegal() {
        return docIssuedByLegal;
    }

    public void setDocIssuedByLegal(String docIssuedByLegal) {
        this.docIssuedByLegal = docIssuedByLegal;
    }

    public List<PublicOrganization> getPublicOrganizationList() {
        return publicOrganizationList;
    }

    public void setPublicOrganizationList(List<PublicOrganization> publicOrganizationList) {
        this.publicOrganizationList = publicOrganizationList;
    }

    public String getOtherPublicOrganization() {
        return otherPublicOrganization;
    }

    public void setOtherPublicOrganization(String otherPublicOrganization) {
        this.otherPublicOrganization = otherPublicOrganization;
    }

    public List<Creativity> getCreativityList() {
        return creativityList;
    }

    public void setCreativityList(List<Creativity> creativityList) {
        this.creativityList = creativityList;
    }

    public String getOtherCreativity() {
        return otherCreativity;
    }

    public void setOtherCreativity(String otherCreativity) {
        this.otherCreativity = otherCreativity;
    }

    public String getAchievementList() {
        return achievementList;
    }

    public void setAchievementList(String achievementList) {
        this.achievementList = achievementList;
    }

    public boolean isMemberNationalTeam() {
        return memberNationalTeam;
    }

    public void setMemberNationalTeam(boolean memberNationalTeam) {
        this.memberNationalTeam = memberNationalTeam;
    }

    public String getSportList() {
        return sportList;
    }

    public void setSportList(String sportList) {
        this.sportList = sportList;
    }

    public SportTitle getSportTitle() {
        return sportTitle;
    }

    public void setSportTitle(SportTitle sportTitle) {
        this.sportTitle = sportTitle;
    }

    public boolean is18YearsOld() {
        LocalDate today = LocalDate.now();
        int ages = today.getYear() - this.getBirthDay().getYear();
        return ages >= 18;
    }

    public String getCaseNumber() {
        return caseNumber;
    }

    public void setCaseNumber(String caseNumber) {
        this.caseNumber = caseNumber;
    }

    public boolean isExported() {
        return isExported;
    }

    public void setExported(boolean exported) {
        isExported = exported;
    }

    public String getPhotoFile() {
        return photoFile;
    }

    public void setPhotoFile(String photoFileName) {
        this.photoFile = photoFileName;
    }

    public TypeCompetition getTypeCompetition() {
        return typeCompetition;
    }

    public void setTypeCompetition(TypeCompetition typeCompetition) {
        this.typeCompetition = typeCompetition;
    }

}
