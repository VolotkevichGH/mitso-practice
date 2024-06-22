<#-- @ftlvariable name="profile" type="com.mslu.applicant.entity.Profile" -->
<#-- @ftlvariable name="parent" type="com.mslu.applicant.entity.references.Parent" -->
<#-- @ftlvariable name="district" type="com.mslu.applicant.entity.references.District" -->
<#setting number_format="####">
<html>
<head>
<style>
    body,
    h1,
    h2,
    h3,
    h4,
    p,
    ul[class],
    ol[class],
    li,
    figure,
    figcaption,
    blockquote,
    dl,
    dd {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
    }

    .wrapper {
        font-size: 12pt;
        line-height: 1.5;
    }
    .content {
        font-size: 10pt;
    }
    .section {
        margin-top: 0.5cm;
    }
    .section-justify {
        text-align: justify;
    }
    .section-right {
        text-align: right;
    }
    .section-indent {
        text-indent: 40px;
    }
    .section-center {
        text-align: center;
    }
    .upper {
        text-transform: uppercase;
    }
    table.content-table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid #3c3c3c;
    }
    .content-table td {
        border: 1px solid #3c3c3c;
    }

    .faculty-tr {
        height: 90px;
    }
    .note {
        font-size: 8pt;
    }
    .operation-text {
        font-weight: bold;
        font-style: italic;
    }
    .attention-text {
        font-weight: bold;
    }
    .result-ball {
        font-size: 16pt;
    }
