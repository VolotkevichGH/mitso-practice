<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-2-5">

            <div class="form-header header-login">
                <h4><i class="fa fa-pencil-square"></i>Создать аккаунт</h4>
            </div>

            <form method="post" action="/registration" id="registration">
                <#if message??>
                    <p style="color: red;" class="align-center">${message}</p>
                </#if>
                <div class="form-body theme-blue">

                    <div class="spacer-b30">
                        <div class="tagline">
                            <span>Электронная почта</span>
                        </div>
                    </div>
                    <div class="section">
                        <label class="field prepend-icon <#if emailError??>state-error</#if>">
                            <input type="text" name="email" id="email" class="gui-input" placeholder="example@domain.com" <#if emailError??>aria-describedby="email-error" aria-invalid="true"</#if> value="<#if user.email??>${user.email}</#if>">
                            <span class="field-icon"><i class="fa fa-envelope"></i></span>
                        </label>
                        <#if emailError??><em id="email-error" class="state-error">${emailError}</em></#if>
                    </div>
                    <div class="section">
                        <label class="field prepend-icon <#if passwordError??>state-error</#if>">
                            <input type="password" name="password" id="password" class="gui-input" placeholder="Пароль" <#if passwordError??>aria-describedby="password-error" aria-invalid="true"</#if>>
                            <span class="field-icon"><i class="fa fa-lock"></i></span>
                        </label>
                        <#if passwordError??><em id="password-error" class="state-error">${passwordError}</em></#if>
                    </div>

                    <div class="section">
                        <label class="field prepend-icon <#if passwordConfirmationError??>state-error</#if>">
                            <input type="password" name="passwordConfirmation" id="passwordConfirmation" class="gui-input" placeholder="Подтверждение пароля" <#if passwordConfirmationError??>aria-describedby="passwordConfirmation-error" aria-invalid="true"</#if>>
                            <span class="field-icon"><i class="fa fa-unlock-alt"></i></span>
                        </label>
                        <#if passwordConfirmationError??><em id="passwordConfirmation-error" class="state-error">${passwordConfirmationError}</em></#if>
                    </div>
                    <div class="spacer-b30 spacer-t30">
                        <div class="tagline">
                            <span>Документ, удостоверяющий личность</span>
                        </div>
                    </div>
                    <div class="frm-row">
                        <div class="section colm colm12">
                            <label class="field select prepend-icon <#if docTypeError??>state-error</#if>">
                                <select id="docType" name="docType">
                                    <option value='' class="smartfm-ctrl">Выберите тип документа</option>
                                    <#list documents as doc>

                                        <option value='${doc.id?int}' class="smartfm-ctrl" data-show-id="additionalP" <#if user.docType??><#if user.docType.id == doc.id>selected</#if></#if>>${doc.type}</option>
                                    </#list>
                                </select>
                                <i class="arrow double"></i>
                                <span class="field-icon"><i class="fa fa-book"></i></span>
                            </label>
                            <#if docTypeError??><em id="docType-error" class="state-error">${docTypeError}</em></#if>
                        </div>
                    </div>
                    <div class="frm-row">
                        <div class="section colm colm6">
                            <label for="day" class="field prepend-icon <#if docSeriesError??>state-error</#if>">
                                <input type="text" name="docSeries" id="docSeries" class="gui-input latinoUP" placeholder="Серия" <#if docSeriesError??>aria-describedby="docSeries-error" aria-invalid="true"</#if> value="<#if user.docSeries??>${user.docSeries}</#if>">
                                <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                            </label>
                            <#if docSeriesError??><em id="docSeries-error" class="state-error">${docSeriesError}</em></#if>
                        </div>

                        <div class="section colm colm6">
                            <label for="year" class="field prepend-icon <#if docNumberError??>state-error</#if>">
                                <input type="text" name="docNumber" id="dnumber" class="gui-input" placeholder="Номер" <#if docNumberError??>aria-describedby="docNumber-error" aria-invalid="true"</#if> value="<#if user.docNumber??>${user.docNumber}</#if>">
                                <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                            </label>
                            <#if docNumberError??><em id="docNumber-error" class="state-error">${docNumberError}</em></#if>
                        </div>

                    </div>
<#--                    <div class="frm-row">-->
<#--                        <div class="section colm colm12">-->
<#--                            <div class="g-recaptcha" data-sitekey="6Le53rMZAAAAANIwEC6PuNDIeklXiwGowyJFXCcb" lang="ru"></div>-->
<#--                        </div>-->
<#--                        <#if captchaError??><em id="g-recaptcha-error" class="state-error">${captchaError}</em></#if>-->
<#--                    </div>-->
                    <div class="row">
                        <p class="align-center">Создавая личный кабинет и заполняя анкету, Вы даете согласие на обработку Вашей персональной информации в компьютерной системе УО "Минский государственный лингвистический университет"</p>
                    </div>
                </div>
                <div class="form-footer">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="button btn-login">Создать аккаунт</button>
                </div>
            </form>

        </div>
    </div>
</@c.page>