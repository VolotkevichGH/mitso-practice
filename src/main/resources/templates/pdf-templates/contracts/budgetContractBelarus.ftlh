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
        <p class="section-center upper">ЗА СЧЕТ СРЕДСТВ РЕСПУБЛИКАНСКОГО БЮДЖЕТА</p>
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
        <p class="section-justify section-indent">Учреждение образования «Минский государственный лингвистический университет» в лице ректора Барановой Натальи Петровны, действующей на основании Устава, утвержденного приказом Министерства образования Республики Беларусь от 17.09.2012 № 693, зарегистрированного Мингорисполкомом 26.09.2012 № 100028902, именуемое в дальнейшем Учреждение образования, с одной стороны, и <#if profile.sex == 1>гражданин<#else>гражданка</#if> <b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b> <#if profile.sex == 1>именуемый<#else>именуемая</#if> в дальнейшем Обучающийся или Иностранный обучающийся (для иностранных граждан и лиц без гражданства, временно пребывающих или временно проживающих в Республике Беларусь) (далее, если не указано иное, - Обучающийся), с другой стороны, заключили настоящий договор о нижеследующем:</p>
        <p class="section-justify section-indent">1.Предмет договора – подготовка специалиста с высшим образованием по специальности (направлению специальности, специализации) <b><#if profile.specialty.id??>${profile.specialty.specialtyCode} "${profile.specialty.specialtyName}<#if profile.specialty.officialName?has_content>. ${profile.specialty.officialName}</#if>"</#if></b></p>
        <p class="section-justify">с присвоением квалификации <strong>${profile.specialty.qualification}</strong></p>
        <p class="section-justify">степени магистра___________________________________________________________</p>
        <p class="section-justify">на факультете <strong>${profile.specialty.faculty.shortName}</strong></p>
        <p class="section-justify">в <strong>${profile.specialty.typeEducationForm.fullNameGenitive}</strong> форме получения образования за счет средств республиканского бюджета.</p>
        <p class="section-justify section-indent">Обучающийся зачисляется в Учреждение образования для освоения содержания образовательной программы высшего образования <strong>${profile.specialty.programGenitive}</strong>.</p>
        <p class="section-justify">протокол приемной комиссии от « ___ » _________ 2020 г. № ________________</p>
        <p class="section-justify section-indent">2.Срок получения образования составляет <strong>${profile.specialty.lengthOfStudy}</strong>. (срок по учебному плану)</p>
        <p class="section-justify section-indent">3.Стоимость обучения определятся Учреждением образования в ценах текущего года и на момент заключения настоящего договора составляет <strong>${profile.specialty.tuitionFees}</strong>.</p>
        <p class="section-justify section-indent">4.Порядок изменения стоимости обучения.</p>
        <p class="section-justify section-indent">Стоимость обучения, указанная в пункте 3 настоящего договора, является предварительной и подлежит пересмотру на основании фактических расходов в случае, если у выпускника возникает обязанность возместить в республиканский   бюджет средства, затраченные государством на его подготовку.</p>
        <p class="section-justify section-indent">Ликвидация академической задолженности, повторное прохождение текущей и итоговой аттестации Обучающимся осуществляются за дополнительную оплату в соответствии с законодательством Республики Беларусь.</p>
        <p class="section-justify section-indent">5.Права и обязанности сторон.</p>
        <p class="section-justify section-indent">5.1.Учреждение образования имеет право определять самостоятельно формы, методы и способы осуществления образовательного процесса;</p>
        <p class="section-justify section-indent">5.2.Учреждение образования обязуется:</p>
        <p class="section-justify section-indent">5.2.1.Зачислить Обучающегося для получения образования приказом ректора Учреждения образования и обеспечить его подготовку по специальности (направлению специальности, специализации), указанной(ным) в пункте 1 настоящего договора на <strong>русском</strong> языке;</p>
        <p class="section-justify section-indent">5.2.2.Организовать материально-техническое обеспечение образовательного процесса в соответствии с установленными санитарными нормами, правилами и гигиеническими нормативами;</p>
        <p class="section-justify section-indent">5.2.3.Обеспечить при наличии мест иногороднего Обучающегося местом проживания в общежитии. При этом плата за пользование жилым помещением в общежитии и коммунальные услуги не входят в стоимость обучения и осуществляются отдельно на основании договора найма жилого помещения в общежитии (иного документа, определенного сторонами);</p>
        <p class="section-justify section-indent">5.2.4.Выдать Обучающемуся, освоившему содержание образовательной программы высшего образования, соответствующий документ об образовании;</p>
        <p class="section-justify section-indent">5.2.5.Распределить, перераспределить Обучающегося в соответствии с законодательством Республики Беларусь;</p>
        <p class="section-justify section-indent">5.3.Обучающийся имеет право на получение высшего образования по специальности (направлению специальности, специализации) в соответствии с пунктом 1 настоящего договора и требованиям образовательного стандарта;</p>
        <p class="section-justify section-indent">5.4.Обучающийся обязуется:</p>
        <p class="section-justify section-indent">5.4.1.Добросовестно и ответственно относиться к освоению содержания образовательных программ, программ воспитания;</p>
        <p class="section-justify section-indent">5.4.2.Выполнять требования учредительных документов, правил внутреннего распорядка для обучающихся, иных локальных нормативных правовых актов Учреждения образования;</p>
        <p class="section-justify section-indent">5.4.3.Бережно относиться к имуществу Учреждения образования;</p>
        <p class="section-justify section-indent">5.4.4.По окончании Учреждения образования отработать срок обязательной работы по распределению, установленный законодательством Республики Беларусь;</p>
        <p class="section-justify section-indent">5.4.5.В случае неотработки срока обязательной работы по распределению возместить средства в республиканский бюджет, затраченные государством на его подготовку, в соответствии с законодательством Республики Беларусь.</p>
        <p class="section-justify section-indent">6.Ответственность сторон:</p>
        <p class="section-justify section-indent">6.1.За неисполнение или ненадлежащее исполнение своих обязательств по настоящему договору стороны несут ответственность в соответствии с законодательством Республики Беларусь;</p>
        <p class="section-justify section-indent">6.2.Обучающийся несет ответственность перед Учреждением образования за причинение вреда имуществу Учреждения образования в соответствии с законодательством Республики Беларусь.</p>
        <p class="section-justify section-indent">7.Дополнительные условия договора (по договоренности сторон):</p>
        <p class="section-justify section-indent">______________________________________________________________________.</p>
        <p class="section-justify section-indent">8.Заключительные положения:</p>
        <p class="section-justify section-indent">8.1.Настоящий договор составлен в двух экземплярах, имеющих одинаковую юридическую силу, по одному для каждой из сторон;</p>
        <p class="section-justify section-indent">8.2.Договор вступает в силу со дня его подписания и действует до исполнения сторонами своих обязательств;</p>
        <p class="section-justify section-indent">8.3.Договор изменяется и расторгается в соответствии с законодательством Республики Беларусь. Договор считается расторгнутым с даты издания приказа об отчислении Обучающегося или с даты, установленной приказом об отчислении Обучающегося из Учреждения образования.</p>
        <p class="section-justify section-indent">8.4.Вносимые изменения (дополнения) оформляются дополнительными соглашениями;</p>
        <p class="section-justify section-indent">8.5.Все споры и разногласия по настоящему договору стороны решают путем переговоров, а при недостижении согласия – в порядке, установленном законодательством Республики Беларусь;</p>
        <p class="section-justify section-indent">8.6. Иностранному обучающемуся ________________________________________</p>
        <p class="section-right note">(фамилия, собственное имя, отчество (если таковое имеется))</p>
        <p class="section-justify">__________________________________________________________________________</p>
        <p class="section-justify">разъяснено содержание положений настоящего договора, и он (она) не имеет невыясненных вопросов по их смыслу в связи с тем, что данный документ составлен на русском языке.</p>
        <p class="section-justify section-indent">8.7.Обучающийся <b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b> <i>(подпись)</i> _______________ <i>(дата)</i> _______________<#if !isAdult>, законный представитель несовершеннолетнего <strong>${legalRepresentative.lastName} ${legalRepresentative.firstName} <#if legalRepresentative.middleName??>${legalRepresentative.middleName}</#if></strong> <i>(подпись)</i> _______________ <i>(дата)</i> _______________</#if> ознакомлен со свидетельством о государственной регистрации, Уставом, специальным разрешением (лицензией) на осуществление образовательной деятельности, сертификатом о государственной аккредитации, а по их требованию – и с учебно-программной документацией.</p>
        <p class="section-justify section-indent">9.Адреса, реквизиты и подписи сторон:</p>
        <table border="0" class="section footer-table">
            <tr>
                <td class="left-part-footer">
                    <div>
                        <p>УЧРЕЖДЕНИЕ ОБРАЗОВАНИЯ</p>
                        <p class="section">Учреждение образования «Минский государственный лингвистический университет». 220034, г.Минск, ул.Захарова, 21. Расчетный счет BY98 AKBB 3604 9000 0537 2530 0000 ОАО «АСБ «Беларусбанк» г.Минск, БИК AKBBBY2Х.</p>
                        <p>УНП 100028902. ОКПО 02071866</p>
                        <p class="section">Ректор МГЛУ</p>
                        <p class="section">___________________ Н.П.Баранова</p>
                    </div>
                </td>
                <td class="right-part-footer">
                    <div>
                        <p>ОБУЧАЮЩИЙСЯ</p>
                        <p class="section"><b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b></p>
                        <p class="section">Документ, удостоверяющий личность <strong>${profile.user.docType.type}</strong>, <strong>${profile.user.docSeries?string}</strong><strong>${profile.user.docNumber?string}</strong>, дата выдачи <strong>${profile.docOnDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</strong>, выдан <strong>${profile.docIssuedBy}</strong><#if profile.personalNumber??>, идентификационный номер <strong>${profile.personalNumber}</strong></#if></p>
                        <p class="section">________________________</p>
                        <p class="section-justify section-indent note">(подпись)</p>

                    </div>
                </td>
            </tr>
        </table>

        <#if !isAdult>
        <p class="section section-justify section-indent">С заключением настоящего договора <#if profile.sex == 1>несовершеннолетним<#else>несовершеннолетней</#if> <b>${profile.lastNameRus} ${profile.firstNameRus} <#if profile.middleNameRus??>${profile.middleNameRus}</#if></b> <#if legalRepresentative.father>согласен<#else>согласна</#if> <strong>${legalRepresentative.lastName} ${legalRepresentative.firstName} <#if legalRepresentative.middleName??>${legalRepresentative.middleName}</#if></strong>, адрес: <strong>${legalRepresentative.address}</strong> данные документа, удостоверяющего личность: <strong>${profile.docTypeLegal.type}</strong> <strong>${profile.docSeriesLegal}${profile.docNumberLegal}</strong>, дата выдачи <strong>${profile.docOnDateLegal?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</strong>, выдан <strong>${profile.docIssuedByLegal}</strong><#if profile.personalNumberLegal??>, идентификационный номер <strong>${profile.personalNumberLegal}</strong></#if></p>
        <p class="section">_______________________________</p>
        <p class="section-justify section-indent note">(подпись)</p>
        <p class="section-justify section-indent"></p>
        <p class="section-justify section-indent"></p>
        <p class="section-justify section-indent"></p>
        </#if>
    </div>
</div>
</body>
</html>