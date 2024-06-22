<#-- @ftlvariable name="profile" type="com.mslu.applicant.entity.Profile" -->
<#-- @ftlvariable name="parent" type="com.mslu.applicant.entity.references.Parent" -->
<#-- @ftlvariable name="district" type="com.mslu.applicant.entity.references.District" -->
<#setting number_format="####">
<html>
<head>
<meta charset="UTF-8">
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
            font-family: Times-Roman,Verdana,sans-serif;
        }

        .wrapper{
            padding-left: 1.5cm;
            font-size: 10pt;
            line-height: 1.5;
        }

        .head-table td{
            vertical-align: top;
        }
        .content {
            font-size: 12pt;
        }
        .left-part-head div{
            width: 9.5cm;
            overflow: hidden;
            line-height: 1.5;
        }
        .right-part-head div{
            width: 7.5cm;
            line-height: 1.8;
            overflow: hidden;
        }
        .left-part-footer{
            width: 12cm;
        }
        .left-part-footer div {
            width: 6cm; text-align: center;
        }
        .right-part-footer{
            width: 5cm;
        }
        .right-part-footer div {
            width: 5cm; text-align: center;
        }
        .section-text {
            margin-bottom: 0.3cm;
            font-family: "Times New Roman";
        }
        .section {
            margin-top: 0.3cm;
        }
        .section-justify {
            text-align: justify;
        }
        .section-indent {
            text-indent: 45px;
        }
        .section-center {
            text-align: center;
        }
        .note {
            font-size: 8pt;
        }
        .light-text {
            font-weight: 14pt;
            font-weight: bold;
            font-style: italic;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <table border="0" class="head-table">
            <tr>
                <td class="left-part-head">
                    <div>
                        <#if profile.specialty.typeEducationPeriod.id == 2>
                            <div class="section-text">
                                <p>Допустить к вступительным</p>
                                <p>испытаниям и участию в конкурсе</p>
                            </div>
                        <#else>
                            <div class="section-text">
                                <p>Допустить к участию в конкурсе</p>
                            </div>
                        </#if>
                        <div class="section-text">
                            <p>Ректор ___________________</p>
                            <p>&ldquo;______&ldquo; _______________ 2020 г.</p>
                        </div>
                    </div>
                </td>
                <td class="right-part-head">
                    <div>
                        <p>Зачислить на <b><#if profile??><#if profile.specialty.id??>${profile.specialty.course?string}</#if></#if></b> курс</p>
                        <p>на факультет <b><#if profile??><#if profile.specialty.id??>${profile.specialty.faculty.shortName}</#if></#if></b></p>
                        <p>специальность <b><#if profile??><#if profile.specialty.id??>${profile.specialty.specialtyCode} "${profile.specialty.specialtyName}"</#if></#if></b></p>
                        <p>Приказ &ldquo;_____&rdquo; ______________ 2020 г. №___________</p>
                        <p>Ректор ____________________&nbsp;</p>
                    </div>
                </td>
            </tr>
        </table>
        <div class="content">
            <p class="section section-justify section-indent main-section">Ректору учреждения образования «Минский государственный лингвистический университет»
                от <#if profile??><span class="light-text">${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus?has_content>${profile.middleNameRus}</#if></span></#if>,
                <#if profile.sex == 1>который<#else>которая</#if> проживает по адресу
                <span class="light-text">
                <#if !profile.foreignCheck>
                    ${profile.registrationZipCode},
                    <#if profile.registrationLocality.area.id != 5>${profile.registrationLocality.area.name}, </#if>
                    <#if profile.registrationLocality.district != 0 && district?has_content>${district.name}, </#if>
                    ${profile.registrationLocality.typeLocality.shortName}${profile.registrationLocality.name},
                <#else>
                    <#if profile.registrationZipCodeForeign?has_content>${profile.registrationZipCodeForeign}, </#if>
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
                    моб.тел. ${profile.phone?string}</span> и <#if profile.sex == 1>закончил<#else>закончила</#if> в <span class="light-text">${profile.yearEducation.name?string}</span> году <span class="light-text">${profile.fullNameSchool}, ${profile.typeEducation.name} образование.</span> До поступления в учреждение высшего образования <#if profile.sex == 1>изучал<#else>изучала</#if> <#if profile.foreignLanguage??><span class="light-text">${profile.foreignLanguage.fullName?lower_case}</span>.<#else>иностранный язык <i>(указать)</i> _____________________________________________.</#if></p>
            <div class="section section-center">
                <strong>
                    <h3>ЗАЯВЛЕНИЕ</h3>
                </strong>
            </div>
            <p class="section-justify section-indent main-section">
                Прошу допустить меня к <#if profile.specialty.typeEducationPeriod.id == 2>вступительным испытаниям и</#if> участию в конкурсе, для получения <#if profile.typeEducation.name != "высшее">первого<#else>второго</#if> образования I ступени в <span class="light-text"><#if profile.specialty.typeEducationForm.id == 1>дневной<#else>заочной</#if></span> форме получения образования <#if profile.target><span class="light-text">на условиях целевой подготовки</span><#else><#if profile.specialty.typeEducationContract.id == 1><span class="light-text">за счет средств республиканского бюджета</span><#else><span class="light-text">на платной основе</span></#if></#if> для получения образования в <#if profile.specialty.typeEducationPeriod.id == 1><span class="light-text">полный срок</span><#else><span class="light-text">сокращенный срок</span></#if></u> на факультете <span class="light-text">${profile.specialty.faculty.shortName}</span> по специальности <span class="light-text">${profile.specialty.specialtyCode} ${profile.specialty.specialtyName}<#if profile.specialty.officialName?has_content>: ${profile.specialty.officialName}</#if></span>.
            </p>
            <#if profile.specialty.typeEducationPeriod.id == 2><p class="section-justify section-indent main-section">Вступительные испытания буду сдавать на белорусском языке / русском языке.</p></#if>
            <p class="section section-justify"><strong>О себе сообщаю следующие сведения:</strong></p>
            <p class="section-justify">число, месяц, год рождения - <span class="light-text">${profile.birthDay?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</span></p>
            <#if profile.workPlace?has_content && profile.position?has_content><p class="section-justify">место работы, занимаемая должность - <span class="light-text">${profile.workPlace}, ${profile.position}</span></p></#if>
            <#if profile.workExperienceYears?? || profile.workExperienceMonths??><p class="section-justify">трудовой стаж по профилю избранной специальности - <#if profile.workExperienceYears??><span class="light-text">${profile.workExperienceYears}</span> лет </#if><#if profile.workExperienceMonths??><span class="light-text">${profile.workExperienceMonths}</span> месяцев</#if></p></#if>
            <p class="section-justify">нуждаюсь в общежитии - <span class="light-text"><#if profile.needHostel>Да<#else>Нет</#if></span></p>
            <p class="section-justify">имею право на льготы - <span class="light-text"><#if profile.advantageList?has_content || profile.awardList?has_content>Да<#else>Нет</#if></span></p>
            <p class="section-justify">данные документа, удостоверяющего личность - <span class="light-text">${profile.user.docType.type}, ${profile.user.docSeries} ${profile.user.docNumber}, дата выдачи ${profile.docOnDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}, выдан ${profile.docIssuedBy}<#if profile.personalNumber??>, идентификационный номер ${profile.personalNumber}</#if></span></p>

            <#if profile.parentList??>
                <p class="section section-justify"><strong>Родители:</strong></p>
                <#list profile.parentList as parent>
                    <p class="section-justify"><i><#if parent.father>Отец<#else>Мать</#if></i> <span class="light-text">${parent.lastName} ${parent.firstName} <#if parent.middleName??>${parent.middleName}</#if></span></p>
                    <p class="section-justify">проживает по адресу: <span class="light-text"><#if parent.address??>${parent.address}</#if></span></p>
                </#list>
            </#if>

            <p class="section section-justify">Вид конкурса _________________________________________________________________</p>
            <p class="section-center note">(проставляется ответственным секретарем приемной комиссии (заместителем ответственного секретаря приемной комиссии) в соответствии с порядком приема в УВО)</p>

            <p class="section section-justify">С порядком приема <#if profile.specialty.typeEducationPeriod.id == 2>и порядком подачи апелляции</#if> в учреждение образования <#if profile.sex == 1>ознакомлен<#else>ознакомлена</#if>.</p>
            <table border="0" class="head-table">
                <tr>
                    <td class="left-part-footer">
                        <div>
                            <p>&ldquo;______&ldquo; ____________ 2020г.</p>
                            <p class="section-center note">(дата заполнения заявления)</p>
                        </div>
                    </td>
                    <td class="right-part-footer">
                        <div>
                            <p>________________________</p>
                            <p class="section-center note">(подпись)</p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </div>
</body>
</html>