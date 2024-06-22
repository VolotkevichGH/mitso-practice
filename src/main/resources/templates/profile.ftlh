<#import "parts/common.ftlh" as c>
<#setting locale="ru">
<#setting number_format="####">
<#setting date_format="dd.MM.yyyy">

<@c.page>
    <div class="smart-wrap" xmlns:display="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">
        <div class="smart-forms smart-container wrap-0">
            <div class="form-body smart-steps stp-four">
                <form method="post" action="<#if isEditAdmin??>/editprofile<#else>/profile</#if>" id="smart-form" enctype="multipart/form-data">

                    <#if unValidForm??>
                        <div class="notification alert-error spacer-t10 spacer-b10">
                            <p>${unValidForm}</p>
                        </div>
                    </#if>
                    <h2>Личная информация</h2>
                    <fieldset>

                        <div class="spacer-b30 spacer-t40">
                            <div class="tagline">
                                <span>Персональные данные</span>
                            </div>
                        </div>

                        <div class="section">
                            <p class="small-text fine-grey align-center">Введите информацию на русском языке</p>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if lastNameRusError??>state-error</#if>">
                                    <input type="text" name="lastNameRus" id="lastNameRus" class="gui-input" placeholder="Фамилия" <#if lastNameRusError??>aria-describedby="lastNameRus-error" aria-invalid="true"</#if> value="<#if profile.lastNameRus??>${profile.lastNameRus}</#if>">
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if lastNameRusError??><em id="lastNameRus-error" class="state-error">${lastNameRusError}</em></#if>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if firstNameRusError??>state-error</#if>">
                                    <input type="text" name="firstNameRus" id="firstNameRus" class="gui-input" placeholder="Имя" <#if firstNameRusError??>aria-describedby="firstNameRus-error" aria-invalid="true"</#if> value="<#if profile.firstNameRus??>${profile.firstNameRus}</#if>">
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if firstNameRusError??><em id="firstNameRus-error" class="state-error">${firstNameRusError}</em></#if>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if middleNameRusError??>state-error</#if>">
                                    <input type="text" name="middleNameRus" id="middleNameRus" class="gui-input" placeholder="Отчество" <#if middleNameRusError??>aria-describedby="middleNameRus-error" aria-invalid="true"</#if> value="<#if profile.middleNameRus??>${profile.middleNameRus}</#if>">
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if middleNameRusError??><em id="middleNameRus-error" class="state-error">${middleNameRusError}</em></#if>
                            </div>

                        </div>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if birthDayError??>state-error</#if>">
                                    <input type="text" id="birthDay" name="birthDay" class="gui-input" placeholder="Дата рождения" <#if birthDayError??>aria-describedby="birthDay-error" aria-invalid="true"</#if> value="<#if profile.birthDay??>${profile.birthDay?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</#if>">
                                    <b class="tooltip tip-left-top"><em>Вы можете ввести дату в формате ДД.ММ.ГГГГ, Например: 01.10.2025</em></b>
                                    <span class="field-icon"><i class="fa fa-birthday-cake"></i></span>
                                </label>
                                <#if birthDayError??><em id="birthDay-error" class="state-error">${birthDayError}</em></#if>
                            </div>

                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if sexError??>state-error</#if>">
                                    <select id="sex" name="sex">
                                        <option value='' class="smartfm-ctrl">Пол</option>
                                        <option value='1' class="smartfm-ctrl" <#if profile.sex??><#if profile.sex == 1>selected</#if></#if>>Мужской</option>
                                        <option value='2' class="smartfm-ctrl" <#if profile.sex??><#if profile.sex == 2>selected</#if></#if>>Женский</option>
                                    </select>
                                    <span class="field-icon"><i class="fa fa-venus-mars"></i></span>
                                    <i class="arrow double"></i>
                                </label>
                                <#if sexError??><em id="sex-error" class="state-error">${sexError}</em></#if>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if nationalityError??>state-error</#if>">
                                    <input type="text" name="nationality" id="nationality" class="gui-input" placeholder="Национальность" <#if nationalityError??>aria-describedby="nationality-error" aria-invalid="true"</#if> value="<#if profile.nationality??>${profile.nationality}</#if>">
                                    <b class="tooltip tip-left-top"><em>Например: белорус, русский, украинец</em></b>
                                    <span class="field-icon"><i class="fa fa-flag"></i></span>
                                    <#if nationalityError??><em id="nationality-error" class="state-error">${nationalityError}</em></#if>
                                </label>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field select <#if maritalStatusError??>state-error</#if>">
                                    <select id="maritalStatus" name="maritalStatus">
                                        <option value='' class="smartfm-ctrl">Семейное положение</option>
                                        <#list maritalStatuses as mStatus>
                                            <option value='${mStatus.id}' class="smartfm-ctrl" <#if profile.maritalStatus??><#if profile.maritalStatus.id == mStatus.id>selected</#if></#if>>${mStatus.status}</option>
                                        </#list>
                                    </select>
                                    <#if maritalStatusError??><em id="maritalStatus-error" class="state-error">${maritalStatusError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon">
                                    <input type="email" name="emailAddress" id="emailAddress" class="gui-input" placeholder="Адрес электронной почты" value="<#if profile.user?? && profile.user.email??>${profile.user.email}</#if>" readonly>
                                    <span class="field-icon"><i class="fa fa-envelope"></i></span>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field <#if phoneError??>state-error</#if>">
                                    <input type="tel" id="phoneUtils" name="phoneUtils" class="gui-input" placeholder="Мобильный телефон" <#if phoneError??>aria-describedby="phone-error" aria-invalid="true"</#if> value="<#if profile.phone??>${profile.phone}</#if>">
                                    <input type="hidden" id="phoneResult" name="phone">
                                </label>
                            </div>
                        </div>

                        <div class="spacer-b30 spacer-t10">
                            <div class="tagline">
                                <span>Документ, удостоверяющий личность</span>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field select prepend-icon">
                                    <select id="typeDoc" name="typeDoc">
                                        <option value='' class="smartfm-ctrl" disabled>Выберите тип документа</option>
                                        <#list documents as doc>
                                            <option value="${doc.id}" class="smartfm-ctrl" <#if profile.user.docType??><#if profile.user.docType.id == doc.id>selected<#else>disabled</#if></#if>>${doc.type}</option>
                                        </#list>
                                    </select>
                                    <span class="field-icon"><i class="fa fa-book"></i></span>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon">
                                    <input type="text" name="serialDoc" id="serialDoc" class="gui-input" placeholder="Серия" value="<#if profile.user.docSeries??>${profile.user.docSeries}</#if>" readonly>
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon">
                                    <input type="text" name="numberDoc" id="numberDoc" class="gui-input" placeholder="Номер" value="<#if profile.user.docNumber??>${profile.user.docNumber}</#if>" readonly>
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                            </div>
                        </div>

                        <div id="additionalDoc" class="hiddenbox section smartform-reset">
                            <div class="frm-row">
                                <div class="section colm colm4 <#if personalNumberError??>state-error</#if>">
                                    <label class="field prepend-icon">
                                        <input type="text" name="personalNumber" id="personalNumber" class="gui-input latinoUP" placeholder="Личный номер" <#if personalNumberError??>aria-describedby="personalNumber-error" aria-invalid="true"</#if> value="<#if profile.personalNumber??>${profile.personalNumber}</#if>">
                                        <b class="tooltip tip-left-top"><em>Личный номер состоит из цифр и латинских букв.</em></b>
                                        <span class="field-icon"><i class="fa fa-id-card"></i></span>
                                    </label>
                                    <#if personalNumberError??><em id="personalNumber-error" class="state-error">${personalNumberError}</em></#if>
                                </div>

                                <div class="section colm colm4">
                                    <label class="field prepend-icon <#if docOnDateError??>state-error</#if>">
                                        <input type="text" id="dateOnDoc" name="docOnDate" class="gui-input" placeholder="Дата выдачи" <#if docOnDateError??>aria-describedby="docOnDate-error" aria-invalid="true"</#if> value="<#if profile.docOnDate??>${profile.docOnDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</#if>">
                                        <b class="tooltip tip-left-top"><em>Вы можете ввести дату в формате ДД.ММ.ГГГГ, Например: 01.10.2025</em></b>
                                        <span class="field-icon"><i class="fa fa-hourglass-start"></i></span>
                                    </label>
                                    <#if docOnDateError??><em id="docOnDate-error" class="state-error">${docOnDateError}</em></#if>
                                </div>

                                <div class="section colm colm4">
                                    <label class="field prepend-icon <#if docOffDateError??>state-error</#if>">
                                        <input type="text" id="dateOffDoc" name="docOffDate" class="gui-input" placeholder="Дата окончания действия" <#if docOffDateError??>aria-describedby="docOffDate-error" aria-invalid="true"</#if> value="<#if profile.docOffDate??>${profile.docOffDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</#if>">
                                        <b class="tooltip tip-left-top"><em>Вы можете ввести дату в формате ДД.ММ.ГГГГ, Например: 01.10.2025</em></b>
                                        <span class="field-icon"><i class="fa fa-hourglass-end"></i></span>
                                    </label>
                                    <#if docOffDateError??><em id="docOffDate-error" class="state-error">${docOffDateError}</em></#if>
                                </div>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm8">
                                <label class="field prepend-icon <#if docIssuedByError??>state-error</#if>">
                                    <input type="text" name="docIssuedBy" id="issuedDoc" class="gui-input" placeholder="Кем выдан" <#if docIssuedByError??>aria-describedby="docIssuedBy-error" aria-invalid="true"</#if> value="<#if profile.docIssuedBy??>${profile.docIssuedBy}</#if>">
                                    <span class="field-icon"><i class="fa fa-handshake"></i></span>
                                </label>
                                <#if docIssuedByError??><em id="docIssuedBy-error" class="state-error">${docIssuedByError}</em></#if>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if citizenshipError??>state-error</#if>">
                                    <input type="text" name="citizenship" id="citizenship" class="gui-input" placeholder="Гражданство" <#if citizenshipError??>aria-describedby="citizenship-error" aria-invalid="true"</#if> value="<#if profile.citizenship??>${profile.citizenship}</#if>">
                                    <b class="tooltip tip-left-top"><em>Введите название страны, гражданином которой являетесь</em></b>
                                    <span class="field-icon"><i class="fa fa-globe"></i></span>
                                </label>
                                <#if citizenshipError??><em id="citizenship-error" class="state-error">${citizenshipError}</em></#if>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t20">
                                    <span>Информация на белорусском языке</span>
                                </div>

                                <label class="field prepend-icon spacer-t20 <#if lastNameBlrError??>state-error</#if>">
                                    <input type="text" name="lastNameBlr" id="lastNameBlr" class="gui-input" placeholder="Прозвішча" <#if lastNameBlrError??>aria-describedby="lastNameBlr-error" aria-invalid="true"</#if> value="<#if profile.lastNameBlr??>${profile.lastNameBlr}</#if>">
                                    <b class="tooltip tip-left-top"><em>При вводе происходит автозамена (и - і, щ - ў, ъ - ')</em></b>
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if lastNameBlrError??><em id="lastNameBlr-error" class="state-error">${lastNameBlrError}</em></#if>

                                <label class="field prepend-icon spacer-t20 <#if firstNameBlrError??>state-error</#if>">
                                    <input type="text" name="firstNameBlr" id="firstNameBlr" class="gui-input" placeholder="Імя" <#if firstNameBlrError??>aria-describedby="firstNameBlr-error" aria-invalid="true"</#if> value="<#if profile.firstNameBlr??>${profile.firstNameBlr}</#if>">
                                    <b class="tooltip tip-left-top"><em>При вводе происходит автозамена (и - і, щ - ў, ъ - ')</em></b>
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if firstNameBlrError??><em id="firstNameBlr-error" class="state-error">${firstNameBlrError}</em></#if>

                                <label class="field prepend-icon spacer-t20 <#if middleNameBlrError??>state-error</#if>">
                                    <input type="text" name="middleNameBlr" id="middleNameBlr" class="gui-input" placeholder="Імя па бацьку" <#if middleNameBlrError??>aria-describedby="middleNameBlr-error" aria-invalid="true"</#if> value="<#if profile.middleNameBlr??>${profile.middleNameBlr}</#if>">
                                    <b class="tooltip tip-left-top"><em>При вводе происходит автозамена (и - і, щ - ў, ъ - ')</em></b>
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if middleNameBlrError??><em id="middleNameBlr-error" class="state-error">${middleNameBlrError}</em></#if>
                            </div>

                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t20">
                                    <span>Информация латинскими буквами</span>
                                </div>

                                <label class="field prepend-icon spacer-t20 <#if lastNameLatError??>state-error</#if>">
                                    <input type="text" name="lastNameLat" id="lastNameLat" class="gui-input latinoUP" placeholder="Last Name" <#if lastNameLatError??>aria-describedby="lastNameLat-error" aria-invalid="true"</#if> value="<#if profile.lastNameLat??>${profile.lastNameLat}</#if>">
                                    <b class="tooltip tip-left-top"><em>Введите фамилию на латинице согласно паспорту</em></b>
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if lastNameLatError??><em id="lastNameLat-error" class="state-error">${lastNameLatError}</em></#if>

                                <label class="field prepend-icon spacer-t20 <#if firstNameLatError??>state-error</#if>">
                                    <input type="text" name="firstNameLat" id="firstNameLat" class="gui-input latinoUP" placeholder="First Name" <#if firstNameLatError??>aria-describedby="firstNameLat-error" aria-invalid="true"</#if> value="<#if profile.firstNameLat??>${profile.firstNameLat}</#if>">
                                    <b class="tooltip tip-left-top"><em>Введите имя на латинице согласно паспорту</em></b>
                                    <span class="field-icon"><i class="fa fa-user"></i></span>
                                </label>
                                <#if firstNameLatError??><em id="firstNameLat-error" class="state-error">${firstNameLatError}</em></#if>
                            </div>
                        </div>


                        <div class="spacer-b30 spacer-t10">
                            <div class="tagline">
                                <span>Адрес регистрации</span>
                            </div>
                        </div>

                        <#if localityError??>
                            <div class="notification alert-error spacer-t10 spacer-b10">
                                <p>${localityError}</p>
                            </div>
                        </#if>

                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="option option-blue block spacer-b10">
                                    <input type="checkbox" name="foreignCheck" id="foreignCheck" value="true" <#if profile.foreignCheck>checked</#if>>
                                    <span class="checkbox"></span> Адрес регистрации на территории иностранного государства
                                </label>
                            </div>
                        </div>

                        <div class="frm-row foreign-block" <#if !profile.foreignCheck>style="display: none;"</#if>>
                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if registrationCountryForeignError??>state-error</#if>">
                                    <select id="countryRegForeign" class="address-basic smart-select2" name="registrationCountryForeign">
                                        <option value="">Страна</option>
                                        <#list countries as c>
                                            <option value="${c.id}" class="smartfm-ctrl" <#if c.shortName == "Беларусь">disabled</#if> <#if profile.registrationCountryForeign??><#if profile.registrationCountryForeign.id == c.id>selected</#if></#if>>${c.shortName}</option>
                                        </#list>
                                    </select>
                                    <#if registrationCountryForeignError??><em id="registrationCountryForeign-error" class="state-error">${registrationCountryForeignError}</em></#if>
                                    <span class="field-icon"><i class="fa fa-flag"></i></span>
                                </label>
                            </div>
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if registrationAreaForeignError??>state-error</#if>">
                                    <input type="text" name="registrationAreaForeign" id="areaRegForeign" class="gui-input" placeholder="Область" <#if registrationAreaForeignError??>aria-describedby="registrationAreaForeign-error" aria-invalid="true"</#if> value="<#if profile.registrationAreaForeign??>${profile.registrationAreaForeign}</#if>">
                                    <b class="tooltip tip-left-top"><em>Например: Московская обл.</em></b>
                                    <span class="field-icon"><i class="fa fa-pie-chart"></i></span>
                                </label>
                                <#if registrationAreaForeignError??><em id="registrationAreaForeign-error" class="state-error">${registrationAreaForeignError}</em></#if>
                            </div>
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if registrationDistrictForeignError??>state-error</#if>">
                                    <input type="text" name="registrationDistrictForeign" id="districtRegForeign" class="gui-input" placeholder="Район" <#if registrationDistrictForeignError??>aria-describedby="registrationDistrictForeign-error" aria-invalid="true"</#if> value="<#if profile.registrationDistrictForeign??>${profile.registrationDistrictForeign}</#if>">
                                    <b class="tooltip tip-left-top"><em>Например: Псковский р-н</em></b>
                                    <span class="field-icon"><i class="fa fa-pie-chart"></i></span>
                                </label>
                                <#if registrationDistrictForeignError??><em id="registrationDistrictForeign-error" class="state-error">${registrationDistrictForeignError}</em></#if>
                            </div>
                        </div>
                        <div class="frm-row foreign-block" <#if !profile.foreignCheck>style="display: none;"</#if>>
                            <div class="section colm colm4">
                                <label class="field select <#if registrationTypeLocalityForeignError??>state-error</#if>">
                                    <select id="typeLocalityRegForeign" name="registrationTypeLocalityForeign">
                                        <option value="">Тип нас.пункта</option>
                                        <#list typeLocalities as tl>
                                            <option value="${tl.id}" class="smartfm-ctrl" <#if profile.registrationTypeLocalityForeign??><#if profile.registrationTypeLocalityForeign.id == tl.id>selected</#if></#if>>${tl.fullName}</option>
                                        </#list>
                                    </select>
                                    <#if registrationTypeLocalityForeignError??><em id="registrationTypeLocalityForeign-error" class="state-error">${registrationTypeLocalityForeignError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="section colm colm4 <#if registrationLocalityForeignError??>state-error</#if>">
                                <label class="field prepend-icon">
                                    <input type="text" name="registrationLocalityForeign" id="localityRegForeign" class="gui-input" placeholder="Название нас.пункта" <#if registrationLocalityForeignError??>aria-describedby="registrationLocalityForeign-error" aria-invalid="true"</#if> value="<#if profile.registrationLocalityForeign??>${profile.registrationLocalityForeign}</#if>">
                                    <b class="tooltip tip-left-top"><em>Например: Москва</em></b>
                                    <span class="field-icon"><i class="fa fa-pie-chart"></i></span>
                                </label>
                                <#if registrationLocalityForeignError??><em id="registrationLocalityForeign-error" class="state-error">${registrationLocalityForeignError}</em></#if>
                            </div>
                            <div class="section colm colm4 <#if registrationZipCodeForeignError??>state-error</#if>">
                                <label class="field prepend-icon">
                                    <input type="text" name="registrationZipCodeForeign" id="zipRegForeign" class="gui-input" placeholder="Индекс" <#if registrationZipCodeForeignError??>aria-describedby="registrationZipCodeForeign-error" aria-invalid="true"</#if> value="<#if profile.registrationZipCodeForeign??>${profile.registrationZipCodeForeign}</#if>">
                                    <span class="field-icon"><i class="fa fa-bullseye"></i></span>
                                </label>
                                <#if registrationZipCodeForeignError??><em id="registrationZipCodeForeign-error" class="state-error">${registrationZipCodeForeignError}</em></#if>
                            </div>
                        </div>

                        <div class="frm-row blrus-block" <#if profile.foreignCheck>style="display: none;"</#if>>
                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if registrationCountryError??>state-error</#if>">
                                    <select id="countryReg" class="smart-select2" name="registrationCountry">
                                        <option value="">Страна</option>
                                        <option value="34" class="smartfm-ctrl" <#if profile.registrationCountry??><#if profile.registrationCountry.id == 34 || profile.registrationLocality??>selected</#if></#if>>Республика Беларусь</option>
                                    </select>
                                    <#if registrationCountryError??><em id="registrationCountry-error" class="state-error">${registrationCountryError}</em></#if>
                                    <span class="field-icon"><i class="fa fa-flag"></i></span>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if registrationLocalityError??>state-error</#if>">
                                    <select id="areaReg" class="address-basic smart-select2" name="areaReg">
                                        <option value="">Область</option>
                                        <#if areas??>
                                            <#list areas as ar>
                                                <option value="${ar.id}" class="smartfm-ctrl" <#if profile.registrationLocality.area??><#if profile.registrationLocality.area.id == ar.id>selected</#if></#if>>${ar.name}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <#if registrationLocalityError??><em id="registrationLocality-error" class="state-error">Выберите область</em></#if>
                                    <span class="field-icon"><i class="fa fa-pie-chart"></i></span>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if registrationLocalityError??>state-error</#if>">
                                    <select id="districtReg" class="address-basic smart-select2" name="districtReg">
                                        <option value="">Район</option>
                                        <#if districts??>
                                            <#list districts as ds>
                                                <option value="${ds.id}" class="smartfm-ctrl" <#if profile.registrationLocality.district??><#if profile.registrationLocality.district == ds.id>selected</#if></#if>>${ds.name}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <span class="field-icon"><i class="fa fa-pie-chart"></i></span>
                                </label>
                                <label for="districtReg" class="field-label">
                                    <p class="small-text fine-grey"><strong><u>Внимание!</u> Для районных центров и городов республиканского подчинения район не указывать </strong></p>
                                </label>
                            </div>
                        </div>

                        <div class="frm-row blrus-block" <#if profile.foreignCheck>style="display: none;"</#if>>
                            <div class="section colm colm4">
                                <label class="field select <#if registrationLocalityError??>state-error</#if>">
                                    <select id="typeLocalityReg" name="typeLocalityReg">
                                        <option value="">Тип нас.пункта</option>
                                        <#list typeLocalities as tl>
                                            <option value="${tl.id}" class="smartfm-ctrl" <#if profile.registrationLocality??><#if profile.registrationLocality.typeLocality.id == tl.id>selected</#if></#if>>${tl.fullName}</option>
                                        </#list>
                                    </select>
                                    <#if registrationLocalityError??><em id="registrationLocality-error" class="state-error">Выберите тип нас.пункта</em></#if>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if registrationLocalityError??>state-error</#if>">
                                    <select id="nameCityReg" class="address-basic smart-select2" name="registrationLocality">
                                        <option value="">Название нас.пункта</option>
                                        <#if localities??>
                                            <#list localities as loc>
                                                <option value="${loc.id}" class="smartfm-ctrl" <#if profile.registrationLocality??><#if profile.registrationLocality.id == loc.id>selected</#if></#if>>${loc.name}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <#if registrationLocalityError??><em id="registrationLocality-error" class="state-error">${registrationLocalityError}</em></#if>
                                    <span class="field-icon"><i class="fa fa-building"></i></span>
                                </label>
                            </div>

                            <div class="section colm colm4 <#if registrationZipCodeError??>state-error</#if>">
                                <label class="field prepend-icon">
                                    <input type="text" name="registrationZipCode" id="zipReg" class="gui-input" placeholder="Индекс" <#if registrationZipCodeError??>aria-describedby="registrationZipCode-error" aria-invalid="true"</#if> value="<#if profile.registrationZipCode??>${profile.registrationZipCode}</#if>">
                                    <span class="field-icon"><i class="fa fa-bullseye"></i></span>
                                </label>
                                <#if registrationZipCodeError??><em id="registrationZipCode-error" class="state-error">${registrationZipCodeError}</em></#if>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm2 <#if registrationTypeStreetError??>state-error</#if>">
                                <label class="field select">
                                    <select id="typeStreetReg" name="registrationTypeStreet">
                                        <option value="">Тип улицы</option>
                                        <#list typeStreets as ts>
                                            <option value="${ts.id}" class="smartfm-ctrl" <#if profile.registrationTypeStreet??><#if profile.registrationTypeStreet.id == ts.id>selected</#if></#if>>${ts.fullName}</option>
                                        </#list>
                                    </select>
                                    <#if registrationTypeStreetError??><em id="registrationTypeStreet-error" class="state-error">${registrationTypeStreetError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if registrationStreetNameError??>state-error</#if>">
                                    <input type="text" name="registrationStreetName" id="nameStreetReg" class="gui-input" placeholder="Название улицы" <#if registrationStreetNameError??>aria-describedby="registrationStreetName-error" aria-invalid="true"</#if> value="<#if profile.registrationStreetName??>${profile.registrationStreetName}</#if>">
                                    <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                </label>
                                <#if registrationStreetNameError??><em id="registrationStreetName-error" class="state-error">${registrationStreetNameError}</em></#if>
                            </div>

                            <div class="section colm colm2">
                                <label class="field prepend-icon <#if registrationBuildingNumberError??>state-error</#if>">
                                    <input type="text" name="registrationBuildingNumber" id="homeReg" class="gui-input" placeholder="Дом" <#if registrationBuildingNumberError??>aria-describedby="registrationBuildingNumber-error" aria-invalid="true"</#if> value="<#if profile.registrationBuildingNumber??>${profile.registrationBuildingNumber}</#if>">
                                    <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                </label>
                                <#if registrationBuildingNumberError??><em id="registrationBuildingNumber-error" class="state-error">${registrationBuildingNumberError}</em></#if>
                            </div>

                            <div class="section colm colm2">
                                <label class="field prepend-icon <#if registrationBuildingPartError??>state-error</#if>">
                                    <input type="text" name="registrationBuildingPart" id="partReg" class="gui-input" placeholder="Корпус" <#if registrationBuildingPartError??>aria-describedby="registrationBuildingPart-error" aria-invalid="true"</#if> value="<#if profile.registrationBuildingPart??>${profile.registrationBuildingPart}</#if>">
                                    <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                </label>
                                <#if registrationBuildingPartError??><em id="registrationBuildingPart-error" class="state-error">${registrationBuildingPartError}</em></#if>
                            </div>

                            <div class="section colm colm2">
                                <label class="field prepend-icon <#if registrationApartmentError??>state-error</#if>">
                                    <input type="text" name="registrationApartment" id="flatReg" class="gui-input" placeholder="Квартира" <#if registrationApartmentError??>aria-describedby="registrationApartment-error" aria-invalid="true"</#if> value="<#if profile.registrationApartment??>${profile.registrationApartment}</#if>">
                                    <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                </label>
                                <#if registrationApartmentError??><em id="registrationApartment-error" class="state-error">${registrationApartmentError}</em></#if>
                            </div>

                        </div>
                    </fieldset>

















                    <h2>Образование</h2>
                    <fieldset>
                        <div class="spacer-b30 spacer-t40">
                            <div class="tagline">
                                <span>Образование до поступления</span>
                            </div>
                        </div>
                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if typeEducationError??>state-error</#if>">
                                    <select id="typeEducation" name="typeEducation">
                                        <option value="">Уровень образования</option>
                                        <#list typeEducations as te>
                                            <option value="${te.id}" class="smartfm-ctrl" <#if profile.typeEducation??><#if profile.typeEducation.id == te.id>selected</#if></#if>>${te.name}</option>
                                        </#list>
                                    </select>
                                    <#if typeEducationError??><em id="typeEducation-error" class="state-error">${typeEducationError}</em></#if>
                                    <i class="arrow double"></i>
                                    <span class="field-icon"><i class="fa fa-level-up"></i></span>
                                </label>
                            </div>
                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if yearEducationError??>state-error</#if>">
                                    <select id="yearEducation" name="yearEducation">
                                        <option value="">Год получения образования</option>
                                        <#list years as year>
                                            <option value="${year.id?int}" class="smartfm-ctrl" <#if profile.yearEducation??><#if profile.yearEducation.id == year.id>selected</#if></#if>>${year.name?int}</option>
                                        </#list>
                                    </select>
                                    <#if yearEducationError??><em id="yearEducation-error" class="state-error">${yearEducationError}</em></#if>
                                    <i class="arrow double"></i>
                                    <span class="field-icon"><i class="fa fa-calendar"></i></span>
                                </label>
                            </div>
                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if typeSchoolError??>state-error</#if>">
                                    <select id="typeSchool" name="typeSchool">
                                        <option value="">Тип учебного заведения</option>
                                        <#list typeSchools as tschool>
                                            <option value='${tschool.id}' class="smartfm-ctrl" <#if profile.typeSchool??><#if profile.typeSchool.id == tschool.id>selected</#if></#if>>${tschool.fullName}</option>
                                        </#list>
                                    </select>
                                    <#if typeSchoolError??><em id="typeSchool-error" class="state-error">${typeSchoolError}</em></#if>
                                    <i class="arrow double"></i>
                                    <span class="field-icon"><i class="fa fa-building"></i></span>
                                </label>
                            </div>
                        </div>
                        <div class="frm-row">
                            <div class="section colm colm8">
                                <span>Тип населённого пункта, в котором находится учреждение образования, которое окончил абитуриент </span>
                            </div>

                            <div class="section colm colm4">
                                <div class="option-group field">
                                    <div class="smart-option-group">
                                        <label for="cityRadio" class="option">
                                            <input type="radio" id="cityRadio" name="villageSchool" value="false" <#if profile.villageSchool??><#if profile.villageSchool == false>checked</#if></#if>>
                                            <span class="smart-option smart-radio"><span class="smart-option-ui"> <i class="iconc"></i>  Городской</span></span>
                                        </label>

                                        <label for="villageRadio" class="option">
                                            <input type="radio" id="villageRadio" name="villageSchool" value="true" <#if profile.villageSchool??><#if profile.villageSchool == true>checked</#if></#if>>
                                            <span class="smart-option smart-radio"><span class="smart-option-ui"> <i class="iconc"></i>  Сельский</span></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="field prepend-icon <#if fullNameSchoolError??>state-error</#if>">
                                    <input type="text" name="fullNameSchool" id="fullNameSchool" class="gui-input" placeholder="Полное наименование учреждения образования" <#if fullNameSchoolError??>aria-describedby="fullNameSchool-error" aria-invalid="true"</#if> value="<#if profile.fullNameSchool??>${profile.fullNameSchool}</#if>">
                                    <b class="tooltip tip-left-top"><em>Например: УО "Могилёвский государственный областной лицей №1"</em></b>
                                    <span class="field-icon"><i class="fa fa-pencil"></i></span>
                                </label>
                                <#if fullNameSchoolError??><em id="fullNameSchool-error" class="state-error">${fullNameSchoolError}</em></#if>
                            </div>
                        </div>
                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="field prepend-icon <#if nameSpecialtyError??>state-error</#if>">
                                    <input type="text" name="nameSpecialty" id="nameSpecialty" class="gui-input" placeholder="Специальность" <#if nameSpecialtyError??>aria-describedby="nameSpecialty-error" aria-invalid="true"</#if> value="<#if profile.nameSpecialty??>${profile.nameSpecialty}</#if>">
                                    <b class="tooltip tip-left-top"><em>Укажите специальность при наличии высшего или среднего-специального/ профессионально-технического образования</em></b>
                                    <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                </label>
                                <#if nameSpecialtyError??><em id="nameSpecialty-error" class="state-error">${nameSpecialtyError}</em></#if>
                            </div>
                        </div>

                        <div class="spacer-b30 spacer-t40">
                            <div class="tagline">
                                <span>Документ об образовании</span>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if docEduNumberError??>state-error</#if>">
                                    <input type="text" name="docEduNumber" id="docEduNumber" class="gui-input" placeholder="Номер №" <#if docEduNumberError??>aria-describedby="docEduNumber-error" aria-invalid="true"</#if> value="<#if profile.docEduNumber??>${profile.docEduNumber}</#if>">
                                    <b class="tooltip tip-left-top"><em>Серия и номер документа об образовании состоит из цифр и латинских букв.</em></b>
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                                <#if docEduNumberError??><em id="docEduNumber-error" class="state-error">${docEduNumberError}</em></#if>
                            </div>
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if docEduDateError??>state-error</#if>">
                                    <input type="text" id="docEduDate" name="docEduDate" class="gui-input" placeholder="Дата выдачи" <#if docEduDateError??>aria-describedby="docEduDateStr-error" aria-invalid="true"</#if> value="<#if profile.docEduDate??>${profile.docEduDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</#if>">
                                    <b class="tooltip tip-left-top"><em>Вы можете ввести дату в формате ДД.ММ.ГГГГ, Например: 01.10.2025</em></b>
                                    <span class="field-icon"><i class="fa fa-calendar"></i></span>
                                </label>
                                <#if docEduDateError??><em id="docEduDateStr-error" class="state-error">${docEduDateError}</em></#if>
                            </div>
                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if docEduPointError??>state-error</#if>">
                                    <input type="text" name="docEduPoint" id="docEduPoint" class="gui-input" placeholder="Средний балл документа" <#if docEduPointError??>aria-describedby="docEduPoint-error" aria-invalid="true"</#if> value="<#if profile.docEduPoint??>${profile.docEduPoint}</#if>">
                                    <b class="tooltip tip-left-top"><em>Средний балл от 10 до 100. Пример: при среднем балле 9,3 вводим 93</em></b>
                                    <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                </label>
                                <#if docEduPointError??><em id="docEduPoint-error" class="state-error">${docEduPointError}</em></#if>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t40">
                                    <span>Отличия и награды</span>
                                </div>

                                <#list awards as award>
                                    <label class="option option-blue block spacer-b10">
                                        <input type="checkbox" name="awardList" value="${award.id}"
                                        <#if profile.awardList??>
                                            <#list profile.awardList as awardCheck>
                                                <#if awardCheck.id == award.id>checked</#if>
                                            </#list>
                                        </#if>>
                                        <span class="checkbox"></span> ${award.fullName}
                                    </label>
                                </#list>

                            </div>
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t40">
                                    <span>Дополнительные сведения</span>
                                </div>

                                <label class="switch switch-round switch-black spacer-b10">
                                    <span>Поступление по целевому направлению? </span>
                                    <input type="checkbox" name="target" id="target" <#if profile.target>checked</#if>>
                                    <span class="switch-label" data-on="Да" data-off="Нет"></span>
                                </label>

                                <label class="field prepend-icon spacer-b10 target-block <#if targetIssuedByError??>state-error</#if>" <#if !profile.target>style="display: none;"</#if>>
                                    <input type="text" name="targetIssuedBy" id="targetIssuedBy" class="gui-input" placeholder="Кем выдано целевое направление" <#if targetIssuedByError??>aria-describedby="targetIssuedBy-error" aria-invalid="true"</#if> value="<#if profile.targetIssuedBy??>${profile.targetIssuedBy}</#if>">
                                    <span class="field-icon"><i class="fa fa-file"></i></span>
                                </label>
                                <#if targetIssuedByError??><em id="targetIssuedBy-error" class="state-error">${targetIssuedByError}</em></#if>

                                <label class="switch switch-round switch-black spacer-b10">
                                    <span>Работа в сфере образования? </span>
                                    <input type="checkbox" name="workExperience" id="workExperience" <#if profile.workExperience>checked</#if>>
                                    <span class="switch-label" data-on="Да" data-off="Нет"></span>
                                </label>

                                <label class="field prepend-icon spacer-b10 <#if workExperienceYearsError??>state-error</#if>">
                                    <input type="text" name="workExperienceYears" id="workExperienceYears" class="gui-input" placeholder="Трудовой стаж (количество полных лет)" <#if workExperienceYearsError??>aria-describedby="workExperienceYears-error" aria-invalid="true"</#if> value="<#if profile.workExperienceYears??>${profile.workExperienceYears}</#if>">
                                    <b class="tooltip tip-left-top"><em>Укажите при наличии трудового стажа в сфере образования</em></b>
                                    <span class="field-icon"><i class="fa fa-file"></i></span>
                                </label>
                                <#if workExperienceYearsError??><em id="workExperienceYears-error" class="state-error">${workExperienceYearsError}</em></#if>

                                <label class="field prepend-icon spacer-b10 <#if workExperienceMonthsError??>state-error</#if>">
                                    <input type="text" name="workExperienceMonths" id="workExperienceMonths" class="gui-input" placeholder="Трудовой стаж (количество полных месяцев)" <#if workExperienceMonthsError??>aria-describedby="workExperienceMonths-error" aria-invalid="true"</#if> value="<#if profile.workExperienceMonths??>${profile.workExperienceMonths}</#if>">
                                    <b class="tooltip tip-left-top"><em>Укажите при наличии трудового стажа в сфере образования</em></b>
                                    <span class="field-icon"><i class="fa fa-file"></i></span>
                                </label>
                                <#if workExperienceMonthsError??><em id="workExperienceMonths-error" class="state-error">${workExperienceMonthsError}</em></#if>

                                <label class="field prepend-icon spacer-b10 <#if workPlaceError??>state-error</#if>">
                                    <input type="text" name="workPlace" id="workPlace" class="gui-input" placeholder="Место работы" <#if workPlaceError??>aria-describedby="workPlace-error" aria-invalid="true"</#if> value="<#if profile.workPlace??>${profile.workPlace}</#if>">
                                    <span class="field-icon"><i class="fa fa-file"></i></span>
                                </label>
                                <#if workPlaceError??><em id="workPlace-error" class="state-error">${workPlaceError}</em></#if>

                                <label class="field prepend-icon spacer-b10 <#if positionError??>state-error</#if>">
                                    <input type="text" name="position" id="position" class="gui-input" placeholder="Занимаемая должность" <#if positionError??>aria-describedby="position-error" aria-invalid="true"</#if> value="<#if profile.position??>${profile.position}</#if>">
                                    <span class="field-icon"><i class="fa fa-file"></i></span>
                                </label>
                                <#if positionError??><em id="position-error" class="state-error">${positionError}</em></#if>

                                <label class="switch switch-round switch-black spacer-b10 hasSpecialty-block" <#if !profile.nameSpecialty??>style="display: none;"</#if>>
                                    <span>Родственная специальность? </span>
                                    <input type="checkbox" name="siblingsSpecialty" id="siblingsSpecialy" <#if profile.siblingsSpecialty>checked</#if>>
                                    <span class="switch-label" data-on="Да" data-off="Нет"></span>
                                </label>

                                <label class="switch switch-round switch-black spacer-b10">
                                    <span>Нуждаетесь в общежитии? </span>
                                    <input type="checkbox" name="needHostel" id="needHostel" <#if profile.needHostel>checked</#if>>
                                    <span class="switch-label" data-on="Да" data-off="Нет"></span>
                                </label>

                                <label class="switch switch-round switch-black spacer-b10">
                                    <span>Выпускник педагогического класса? </span>
                                    <input type="checkbox" name="teacherClassGraduate" id="teacherClassGraduate" <#if profile.teacherClassGraduate>checked</#if>>
                                    <span class="switch-label" data-on="Да" data-off="Нет"></span>
                                </label>
                            </div>
                        </div>


                        <div class="spacer-b30 spacer-t40">
                            <div class="tagline">
                                <span>Результаты централизованного тестирования</span>
                            </div>
                        </div>

                        <#if selectedDisciplineError??>
                            <div class="notification alert-error spacer-t10 spacer-b10">
                                <p>${selectedDisciplineError}</p>
                            </div>
                        </#if>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <p class="small-text fine-grey align-center">Иностранный язык</p>

                                <label class="field select <#if foreignLanguageError??>state-error</#if>">
                                    <select id="foreignLanguage" name="foreignLanguage">
                                        <option value="">Иностранный язык</option>
                                        <#list langForeign as lf>
                                            <option value='${lf.id}' class="smartfm-ctrl" <#if profile.foreignLanguage??><#if profile.foreignLanguage.id == lf.id>selected</#if></#if>>${lf.fullName}</option>
                                        </#list>
                                    </select>
                                    <#if foreignLanguageError??><em id="foreignLanguage-error" class="state-error">${foreignLanguageError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>

                                <label class="field prepend-icon <#if foreignLanguageCodeError??>state-error</#if>">
                                    <input type="text" name="foreignLanguageCode" id="foreignLanguageCode" class="gui-input" placeholder="Номер сертификата" <#if foreignLanguageCodeError??>aria-describedby="foreignLanguageCode-error" aria-invalid="true"</#if> value="<#if profile.foreignLanguageCode??>${profile.foreignLanguageCode}</#if>">
                                    <b class="tooltip tip-left-top"><em>Номер сертификата расположен в верхнем правом углу и состоит из цифр</em></b>
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                                <#if foreignLanguageCodeError??><em id="foreignLanguageCode-error" class="state-error">${foreignLanguageCodeError}</em></#if>

                                <label class="field prepend-icon <#if foreignLanguagePointError??>state-error</#if>">
                                    <input type="text" name="foreignLanguagePoint" id="foreignLanguagePoint" class="gui-input" placeholder="Балл по предмету" <#if foreignLanguagePointError??>aria-describedby="foreignLanguagePoint-error" aria-invalid="true"</#if> value="<#if profile.foreignLanguagePoint??>${profile.foreignLanguagePoint}</#if>">
                                    <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                </label>
                                <#if foreignLanguagePointError??><em id="foreignLanguagePoint-error" class="state-error">${foreignLanguagePointError}</em></#if>
                            </div>
                            <div class="section colm colm4">
                                <p class="small-text fine-grey align-center">Государственный язык</p>

                                <label class="field select <#if stateLanguageError??>state-error</#if>">
                                    <select id="stateLanguage" name="stateLanguage">
                                        <option value="">Государственный язык</option>
                                        <#list langState as lst>
                                            <option value='${lst.id}' class="smartfm-ctrl" <#if profile.stateLanguage??><#if profile.stateLanguage.id == lst.id>selected</#if></#if>>${lst.fullName}</option>
                                        </#list>
                                    </select>
                                    <#if stateLanguageError??><em id="stateLanguage-error" class="state-error">${stateLanguageError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>

                                <label class="field prepend-icon <#if stateLanguageCodeError??>state-error</#if>">
                                    <input type="text" name="stateLanguageCode" id="stateLanguageCode" class="gui-input" placeholder="Номер сертификата" <#if stateLanguageCodeError??>aria-describedby="stateLanguageCode-error" aria-invalid="true"</#if> value="<#if profile.stateLanguageCode??>${profile.stateLanguageCode}</#if>">
                                    <b class="tooltip tip-left-top"><em>Номер сертификата расположен в верхнем правом углу и состоит из цифр</em></b>
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                                <#if stateLanguageCodeError??><em id="stateLanguageCode-error" class="state-error">${stateLanguageCodeError}</em></#if>

                                <label class="field prepend-icon <#if stateLanguagePointError??>state-error</#if>">
                                    <input type="text" name="stateLanguagePoint" id="stateLanguagePoint" class="gui-input" placeholder="Балл по предмету" <#if stateLanguagePointError??>aria-describedby="stateLanguagePoint-error" aria-invalid="true"</#if> value="<#if profile.stateLanguagePoint??>${profile.stateLanguagePoint}</#if>">
                                    <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                </label>
                                <#if stateLanguagePointError??><em id="stateLanguagePoint-error" class="state-error">${stateLanguagePointError}</em></#if>

                            </div>

                            <div class="section colm colm4">
                                <p class="small-text fine-grey align-center">История Беларуси / Всемирная история</p>

                                <label class="field select <#if historyError??>state-error</#if>">
                                    <select id="history" name="history">
                                        <option value="">История</option>
                                    </select>
                                    <#if historyError??><em id="history-error" class="state-error">${historyError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>

                                <label class="field prepend-icon <#if historyCodeError??>state-error</#if>">
                                    <input type="text" name="historyCode" id="historyCode" class="gui-input" placeholder="Номер сертификата" <#if historyCodeError??>aria-describedby="historyCode-error" aria-invalid="true"</#if> value="<#if profile.historyCode??>${profile.historyCode}</#if>">
                                    <b class="tooltip tip-left-top"><em>Номер сертификата расположен в верхнем правом углу и состоит из цифр</em></b>
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                                <#if historyCodeError??><em id="historyCode-error" class="state-error">${historyCodeError}</em></#if>

                                <label class="field prepend-icon <#if historyPointError??>state-error</#if>">
                                    <input type="text" name="historyPoint" id="historyPoint" class="gui-input" placeholder="Балл по предмету" <#if historyPointError??>aria-describedby="historyPoint-error" aria-invalid="true"</#if> value="<#if profile.historyPoint??>${profile.historyPoint}</#if>">
                                    <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                </label>
                                <#if historyPointError??><em id="historyPoint-error" class="state-error">${historyPointError}</em></#if>

                            </div>
                        </div>

                        <div class="spacer-b30 spacer-t40">
                            <div class="tagline">
                                <span>Сведения о льготах</span>
                            </div>
                        </div>

                        <div class="frm-row">
                            <#list advantages as adv>
                            <div class="section colm colm4">
                                <label class="option option-blue block">
                                    <input type="checkbox" name="advantageList" value="${adv.id}"
                                    <#if profile.advantageList??>
                                        <#list profile.advantageList as advantageCheck>
                                            <#if advantageCheck.id == adv.id>checked</#if>
                                        </#list>
                                    </#if>>
                                    <span class="checkbox"></span> ${adv.fullName}
                                </label>
                            </div>
                            </#list>
                        </div>





                        <div class="spacer-b30 spacer-t40">
                            <div class="tagline">
                                <span>Выбор специальности для участия в конкурсе</span>
                            </div>
                        </div>

                        <#if specialtyCheckError??>
                            <div class="notification alert-error spacer-t10 spacer-b10">
                                <p>${specialtyCheckError}</p>
                            </div>
                        </#if>

                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="field select <#if specialtyError??>state-error</#if>">
                                    <select id="faculty" name="faculty">
                                        <option value="">Выберите факультет</option>
                                        <#list faculties as fac>
                                            <option value="${fac.id}" class="smartfm-ctrl" <#if profile.specialty??><#if profile.specialty.faculty.id == fac.id>selected</#if></#if>>${fac.fullName}</option>
                                        </#list>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field select <#if specialtyError??>state-error</#if>">
                                    <select id="eduForm" name="eduForm">
                                        <option value="">Форма обучения</option>
                                        <#if typeEducationForms??>
                                            <#list typeEducationForms as tform>
                                                <option value="${tform.id}" class="smartfm-ctrl" <#if profile.specialty??><#if profile.specialty.typeEducationForm.id == tform.id>selected</#if></#if>>${tform.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="section colm colm4">
                                <label class="field select <#if specialtyError??>state-error</#if>">
                                    <select id="eduContract" name="eduContract">
                                        <option value="">Форма договора на обучение</option>
                                        <#if typeEducationContracts??>
                                            <#list typeEducationContracts as tcontract>
                                                <option value="${tcontract.id}" class="smartfm-ctrl" <#if profile.specialty??><#if profile.specialty.typeEducationContract.id == tcontract.id>selected</#if></#if>>${tcontract.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="section colm colm4">
                                <label class="field select <#if specialtyError??>state-error</#if>">
                                    <select id="eduPeriod"  name="eduPeriod">
                                        <option value="">Срок обучения</option>
                                        <#if typeEducationPeriods??>
                                            <#list typeEducationPeriods as tperiod>
                                                <option value="${tperiod.id}" class="smartfm-ctrl" <#if profile.specialty??><#if profile.specialty.typeEducationPeriod.id == tperiod.id>selected</#if></#if>>${tperiod.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="field select <#if specialtyError??>state-error</#if>">
                                    <select id="specialty"  name="specialty">
                                        <option value="">Название специальности</option>
                                        <#if specialties??>
                                            <#list specialties as spec>
                                                <option value="${spec.id}" class="smartfm-ctrl" <#if profile.specialty??><#if profile.specialty.id == spec.id>selected</#if></#if>>${spec.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <#if specialtyError??><em id="specialty-error" class="state-error">${specialtyError}</em></#if>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                        </div>

                        <div class="tagline spacer-b20 spacer-t20">
                            <span>Выбор специализации</span>
                        </div>

                        <div class="section">
                            <p class="small-text fine-grey align-center">Распределите приоритеты в случае подачи документов на <strong>факультет английского языка</strong> дневной формы обучения</p>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm3">
                                <p class="small-text fine-grey align-center">Приоритет 1</p>
                                <label class="field select">
                                    <select id="priority1"  name="priority1">
                                        <option value="">Название специализации</option>
                                        <#if priorities??>
                                            <#list priorities as priority>
                                                <option value="${priority.id}" class="smartfm-ctrl" <#if profile.priority1??><#if profile.priority1.id == priority.id>selected</#if></#if>>${priority.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm3">
                                <p class="small-text fine-grey align-center">Приоритет 2</p>
                                <label class="field select">
                                    <select id="priority2"  name="priority2">
                                        <option value="">Название специализации</option>
                                        <#if priorities??>
                                            <#list priorities as priority>
                                                <option value="${priority.id}" class="smartfm-ctrl" <#if profile.priority2??><#if profile.priority2.id == priority.id>selected</#if></#if>>${priority.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm3">
                                <p class="small-text fine-grey align-center">Приоритет 3</p>
                                <label class="field select">
                                    <select id="priority3"  name="priority3">
                                        <option value="">Название специализации</option>
                                        <#if priorities??>
                                            <#list priorities as priority>
                                                <option value="${priority.id}" class="smartfm-ctrl" <#if profile.priority3??><#if profile.priority3.id == priority.id>selected</#if></#if>>${priority.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm3">
                                <p class="small-text fine-grey align-center">Приоритет 4</p>
                                <label class="field select">
                                    <select id="priority4"  name="priority4">
                                        <option value="">Название специализации</option>
                                        <#if priorities??>
                                            <#list priorities as priority>
                                                <option value="${priority.id}" class="smartfm-ctrl" <#if profile.priority4??><#if profile.priority4.id == priority.id>selected</#if></#if>>${priority.fullName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                        </div>

                    </fieldset>




























                    <h2>Сведения о родителях</h2>
                    <fieldset>
                        <div class="frm-row ">
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t40">
                                    <span>Мать / Опекун 1</span>
                                </div>

                                <#if motherLegalError??>
                                    <div class="notification alert-error spacer-t10 spacer-b10">
                                        <p>${motherLegalError}</p>
                                    </div>
                                </#if>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="lnameM" id="lnameM" class="gui-input" placeholder="Фамилия матери" value="<#if parentM??><#if parentM.lastName??>${parentM.lastName}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="fnameM" id="fnameM" class="gui-input" placeholder="Имя матери" value="<#if parentM??><#if parentM.firstName??>${parentM.firstName}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="mnameM" id="mnameM" class="gui-input" placeholder="Отчество матери" value="<#if parentM??><#if parentM.middleName??>${parentM.middleName}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field spacer-b10">
                                        <input type="tel" id="phoneMUtils" name="phoneMUtils" class="gui-input" placeholder="Мобильный телефон матери" value="+375<#if parentM??><#if parentM.phone??>${parentM.phone}</#if></#if>">
                                        <input type="hidden" id="phoneResultM" name="phoneM">
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="wplaceM" id="wplaceM" class="gui-input" placeholder="Место работы матери" value="<#if parentM??><#if parentM.workPlace??>${parentM.workPlace}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-building"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="wpositionM" id="wpositionM" class="gui-input" placeholder="Занимая должность матери" value="<#if parentM??><#if parentM.position??>${parentM.position}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field select prepend-icon <#if addressMError??>state-error</#if>">
                                        <input type="text" name="addressM" id="addressM" class="gui-input" placeholder="Адрес регистрации матери" <#if addressMError??>aria-describedby="addressM-error" aria-invalid="true"</#if> value="<#if parentM??><#if parentM.address??>${parentM.address}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                    </label>
                                    <#if addressMError??><em id="addressM-error" class="state-error">${addressMError}</em></#if>
                                    <label for="addressM" class="field-label">
                                        <p class="small-text fine-grey"><b>Например:</b> 213206, Могилёвская обл., г.Чаусы, ул.Центральная д.32 кв.5</p>
                                    </label>
                                </div>

                            </div>
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t40">
                                    <span>Отец / Опекун 2</span>
                                </div>

                                <#if fatherLegalError??>
                                    <div class="notification alert-error spacer-t10 spacer-b10">
                                        <p>${fatherLegalError}</p>
                                    </div>
                                </#if>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="lnameF" id="lnameF" class="gui-input" placeholder="Фамилия отца" value="<#if parentF??><#if parentF.lastName??>${parentF.lastName}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="fnameF" id="fnameF" class="gui-input" placeholder="Имя отца" value="<#if parentF??><#if parentF.firstName??>${parentF.firstName}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="mnameF" id="mnameF" class="gui-input" placeholder="Отчество отца" value="<#if parentF??><#if parentF.middleName??>${parentF.middleName}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-user"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field spacer-b10">
                                        <input type="tel" id="phoneFUtils" name="phoneFUtils" class="gui-input" placeholder="Мобильный телефон отца" value="<#if parentF??><#if parentF.phone??>${parentF.phone}</#if></#if>">
                                        <input type="hidden" id="phoneResultF" name="phoneF">
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="wplaceF" id="wplaceF" class="gui-input" placeholder="Место работы отца" value="<#if parentF??><#if parentF.workPlace??>${parentF.workPlace}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-building"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field prepend-icon spacer-b10">
                                        <input type="text" name="wpositionF" id="wpositionF" class="gui-input" placeholder="Занимая должность отца" value="<#if parentF??><#if parentF.position??>${parentF.position}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                    </label>
                                </div>

                                <div class="colm colm12">
                                    <label class="field select prepend-icon <#if addressFError??>state-error</#if>">
                                        <input type="text" name="addressF" id="addressF" class="gui-input" placeholder="Адрес регистрации отца" <#if addressFError??>aria-describedby="addressF-error" aria-invalid="true"</#if> value="<#if parentF??><#if parentF.address??>${parentF.address}</#if></#if>">
                                        <span class="field-icon"><i class="fa fa-map-marker"></i></span>
                                    </label>
                                    <#if addressFError??><em id="addressF-error" class="state-error">${addressFError}</em></#if>
                                    <label for="addressF" class="field-label">
                                        <p class="small-text fine-grey"><b>Например:</b> 213206, Могилёвская обл., г.Чаусы, ул.Центральная д.32 кв.5</p>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="tagline spacer-b20 spacer-t20">
                            <span>Информация о законном представителе <u>несовершеннолетнего</u></span>
                        </div>

                        <div class="section">
                            <p class="small-text fine-grey align-center">В случае подачи документов на платную форму обучения данные законного представителя будут указаны в форме договора на обучение. Если Вам исполнилось 18 лет на момент подачи заявления, то пропустите данную форму.</p>
                        </div>

                        <#if legalRepresentativeError??>
                            <div class="notification alert-error spacer-t10 spacer-b10">
                                <p>${legalRepresentativeError}</p>
                            </div>
                        </#if>

                        <div class="frm-row">
                            <div class="section colm colm5">
                                <span>Выберите законного представителя </span>
                            </div>

                            <div class="section colm colm7">
                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">

                                        <label for="nonelegalRadio" class="option">
                                            <input type="radio" name="legalRepresentative" id="nonelegalRadio" value="noneRepresentative" checked="">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i> не имею законного представителя, я совершеннолетний(яя)
                                                </span>
                                            </span>
                                        </label>

                                        <label for="mlegalRadio" class="option">
                                            <input type="radio" name="legalRepresentative" id="mlegalRadio" value="mother" <#if parentM??><#if parentM.legalRepresentative>checked</#if></#if>>
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i> Мать / Опекун 1
                                                </span>
                                            </span>
                                        </label>

                                        <label for="flegalRadio" class="option">
                                            <input type="radio" name="legalRepresentative" id="flegalRadio" value="father" <#if parentF??><#if parentF.legalRepresentative>checked</#if></#if>>
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i> Отец / Опекун 2
                                                </span>
                                            </span>
                                        </label>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->
                            </div>
                        </div>

                        <#if legalRepresentativePassportError??>
                            <div class="notification alert-error spacer-t10 spacer-b10">
                                <p>${legalRepresentativePassportError}</p>
                            </div>
                        </#if>

                        <div class="frm-row">
                            <div class="section colm colm4">
                                <label class="field select prepend-icon <#if docTypeLegalError??>state-error</#if>">
                                    <select id="docTypeLegal" name="docTypeLegal">
                                        <option value='' class="smartfm-ctrl">Выберите тип документа</option>
                                        <#list documents as doc>
                                            <option value='${doc.id}' class="smartfm-ctrl" <#if profile.docTypeLegal??><#if profile.docTypeLegal.id == doc.id>selected</#if></#if>>${doc.type}</option>
                                        </#list>
                                    </select>
                                    <#if docTypeLegalError??><em id="docTypeLegal-error" class="state-error">${docTypeLegalError}</em></#if>
                                    <span class="field-icon"><i class="fa fa-book"></i></span>
                                    <i class="arrow double"></i>
                                </label>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if docSeriesLegalError??>state-error</#if>">
                                    <input type="text" name="docSeriesLegal" id="docSeriesLegal" class="gui-input latinoUP" placeholder="Серия" <#if docSeriesLegalError??>aria-describedby="docSeriesLegal-error" aria-invalid="true"</#if> value="<#if profile.docSeriesLegal??>${profile.docSeriesLegal}</#if>">
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                                <#if docSeriesLegalError??><em id="docSeriesLegal-error" class="state-error">${docSeriesLegalError}</em></#if>
                            </div>

                            <div class="section colm colm4">
                                <label class="field prepend-icon <#if docNumberLegalError??>state-error</#if>">
                                    <input type="text" name="docNumberLegal" id="docNumberLegal" class="gui-input" placeholder="Номер" <#if docNumberLegalError??>aria-describedby="docNumberLegal-error" aria-invalid="true"</#if> value="<#if profile.docNumberLegal??>${profile.docNumberLegal}</#if>">
                                    <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                </label>
                                <#if docNumberLegalError??><em id="docNumberLegal-error" class="state-error">${docNumberLegalError}</em></#if>
                            </div>
                        </div>

                        <div id="additionalDoc" class="hiddenbox section smartform-reset">
                            <div class="frm-row">
                                <div class="section colm colm4 <#if personalNumberLegalError??>state-error</#if>">
                                    <label class="field prepend-icon">
                                        <input type="text" name="personalNumberLegal" id="personalNumberLegal" class="gui-input latinoUP" placeholder="Личный номер" <#if personalNumberLegalError??>aria-describedby="personalNumberLegal-error" aria-invalid="true"</#if> value="<#if profile.personalNumberLegal??>${profile.personalNumberLegal}</#if>">
                                        <b class="tooltip tip-left-top"><em>Личный номер состоит из цифр и латинских букв.</em></b>
                                        <span class="field-icon"><i class="fa fa-id-card"></i></span>
                                    </label>
                                    <#if personalNumberLegalError??><em id="personalNumberLegal-error" class="state-error">${personalNumberLegalError}</em></#if>
                                </div>

                                <div class="section colm colm4">
                                    <label class="field prepend-icon <#if docOnDateLegalError??>state-error</#if>">
                                        <input type="text" id="docOnDateLegal" name="docOnDateLegal" class="gui-input" placeholder="Дата выдачи" <#if docOnDateLegalError??>aria-describedby="docOnDateLegal-error" aria-invalid="true"</#if> value="<#if profile.docOnDateLegal??>${profile.docOnDateLegal?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</#if>">
                                        <b class="tooltip tip-left-top"><em>Вы можете ввести дату в формате ДД.ММ.ГГГГ, Например: 01.10.2025</em></b>
                                        <span class="field-icon"><i class="fa fa-hourglass-start"></i></span>
                                    </label>
                                    <#if docOnDateLegalError??><em id="docOnDateLegal-error" class="state-error">${docOnDateLegalError}</em></#if>
                                </div>

                                <div class="section colm colm4">
                                    <label class="field prepend-icon <#if docOffDateLegalError??>state-error</#if>">
                                        <input type="text" id="docOffDateLegal" name="docOffDateLegal" class="gui-input" placeholder="Дата окончания действия" <#if docOffDateLegalError??>aria-describedby="docOffDateLegal-error" aria-invalid="true"</#if> value="<#if profile.docOffDateLegal??>${profile.docOffDateLegal?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}</#if>">
                                        <b class="tooltip tip-left-top"><em>Вы можете ввести дату в формате ДД.ММ.ГГГГ, Например: 01.10.2025</em></b>
                                        <span class="field-icon"><i class="fa fa-hourglass-end"></i></span>
                                    </label>
                                    <#if docOffDateLegalError??><em id="docOffDateLegal-error" class="state-error">${docOffDateLegalError}</em></#if>
                                </div>
                            </div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="field prepend-icon <#if docIssuedByLegalError??>state-error</#if>">
                                    <input type="text" name="docIssuedByLegal" id="docIssuedByLegal" class="gui-input" placeholder="Кем выдан" <#if docIssuedByLegalError??>aria-describedby="docIssuedByLegal-error" aria-invalid="true"</#if> value="<#if profile.docIssuedByLegal??>${profile.docIssuedByLegal}</#if>">
                                    <span class="field-icon"><i class="fa fa-handshake"></i></span>
                                </label>
                                <#if docIssuedByLegalError??><em id="docIssuedByLegal-error" class="state-error">${docIssuedByLegalError}</em></#if>
                            </div>
                        </div>
                    </fieldset>

















                    <h2>Внеучебная деятельность</h2>
                    <fieldset>
                        <div class="frm-row ">
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t40">
                                    <span>Членство в общественных организациях</span>
                                </div>

                                <p class="small-text fine-grey align-center">Указать при наличии</p>

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">

                                        <#list publicOrganizations as pOrg>
                                            <label class="option">
                                                <input type="checkbox" name="publicOrganizationList" value="${pOrg.id}"
                                                        <#if profile.publicOrganizationList??>
                                                            <#list profile.publicOrganizationList as pOrgCheck>
                                                                <#if pOrgCheck.id == pOrg.id>checked</#if>
                                                            </#list>
                                                        </#if>>
                                                <span class="smart-option smart-checkbox">
                                                <span class="smart-option-ui">
                                                    <i class="fa"></i> ${pOrg.fullName}
                                                    <span class="iconc-pos"> <i class="fa fa-check"></i> </span>
                                                </span>
                                            </span>
                                            </label>
                                        </#list>

                                        <label class="field prepend-icon spacer-t10 <#if otherPublicOrganizationError??>state-error</#if>">
                                            <input type="text" name="otherPublicOrganization" id="otherPublicOrganization" class="gui-input" placeholder="иные организации (указать)" <#if otherPublicOrganizationError??>aria-describedby="otherPublicOrganization-error" aria-invalid="true"</#if> value="<#if profile.otherPublicOrganization??>${profile.otherPublicOrganization}</#if>">
                                            <span class="field-icon"><i class="fa"></i></span>
                                            <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                        </label>
                                        <#if otherPublicOrganizationError??><em id="otherPublicOrganization-error" class="state-error">${otherPublicOrganizationError}</em></#if>

                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->

                            </div>
                            <div class="section colm colm6">
                                <div class="tagline spacer-b30 spacer-t40">
                                    <span>Виды творчества и хобби</span>
                                </div><!-- .tagline -->

                                <p class="small-text fine-grey align-center">Указать при наличии</p>

                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">

                                        <#list creativities as cr>
                                            <label class="option">
                                                <input type="checkbox" name="creativityList" value="${cr.id}"
                                                        <#if profile.creativityList??>
                                                            <#list profile.creativityList as crCheck>
                                                                <#if crCheck.id == cr.id>checked</#if>
                                                            </#list>
                                                        </#if>>
                                                <span class="smart-option smart-checkbox">
                                                <span class="smart-option-ui">
                                                    <i class="fa"></i> ${cr.fullName}
                                                    <span class="iconc-pos"> <i class="fa fa-check"></i> </span>
                                                </span>
                                            </span>
                                            </label>
                                        </#list>

                                        <label class="field prepend-icon spacer-t10 <#if otherCreativityError??>state-error</#if>">
                                            <input type="text" name="otherCreativity" id="otherCreativity" class="gui-input" placeholder="иной вид творчества или хобби(указать)" <#if otherCreativityError??>aria-describedby="otherCreativity-error" aria-invalid="true"</#if> value="<#if profile.otherCreativity??>${profile.otherCreativity}</#if>">
                                            <span class="field-icon"><i class="fa"></i></span>
                                            <span class="field-icon"><i class="fa fa-check-circle"></i></span>
                                        </label>
                                        <#if otherCreativityError??><em id="otherCreativity-error" class="state-error">${otherCreativityError}</em></#if>
                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->
                            </div>
                        </div>
                        <div class="frm-row">
                            <div class="section colm colm12">
                                <label class="field prepend-icon <#if achievementListError??>state-error</#if>">
                                    <textarea class="gui-textarea" id="achievementList" name="achievementList" placeholder="Какие Вы имеете достижения (грамоты, дипломы, иные награды) в общественной и творческой деятельности" <#if achievementListError??>aria-describedby="achievementList-error" aria-invalid="true"</#if>><#if profile.achievementList??>${profile.achievementList}</#if></textarea>
                                    <span class="field-icon"><i class="fa fa-comments"></i></span>
                                    <span class="input-hint"> <strong>Примечание:</strong> Здесь можно перечислить Ваши достижения.</span>
                                </label>
                                <#if achievementListError??><em id="achievementList-error" class="state-error">${achievementListError}</em></#if>
                            </div><!-- end section -->
                        </div>


                        <div class="tagline spacer-b20 spacer-t20">
                            <span>Спортивная деятельность</span>
                        </div><!-- .tagline -->

                        <div class="section">
                            <p class="small-text fine-grey align-center">Указать при наличии</p>
                        </div>

                        <div class="frm-row">

                            <div class="section colm colm7">
                                <label class="switch switch-round switch-black spacer-b10">
                                    <span>Член сборной команды Республики Беларусь по виду спорта </span>
                                    <input type="checkbox" name="memberNationalTeam" id="memberNationalTeam" <#if profile.memberNationalTeam>checked</#if>>
                                    <span class="switch-label" data-on="Да" data-off="Нет"></span>
                                </label>

                                <label class="field prepend-icon spacer-t20 <#if sportListError??>state-error</#if>">
                                    <textarea class="gui-textarea" id="sportList" name="sportList" placeholder="Укажите каким видом спорта Вы занимаетесь, либо занимались" <#if sportListError??>aria-describedby="sportList-error" aria-invalid="true"</#if>><#if profile.sportList??>${profile.sportList}</#if></textarea>
                                    <span class="field-icon"><i class="fa fa-comments"></i></span>
                                    <span class="input-hint"> <strong>Примечание:</strong> Здесь можно перечислить виды спорта.</span>
                                </label>
                                <#if sportListError??><em id="sportList-error" class="state-error">${sportListError}</em></#if>
                            </div><!-- end section -->

                            <div class="section colm colm5">

                                <div class="section align-center spacer-b10">
                                    <h3>Спортивное звание</h3>
                                </div>


                                <div class="option-group field">
                                    <div class="smart-option-group smart-option-list group-vertical">

                                        <label for="spTNone" class="option">
                                            <input type="radio" name="sportTitle" id="spTNone" value="" checked="">
                                            <span class="smart-option smart-radio">
                                                <span class="smart-option-ui">
                                                    <i class="iconc"></i> не имею
                                                </span>
                                            </span>
                                        </label>

                                        <#list sportTitles as spT>
                                            <label for="${spT.letterCode}" class="option">
                                                <input type="radio" id="${spT.letterCode}" name="sportTitle" value="${spT.id}" <#if profile.sportTitle??><#if profile.sportTitle.id == spT.id>checked</#if></#if>>
                                                <span class="smart-option smart-radio">
                                                    <span class="smart-option-ui">
                                                        <i class="iconc"></i> ${spT.fullName}
                                                    </span>
                                                </span>
                                            </label>
                                        </#list>

                                    </div><!--  smart-option-group -->
                                </div><!-- end .option-group section -->
                            </div>



                        </div><!-- end .frm-row section -->

                        <div class="tagline spacer-b20 spacer-t20">
                            <span>Фото</span>
                        </div><!-- .tagline -->

                        <div class="section">
                            <p class="small-text fine-grey align-center">Загрузите Ваше фото</p>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm12">
                                <p>1. Требования по фото представлены по следующей <a href="/images/photoRules.jpg" target="_blank">ссылке.</a></p>
                                <p>2. Формат фотографий в электронном виде должен иметь разрешения <strong>JPG</strong> или <strong>JPEG.</strong></p>
                                <p>3. Размер фотографий не должен превышать 200 кБ.</p>
                            </div>
                        </div><!-- end frm-row section -->
                        <div id="smart-modal1" class="smartforms-modal" role="alert">
                            <p>sdsdds</p>
                        </div>

                        <#if profile.photoFile?has_content>
                            <div class="frm-row">
                                <div class="section colm colm12 align-center">
                                    <h3>Ваша фотография на текущий момент выглядит вот так: </h3>
                                </div>
                                <div class="section colm colm12 align-center">
                                    <img src="/img/${profile.photoFile}" height="200px">
                                </div>
                            </div>
                        </#if>

                        <#if photoError??>
                            <div class="notification alert-error spacer-t10 spacer-b10">
                                <p>${photoError}</p>
                            </div>
                        </#if>

                        <div class="section">
                            <label class="field prepend-icon file">
                                <span class="button btn-primary"> Выбрать файл </span>
                                <input type="file" class="gui-file" name="photoAbit" >
                                <input type="text" class="gui-input" placeholder="Выберите фото для загузки" readonly>
                                <input type="hidden" name="photoFile" value="<#if profile.photoFile?has_content>${profile.photoFile}</#if>">
                                <span class="field-icon"><i class="fa fa-upload"></i></span>
                            </label>
                        </div><!-- section -->


                        <div class="frm-row">
                            <div class="spacer spacer-t20 spacer-b20"></div>
                        </div>

                        <div class="frm-row">
                            <div class="section colm colm12 align-center">
                                <h3>Убедительно просим Вас ещё раз проверить информацию, которая была введена в данную анкету!</br>Последующие изменения в анкету можно внести только на этапе подачи документов в приемную комиссию .</h3>
                                <input type="hidden" name="id" value="<#if profile.id??>${profile.id}</#if>">
                                <input type="hidden" name="typeCompetition" value="<#if profile.typeCompetition??>${profile.typeCompetition.id}</#if>">
                                <input type="hidden" name="caseNumber" value="<#if profile.caseNumber??>${profile.caseNumber}</#if>">
<#--                                <input type="hidden" name="MId" value="<#if parentM??>${parentM.id}</#if>">-->
<#--                                <input type="hidden" name="FId" value="<#if parentF??>${parentF.id}</#if>">-->
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                            </div>
                        </div><!-- end frm-row section -->

                    </fieldset>
                </form>
            </div><!-- end .form-body section -->

        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
</@c.page>