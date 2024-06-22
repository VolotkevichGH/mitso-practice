<#-- @ftlvariable name="profile" type="com.mslu.applicant.entity.Profile" -->
<#-- @ftlvariable name="parent" type="com.mslu.applicant.entity.references.Parent" -->
<#-- @ftlvariable name="district" type="com.mslu.applicant.entity.references.District" -->
<#list profile.parentList as parent>
    <#if parent.legalRepresentative>
        <#assign legalRepresentative = parent>
    </#if>
</#list>

<html xmlns="http://www.w3.org/1999/html">
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
            font-family: Times-Roman,Verdana,sans-serif;
        }

        .wrapper{
            font-size: 10pt;
            line-height: 1;
        }

        .head-table td{
            vertical-align: top;
        }
        .content {
            font-size: 10pt;
        }
        .upper {
            text-transform: uppercase;
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
            text-align: right;
        }
        .left-part-footer{
            width: 50%;
            padding-right: 1cm;
            vertical-align: top;
        }
        .left-part-footer div {
            width: 100%;
        }
        .right-part-footer{
            vertical-align: top;
            width: 50%;
        }
        .right-part-footer div {
            width: 100%;
        }
        .section-text {
            margin-bottom: 0.3cm;
            font-family: "Times New Roman";
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
        .note {
            font-size: 10pt;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="content">
        <p class="section-center upper">ДОГОВОР № ________________</p>
        <p class="section-center upper">О ПОДГОТОВКЕ СПЕЦИАЛИСТА С ВЫСШИМ ОБРАЗОВАНИЕМ</p>
        <p class="section-center upper">НА ПЛАТНОЙ ОСНОВЕ</p>
        <table border="0" class="head-table">
            <tr>
                <td class="left-part-head">
                    <div>
                        <p>&ldquo;______&ldquo; _______________ 2020 г.</p>
                    </div>
                </td>
                <td class="right-part-head">
                    <div>
                        <p>г.Минск</p>
                    </div>
                </td>
            </tr>
        </table>
        <p class="section-justify section-indent">Учреждение образования «Минский государственный лингвистический университет» в лице ректора Барановой Натальи Петровны, действующей на основании Устава, утвержденного приказом Министерства образования Республики Беларусь от 17.09.2012 № 693, зарегистрированного Мингорисполкомом 26.09.2012 № 100028902, именуемое в дальнейшем Учреждение образования, с одной стороны, и <#if profile.sex == 1>гражданин<#else>гражданка</#if> <b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b> <#if profile.sex == 1>именуемый<#else>именуемая</#if> в дальнейшем Обучающийся, с другой стороны, заключили настоящий договор о нижеследующем:</p>
        <p class="section-justify section-indent">1.Предмет договора – подготовка специалиста с высшим образованием по специальности (направлению специальности, специализации) <b><#if profile.specialty.id??>${profile.specialty.specialtyCode} "${profile.specialty.specialtyName}<#if profile.specialty.officialName?has_content>. ${profile.specialty.officialName}</#if>"</#if></b> с присвоением квалификации <strong>${profile.specialty.qualification}</strong> на факультете <strong>${profile.specialty.faculty.shortName}</strong> в <strong>${profile.specialty.typeEducationForm.fullNameGenitive}</strong> форме получения образования на платной основе за счет средств Обучающегося.</p>
        <p class="section-justify section-indent">Обучающийся зачисляется в Учреждение образования для освоения содержания образовательной программы высшего образования <strong>${profile.specialty.programGenitive}</strong>.</p>
        <p class="section-justify">протокол приемной комиссии от « ___ » _________ 2020 г. № ________________</p>
        <p class="section-justify section-indent">2.Срок получения образования составляет <strong>${profile.specialty.lengthOfStudy}</strong>. (срок по учебному плану)</p>
        <p class="section-justify section-indent">3.Стоимость обучения определяется ежегодно, исходя из затрат на обучение, утверждается приказом ректора Учреждения образования, и на момент заключения настоящего договора за 2020/2021 учебный год составляет <strong>${profile.specialty.tuitionFees}</strong>.</p>
        <p class="section-justify section-indent">Стоимость обучения за <strong>последующие годы</strong> обучения определяется в соответствии с частью 1 данного пункта и пунктом 4 настоящего договора, утверждается приказами ректора Учреждения образования, которые являются неотъемлемой частью договора и основанием для оплаты.</p>
        <p class="section-justify section-indent">4.Порядок изменения стоимости обучения.</p>
        <p class="section-justify section-indent">4.1.Стоимость обучения, предусмотренная настоящим договором, может изменяться в одностороннем порядке Учреждением образования в связи с изменением законодательства об оплате труда, налогового законодательства, базовой ставки для работников бюджетных организаций, условий оплаты труда этих работников, роста тарифов на коммунальные услуги и другие расходы, необходимые для качественного обеспечения образовательного процесса, в соответствии с актами законодательства Республики Беларусь, а также с учетом и в случае изменения конъюнктуры рынка.</p>
        <p class="section-justify section-indent">4.2.Изменение стоимости обучения утверждается приказом ректора Учреждения образования, который в течение 7 календарных дней доводится общедоступными средствами коммуникации до сведения Обучающегося. В случае изменения стоимости обучения Обучающийся производит доплату разницы в стоимости не позднее 30 календарных дней со дня издания соответствующего приказа ректора Учреждения образования.</p>
        <p class="section-justify section-indent">5.Порядок расчетов за обучение:</p>
        <p class="section-justify section-indent">5.1.Оплата за обучение на основании настоящего договора осуществляется Обучающимся в кассе Учреждения образования либо в отделениях банков на расчетный счет BY02 AKBB 3632 9000 0547 4530 0000 в ОАО «АСБ «Беларусбанк» г.Минска, БИК AKBBBY2Х, УНП 100028902, ОКПО 02071866;</p>
        <p class="section-justify section-indent">5.2.Оплата за первый год обучения производится после издания приказа о зачислении Обучающегося в Учреждение образования в два этапа в сроки:</p>
        <p class="section-justify section-indent">за первый семестр - <strong>до 25 августа 2020г.</strong> в размере 50% от стоимости обучения за год;</p>
        <p class="section-justify section-indent">за второй семестр - до 01 февраля текущего учебного года в размере 50% от стоимости за обучение за год.</p>
        <p class="section-justify section-indent">5.3.За последующие годы обучения оплата производится по семестрам в порядке, определенном подпунктом 5.1 настоящего пункта в два этапа в следующие сроки:</p>
        <p class="section-justify section-indent">за первый семестр - до 01 сентября каждого учебного года  в размере 50% от стоимости обучения за год;</p>
        <p class="section-justify section-indent">за второй семестр - до 01 февраля каждого учебного года в размере 50% от стоимости за обучение за год.</p>
        <p class="section-justify section-indent">Оплата производится на основании представляемых Учреждением образования платежных документов (счет-фактур), которые являются протоколами согласования цены.</p>
        <p class="section-justify section-indent">5.4.В случае досрочного прекращения образовательных отношений по уважительной причине денежные средства, внесенные в счет оплаты за обучение, могут быть возвращены на основании заявления Обучающегося в адрес ректора Учреждения образования с учетом фактического срока обучения.</p>
        <p class="section-justify section-indent">Снижение оплаты в случае непосещения занятий не производится.</p>
        <p class="section-justify section-indent">5.5.В случае предоставления академического отпуска оплата производится за фактическое время обучения и далее – с момента возобновления занятий.</p>
        <p class="section-justify section-indent">6.Ликвидация академической задолженности, повторное прохождение текущей и итоговой аттестации Обучающимся осуществляются за дополнительную оплату в соответствии с законодательством Республики Беларусь.</p>
        <p class="section-justify section-indent">Ликвидация академической задолженности, повторное прохождение текущей аттестации осуществляется в порядке, установленном Учреждением образования, при этом наличие платежных документов об оплате является основанием считать письменную форму договора по оказанию дополнительных услуг соблюденной.</p>
        <p class="section-justify section-indent">7.Права и обязанности сторон.</p>
        <p class="section-justify section-indent">7.1.Учреждение образования имеет право определять самостоятельно формы, методы и способы осуществления образовательного процесса;</p>
        <p class="section-justify section-indent">7.2.Учреждение образования имеет право на досрочное прекращение образовательных отношений по основаниям, предусмотренным пунктом 5 статьи 79 Кодекса Республики Беларусь об образовании;</p>
        <p class="section-justify section-indent">7.3.Учреждение образования имеет право приостановить выполнение своих обязательств в соответствии с настоящим договором и отстранить Обучающегося от занятий при просрочке внесения оплаты за обучение свыше 30 календарных дней;</p>
        <p class="section-justify section-indent">7.4.Учреждение образования обязуется:</p>
        <p class="section-justify section-indent">7.4.1.Зачислить Обучающегося для получения образования приказом ректора Учреждения образования и обеспечить его подготовку по специальности (направлению специальности, специализации), указанной(ым) в пункте 1 настоящего договора на <strong>русском</strong> языке;</p>
        <p class="section-justify section-indent">7.4.2.Организовать материально-техническое обеспечение образовательного процесса в соответствии с установленными санитарными нормами, правилами и гигиеническими нормативами;</p>
        <p class="section-justify section-indent">7.4.3.Обеспечить при наличии мест иногороднего Обучающегося местом проживания в общежитии. При этом плата за пользование жилым помещением в общежитии и коммунальные услуги не входят в стоимость обучения и осуществляются отдельно на основании договора найма жилого помещения в общежитии (иного документа, определенного сторонами);</p>
        <p class="section-justify section-indent">7.4.4. Выдать Обучающемуся, освоившему содержание образовательной программы высшего образования, соответствующий документ об образовании;</p>
        <p class="section-justify section-indent">7.5.Обучающийся имеет право:</p>
        <p class="section-justify section-indent">7.5.1.На получение высшего образования по специальности (направлению специальности, специализации) в соответствии с пунктом 1 настоящего договора и требованиям образовательного стандарта;</p>
        <p class="section-justify section-indent">7.5.2.На бесплатное пользование библиотекой, читальными залами, учебниками и учебными пособиями, учебной, научной и культурно-спортивной базой Учреждения образования.</p>
        <p class="section-justify section-indent">7.6.Обязанности Обучающегося:</p>
        <p class="section-justify section-indent">7.6.1.Добросовестно относиться к освоению содержания образовательных программ, программ воспитания;</p>
        <p class="section-justify section-indent">7.6.2.Выполнять требования учредительных документов, правил внутреннего распорядка для обучающихся, иных локальных нормативных правовых актов Учреждения образования;</p>
        <p class="section-justify section-indent">7.6.3.Соблюдать учебную дисциплину, нормы и правила охраны труда, пожарной безопасности, производственной санитарии в помещениях учреждения образования;</p>
        <p class="section-justify section-indent">7.6.4.Бережно относиться к имуществу Учреждения образования;</p>
        <p class="section-justify section-indent">7.6.5.Осуществлять оплату стоимости обучения в сроки, установленные настоящим договором.</p>
        <p class="section-justify section-indent">8.Ответственность сторон:</p>
        <p class="section-justify section-indent">8.1.За неисполнение или ненадлежащее исполнение своих обязательств по настоящему договору стороны несут ответственность в соответствии с законодательством Республики Беларусь;</p>
        <p class="section-justify section-indent">8.2.При нарушении сроков оплаты, предусмотренных пунктами 4.2., 5.3 настоящего договора, Обучающийся выплачивает пеню в размере 0,1% от суммы просроченных платежей за каждый день просрочки. Пеня начисляется со следующего дня после истечения срока оплаты;</p>
        <p class="section-justify section-indent">8.3.Обучающийся несет ответственность перед Учреждением образования за причинение вреда имуществу Учреждения образования в соответствии с законодательством Республики Беларусь.</p>
        <p class="section-justify section-indent">9.Заключительные положения:</p>
        <p class="section-justify section-indent">9.1.Настоящий договор составлен в 2-х экземплярах, имеющих одинаковую юридическую силу, по одному для каждой из сторон;</p>
        <p class="section-justify section-indent">9.2.Договор вступает в силу со дня его подписания и действует до исполнения сторонами своих обязательств;</p>
        <p class="section-justify section-indent">9.3.Договор изменяется и расторгается в соответствии с законодательством Республики Беларусь. Договор считается расторгнутым с даты издания приказа об отчислении Обучающегося или с даты, установленной приказом об отчислении Обучающегося из Учреждения образования.</p>
        <p class="section-justify section-indent">9.4.Вносимые изменения (дополнения) оформляются дополнительными соглашениями.</p>
        <p class="section-justify section-indent">9.5.Все споры и разногласия по настоящему договору стороны решают путем переговоров, а при недостижении согласия – в порядке, установленном законодательством Республики Беларусь.</p>
        <p class="section-justify section-indent">9.6.Обучающийся <b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b> <i>(подпись)</i> _______________ <i>(дата)</i> _______________ ознакомлен со свидетельством о государственной регистрации, Уставом, специальным разрешением (лицензией) на осуществление образовательной деятельности, сертификатом о государственной аккредитации, а по их требованию – и с учебно-программной документацией.</p>
        <p class="section-justify section-indent">10.Адреса, реквизиты и подписи сторон:</p>
        <table border="0" class="section footer-table">
            <tr>
                <td class="left-part-footer">
                    <div>
                        <p>УЧРЕЖДЕНИЕ ОБРАЗОВАНИЯ</p>
                        <p class="section">Учреждение образования «Минский государственный лингвистический университет». 220034, г.Минск, ул.Захарова, 21. BY02 AKBB 3632 9000 0547 4530 0000 ОАО «АСБ «Беларусбанк» г.Минск, БИК AKBBBY2Х.</p>
                        <p>УНП 100028902. ОКПО 02071866</p>
                        <p class="section">Ректор МГЛУ</p>
                        <p class="section">___________________ Н.П.Баранова</p>
                    </div>
                </td>
                <td class="right-part-footer">
                    <div>
                        <p>ОБУЧАЮЩИЙСЯ</p>
                        <p class="section"><b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b></p>
                        <p class="section-justify">Адрес
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
                            моб.тел. ${profile.phone?string}
                        </p>
                        <p class="section-justify">Документ, удостоверяющий личность <strong>${profile.user.docType.type}</strong>, <strong>${profile.user.docSeries?string}</strong><strong>${profile.user.docNumber?string}</strong>, дата выдачи <strong>${profile.docOnDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</strong>, выдан <strong>${profile.docIssuedBy}</strong><#if profile.personalNumber??>, идентификационный номер <strong>${profile.personalNumber}</strong></#if></p>
                        <p class="section">________________________</p>
                        <p class="section-justify section-indent note">(подпись)</p>

                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>