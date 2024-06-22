<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-3">
            <div class="form-header header-login">
                <h4><i class="fa fa-sign-in"></i>Вход</h4>
            </div>
            <#if message??>
                <div class="notification alert-${messageType} spacer-t10">
                    <p>${message}</p>
                </div>
            </#if>
            <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                <div class="notification alert-error spacer-t10">
                    <p>Пользователь с такими данными не найден! В случае успешной регистрации проверьте Ваш электронный ящик на наличие активационного кода!</p>
                </div>
            </#if>
            <form method="post" action="/login" id="login">
                <div class="form-body theme-blue">
                    <div class="section">
                        <label class="field prepend-icon">
                            <input type="text" name="email" id="email" class="gui-input" placeholder="Введите email">
                            <span class="field-icon"><i class="fa fa-envelope"></i></span>
                        </label>
                    </div>

                    <div class="section">
                        <label class="field prepend-icon">
                            <input type="password" name="password" id="password" class="gui-input" placeholder="Введите пароль">
                            <span class="field-icon"><i class="fa fa-lock"></i></span>
                        </label>
                    </div>
                </div>
                
                <div class="form-footer">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="button btn-login">Войти</button>
                </div>
            </form>

        </div>
    </div>

    <div></div>
</@c.page>