</style>
</head>
<body>
<div class="wrapper">
    <p class="section-center">Учреждение образования</p>
    <p class="section-center upper">"Минский государственный лингвистический университет"</p>
    <p class="section-center upper">Анкета абитуриента</p>
    <table class="content-table">
        <tr>
            <td colspan="6">
                <p class="attention-text">Факультет, специальность</p>
            </td>
            <td colspan="2" class="section-center attention-text">Вид конкурса</td>
            <td colspan="2" class="section-center attention-text">Номер дела</td>
            <td colspan="2" class="section-center attention-text">Общий балл</td>
        </tr>
        <tr>
            <td rowspan="2" colspan="6">
                <p class="operation-text">${profile.specialty.faculty.fullName?string}: ${profile.specialty.fullName?string}</p>
                <p>Форма обучения: <span class="operation-text">${profile.specialty.typeEducationForm.shortName}</span></p>
                <p>Форма договора на обучение: <span class="operation-text">${profile.specialty.typeEducationContract.shortName}</span></p>
            </td>
            <td colspan="6" class="section-center note" >заполняется членом приемной комиссии</td>
        </tr>
        <tr class="faculty-tr">
            <td colspan="2"></td>
            <td colspan="2"></td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="12" class="section-center"><strong>Персональные данные абитуриента</strong></td>
        </tr>
        <tr>
            <td colspan="3">ФИО на русском языке</td>
            <td colspan="9">${profile.lastNameRus?upper_case} ${profile.firstNameRus?upper_case} <#if profile.middleNameRus?has_content>${profile.middleNameRus?upper_case}</#if></td>
        </tr>
        <tr>
            <td colspan="12">
                <p>Адрес:
                    <#if !profile.foreignCheck>
                        ${profile.registrationZipCode},
                        <#if profile.registrationLocality.area.id != 5>${profile.registrationLocality.area.name}, </#if>
                        <#if profile.registrationLocality.district != 0 && district?has_content>${district.name}, </#if>
                        ${profile.registrationLocality.typeLocality.shortName}${profile.registrationLocality.name},
                    <#else>
                        <#if profile.registrationZipCodeForeign?has_content>${profile.registrationZipCodeForeign} ,</#if>
                        <#if profile.registrationCountryForeign?has_content>${profile.registrationCountryForeign.shortName}, </#if>
                        <#if profile.registrationAreaForeign?has_content>${profile.registrationAreaForeign?string}, </#if>
                        <#if profile.registrationDistrictForeign?has_content>${profile.registrationDistrictForeign?string}, </#if>
                        <#if profile.registrationTypeLocalityForeign?has_content>${profile.registrationTypeLocalityForeign.shortName}</#if>
                        <#if profile.registrationLocalityForeign?has_content>${profile.registrationLocalityForeign}, </#if>
                    </#if>
                    ${profile.registrationTypeStreet.shortName}
                    ${profile.registrationStreetName},
                    д.${profile.registrationBuildingNumber?string}<#if profile.registrationBuildingPart?has_content>, к.${profile.registrationBuildingPart?string}</#if>
                    <#if profile.registrationApartment?has_content>, кв.${profile.registrationApartment?string}, </#if>
                    моб.тел. ${profile.phone?string}</p>
                <p>Паспортные данные: ${profile.user.docType.type}, ${profile.user.docSeries} ${profile.user.docNumber}, дата выдачи ${profile.docOnDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}, выдан ${profile.docIssuedBy}<#if profile.personalNumber??>, идентификационный номер ${profile.personalNumber}</#if>, дата рождения - ${profile.birthDay?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</p>
                <p>ФИО на латинице: ${profile.lastNameLat} ${profile.firstNameLat}</p>
                <p>ФИО на белорусском языке: ${profile.lastNameBlr} ${profile.firstNameBlr} <#if profile.middleNameBlr?has_content>${profile.middleNameBlr}</#if></p>
                <#if profile.citizenship?has_content><span>Гражданство: ${profile.citizenship?string}</span></#if>
                <#if profile.nationality?has_content><span>Национальность: ${profile.nationality?string}</span></#if>
                <p>Семейный статус: <#if profile.sex == 1>${profile.maritalStatus.statusForMan}<#else>${profile.maritalStatus.statusForWoman}</#if></p>
            </td>
        </tr>
        <tr>
            <td colspan="12" class="section-center"><strong>Результаты централизованного тестирования</strong></td>
        </tr>
        <tr class="ct-result">
            <td colspan="3" class="section-center">
                <#if profile.foreignLanguage??>
                    <p class="attention-text">${profile.foreignLanguage.fullName}</p>
                    <p class="result-ball"><#if profile.foreignLanguagePoint?has_content>${profile.foreignLanguagePoint}</#if></p>
                </#if>
            </td>
            <td colspan="3" class="section-center">
                <#if profile.stateLanguage??>
                    <p class="attention-text">${profile.stateLanguage.fullName}</p>
                    <p class="result-ball"><#if profile.stateLanguagePoint?has_content>${profile.stateLanguagePoint}</#if></p>
                </#if>
            </td>
            <td colspan="3" class="section-center">
                <p class="attention-text"><#if profile.historyPoint?has_content>История</#if></p>
                <p class="result-ball"><#if profile.historyPoint?has_content>${profile.historyPoint}</#if></p>
            </td>
            <td colspan="3" class="section-center">
                <p class="attention-text">${profile.typeEducation.typeDocumentGraduate?string}</p>
                <p class="result-ball"><#if profile.docEduPoint?has_content>${profile.docEduPoint}</#if></p>
            </td>
        </tr>
        <tr>
            <td colspan="12" class="section-center"><strong>Данные об образовании абитуриента</strong></td>
        </tr>
        <tr>
            <td colspan="12">
                <p>Наименование учреждения образования: ${profile.fullNameSchool}</p>
                <p>Выпускник педагогического класса: <#if profile.teacherClassGraduate>Да<#else>Нет</#if></p>
                <p>Уровень образования и год получения<#if profile.typeEducation.hasSpecialty>, специальность</#if>: ${profile.typeEducation.name}, ${profile.yearEducation.name?string}<#if profile.typeEducation.hasSpecialty>, ${profile.nameSpecialty}</#if></p>
                <#if profile.workExperienceYears?has_content || profile.workExperienceMonths?has_content><p>Трудовой стаж: <#if profile.workExperienceYears?has_content>${profile.workExperienceYears} год(а)</#if> <#if profile.workExperienceMonths?has_content>${profile.workExperienceMonths} месяц(ев)</#if></p></#if>
                <#if profile.target><p>Целевое направление выдано: <#if profile.targetIssuedBy?has_content>${profile.targetIssuedBy?string}</#if></p></#if>
                <#if profile.awardList?has_content><p>Отличия и награды: <#list profile.awardList as award>${award.fullName}<#sep>, </#list></p></#if>
                <#if profile.advantageList?has_content><p>Льготы: <#list profile.advantageList as advantage>${advantage.fullName}<#sep>, </#list></p></#if>
            </td>
        </tr>
        <tr>
            <td colspan="12" class="section-center"><strong>Сведения о родителях</strong></td>
        </tr>
        <tr>
            <td colspan="12">
                <#if profile.parentList?has_content>
                    <#list profile.parentList as parent>
                        <p><i><#if parent.father>Отец<#else>Мать</#if></i> ${parent.lastName} ${parent.firstName} <#if parent.middleName?has_content>${parent.middleName}</#if></p>
                        <p>Проживает по адресу: <#if parent.address?has_content>${parent.address}</#if><#if parent.phone?has_content>, тел.${parent.phone}</#if></p>
                        <p>Место работы, занимаемая должность: <#if parent.workPlace?has_content>${parent.workPlace}</#if><#if parent.position?has_content>, ${parent.position}</#if></p>
                    </#list>
                </#if>
            </td>
        </tr>
        <tr>
            <td colspan="12" class="section-center"><strong>Сведения о спортивной и общественной деятельности</strong></td>
        </tr>
        <tr>
            <td colspan="12">
                <#if profile.publicOrganizationList?has_content || profile.otherPublicOrganization?has_content>
                    <p>Членство в молодежных общественных организациях: <#if profile.publicOrganizationList?has_content><#list profile.publicOrganizationList as porg>${porg.fullName}<#sep>, </#list></#if><#if profile.publicOrganizationList?has_content>, <#if profile.otherPublicOrganization?has_content>${profile.otherPublicOrganization}</#if><#else><#if profile.otherPublicOrganization?has_content>${profile.otherPublicOrganization}</#if></#if></p>
                </#if>
                <#if profile.creativityList?has_content || profile.otherCreativity?has_content>
                    <p>Виды творчества, хобби: <#if profile.creativityList?has_content><#list profile.creativityList as creativity>${creativity.fullName}<#sep>, </#list></#if><#if profile.creativityList?has_content>, <#if profile.otherCreativity?has_content>${profile.otherCreativity}</#if><#else><#if profile.otherCreativity?has_content>${profile.otherCreativity}</#if></#if></p>
                </#if>
                <#if profile.achievementList?has_content><p>Достижения в общественной и творческой деятельности: ${profile.achievementList}</p></#if>
                <#if profile.sportList?has_content><p>Виды спорта: ${profile.sportList} <#if profile.memberNationalTeam>, член сборной команды РБ</#if><#if profile.sportTitle?has_content>, ${profile.sportTitle.fullName}</#if></p></#if>
            </td>
        </tr>

    </table>
</div>
</body>
</html>