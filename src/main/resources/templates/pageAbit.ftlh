<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div class="smart-wrap" xmlns:display="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">
        <div class="smart-forms smart-container wrap-0">
            <div class="form-body smart-steps stp-four">
                <div class="align-center">
                    <h1><#if abit??>${abit.lastNameRus} ${abit.firstNameRus}</#if></h1>
                    <p>Информация в анкете на текущий момент</p>
                </div>

                <p class="operation-text">Факультет: ${abit.specialty.faculty.fullName?string}: ${abit.specialty.fullName?string}</p>
                <p>Форма обучения: <span class="operation-text">${abit.specialty.typeEducationForm.shortName}</span></p>
                <p>Форма договора на обучение: <span class="operation-text">${abit.specialty.typeEducationContract.shortName}</span></p>

                <p><a href="/editprofile?abitId=${abit.user.id?int}">Редактировать профиль</a></p>
                <p><a href="/apply-form-editor?abitId=${abit.user.id?int}">Заявление</a></p>
                <p><a href="/contract-form-editor?abitId=${abit.user.id?int}">Договор</a></p>
                <p><a href="/anketa-form-editor?abitId=${abit.user.id?int}">Анкета</a></p>
                <div class="section colm colm4">
                    <p class="small-text fine-grey align-center">Вид конкурса и номер дела</p>

                    <form method="post" action="/editor" id="typeCompetitionAndCaseNumber">
                        <div class="frm-row">
                            <div class="section colm colm4">
                                <div class="frm-row">
                                    <div class="section colm colm12">
                                        <label class="field select">
                                            <select id="typeCompetition" name="typeCompetition">
                                                <option value="">Вид конкурса</option>
                                                <#list competitions as cmpt>
                                                    <option value='${cmpt.id}' class="smartfm-ctrl" <#if abit.typeCompetition??><#if abit.typeCompetition.id == cmpt.id>selected</#if></#if>>${cmpt.name}</option>
                                                </#list>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
                                </div>
                                <div class="frm-row">
                                    <div class="section colm colm12">
                                        <label class="field prepend-icon">
                                            <input type="text" name="caseNumber" id="caseNumber" class="gui-input" placeholder="Номер личного дела (только цифры)" value="<#if abit.caseNumber??>${abit.caseNumber}</#if>">
                                            <b class="tooltip tip-left-top"><em>Номер личного дела вводится только цифрами</em></b>
                                            <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="frm-row">
                                    <div class="section colm colm12">
                                        </label>
                                            <input type="hidden" name="profileID" id="profileID" value="${abit.id}">
                                        </label>
                                    </div>
                                </div>
                                <div class="frm-row">
                                    <div class="section colm colm12">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="gui-input" value="Отправить">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>


            </div>
        </div>
    </div>
</@c.page>