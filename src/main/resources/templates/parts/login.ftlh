<#macro login>
    <div class="login-block">
        <a href="/login">Войти</a>
        <span>или</span>
        <a href="/registration">Зарегистрироваться</a>
    </div>
    <div id="mobile-login-block">
        <a class="icon"  onclick="navMobileToggler()">
            <i class="fa fa-bars"></i>
        </a>
        <div id="mobile-menu">
            <a href="/login">Войти</a>
            <a href="/registration">Зарегистрироваться</a>
        </div>
    </div>
</#macro>

<#macro logout userEmail>
    <div class="login-block">
        <span>${userEmail}</span>
        <a href="/logout">Выход</a>
    </div>
    <div id="mobile-login-block">
        <a class="icon"  onclick="navMobileToggler()">
            <i class="fa fa-bars"></i>
        </a>
        <div id="mobile-menu">
            <a href="/">${userEmail}</a>
            <a href="/logout">Выход</a>
        </div>
    </div>
</#macro>