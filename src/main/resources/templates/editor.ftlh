<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div class="smart-wrap" xmlns:display="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">
    <div class="smart-forms smart-container wrap-0">
        <div class="form-body smart-steps stp-four">
            <div class="section colm colm12">
                <#if message??>
                    <div class="notification alert-${messageType} spacer-t10">
                        <p>${message}</p>
                    </div>
                </#if>
            </div>
            <form method="post" action="/editor" id="smart-form">
                <div class="frm-row">
                    <div class="section colm colm4">
                        <label class="field select prepend-icon">
                            <select id="typeDoc" name="typeDoc">
                                <option value='' class="smartfm-ctrl" disabled>Выберите тип документа</option>
                                <#list documents as doc>
                                    <option value="${doc.id}" class="smartfm-ctrl">${doc.type}</option>
                                </#list>
                            </select>
                            <span class="field-icon"><i class="fa fa-book"></i></span>
                            <i class="arrow double"></i>
                        </label>
                    </div>

                    <div class="section colm colm4">
                        <label class="field prepend-icon">
                            <input type="text" name="serialDoc" id="serialDoc" class="gui-input " placeholder="Серия" value="">
                            <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                        </label>
                    </div>

                    <div class="section colm colm4">
                        <label class="field prepend-icon">
                            <input type="text" name="numberDoc" id="numberDoc" class="gui-input" placeholder="Номер" value="">
                            <span class="field-icon"><i class="fa fa-list-ol"></i></span>
                        </label>
                    </div>
                </div>
                <div class="frm-row">
                    <div class="section colm colm4">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="gui-input" value="Отправить">
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
</@c.page>